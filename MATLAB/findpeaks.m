function [pp,ppt]=findpeaks(y,n,m,silent);
  
%function [p,pt]=findpeaks(y,n,m,silent);
%  
%find peaks of a time series using the fundemental period. This is
%supposed to be a parameter free and adaptive method of finding
%peaks. It works if the timeseries is not too long (it calls peaks, 
%so what can I say?), and seems to (sometimes) cleverly select the
%"true" peaks.
%
% There are in fact two parameters, n and m (both expressed in
% multiples of an underlying frequency). n is the window width and 
% m is the minimal distance between peaks.
%
% Defaults:
% n=2;
% m=0.6;
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
  n=2;
end;

%m, the fraction of the local period within which to allow 
%consecutive peaks
if isempty(m),
  m=0.6;
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
[p,pt]=peaks(y,floor(m/f));

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
  wait=waitbar(0,'findpeaks : working...');
end;

%slide window
while (i<ly)
  
  if ~silent,
    %waitbar
    waitbar(i/ly);
  end;
  
  %this window
  win=(i:min(ly,(i+window)));
  %calculate dominant period in window
  [lf,lP]=sspectrum(y(win),1);  
  [lP,ind]=max(lP);
  if isempty(ind), %make sure there is something lefts
    break;
  end;
  lf=lf(ind);     %approximate local freq.
  lp=floor(m/lf); %approximate local period.
  
  %find peaks at approximately that rate
  ind=find(pt>=i & pt<i+lp);  
  tpt=[];
  if ~isempty(ind) %any ind in this window (i,i+lp)
    [tp,tpt]=max(p(ind));
    tpt=pt(ind(tpt));
    pp=[pp tp];
    ppt=[ppt tpt];
  end;

  %slide
  if isempty(tpt),
    i=i+1;
  else,
    i=tpt+lp;
  end;
end;

if ~silent,
  close(wait);
end;

if trace>1,
  widepage;
  plot(y);
  hold on;
  plot(pt,p,'g+');
  plot(ppt,pp,'ro');
  hold off;
end;
