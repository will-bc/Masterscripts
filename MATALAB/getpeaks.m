function [pp,ppt]=getpeaks(y,n,m,silent);
  
%function [p,pt]=getpeaks(y,n,m,silent);
%  
%get peaks of a time series using the fundemental period. This is
%supposed to be a parameter free and adaptive method of finding
%peaks. It seems to (sometimes) cleverly select the
%"true" peaks.
%
% There are in fact two parameters, n and m (both expressed in
% multiples of an underlying frequency). n is the window width and 
% m is the minimal number of standard deviations from the mean.
%
% findpeaks works by looking for local extremum sufficiently far
% apart.
% getpeaks workd by looking for local extremum sufficiently far
% from the mean 
%
% Defaults:
% n=2;
% m=1.5;
%
% Michael Small (M.A.Small@hw.ac.uk)
% Physics, Heriot-Watt University
% 4/3/00

if nargin<4,
  silent=0;
end;
if nargin<3,
  m=[];
end;
if nargin<2,
  n=[];
end;

%n, the window width (in multiples of the fundamental freq)
if isempty(n),
  n=1;
end;

%m, the number of standard deviations from the local mean
if isempty(m),
  m=1;
end;

%we wanna vector
y=y(:);

%first of all, look at the whole time series and
%get the fundamental period
[f,P]=sspectrum(y,1);
[P,ind]=max(P);
f=f(ind); %time series fundamental frequency
if trace>1,
  disp(['dominant frequency : ', num2str(f) ,' Hz, (1/f=',num2str(1/f),')']);
end;

%use that to estimate peaks
%[p,pt]=peaks(y,floor(m/f));

%initialise
pp=[];ppt=[];
i=1;ly=length(y);
if trace>1,
  disp(['data length : ',int2str(ly)]);
end;
%take a sliding window n*fundamental period
window=floor(n/f);
if trace>1,
  disp(['time window : ',int2str(window),' (n=',int2str(n),')']);
end;
%check that there is enough data
if (window>=ly)
  disp('insufficient data, terminating.');
  return;
end;

if ~silent,
  wait=waitbar(0,'getpeaks : working...');
end;

justhalved=0;

%slide window
while (i+window<ly)

  if ~silent,
    %waitbar
    waitbar(i/ly);
  end;
  
  %this window
  win=(i:min(ly,(i+window)));
  
  %calculate the mean and standard deviation in this window
  mu=mean(y(win));
  sg=std(y(win));
  
  %find the peak bits
  hiind=find(y(win) > mu+m*sg);

  %how many do we have?
  h1=find(diff(hiind)>1);
  np=length(h1);
  
  %autoadjust, or find peaks.
  if (np<1),

    %adjust window length if its too short
    window=window*2;
    justhalved=1;
  
  elseif (np>5 & ~justhalved),
    
    %adjust window length if it is too long
    window=ceil(window/2);
    
  elseif (hiind(1)==1)
    
    %don't bother, we don't have the full picture
    i=i+1;
   
  elseif (hiind(end)==win & np==1)
    
    %don't bother, we don't have the full picture
    i=hiind(end)-1;
    
  else,
    

    %otherwise...
    %find the first peak 
    [ext,ind]=max( y(win( hiind(1):(hiind(h1(1))) )) );
    pp=[pp ext];
    ppt=[ppt ind+win(hiind(1))-1];
    
    %slide
    i=i+hiind(h1(1));
    
    justhalved=0;
  
  end; %of if (np<1) elseif (np>5)

end;

if ~silent,
  close(wait);
end;

