function [y,t]= peaks( x, window )

% [y,t] = peaks( x, window )
%
% find peaks of scalar time series
% y returns vector of peak values
% t returns vector of times of peaks
%
% window sets minimum length of trajectory for which peak is maximum
% default: window = 3 (window must be at least 3)

y=[];t=[];

if nargin<2,
  window= 3;
end;

if window<3,
  disp('window set to 3');
  window= 3;
end;

[ n, c ] = size(x);
if c ~= 1
  x = x';
  [n, c] = size(x);
end

p=0; % p counts number of peaks found
window= window-1; % make i+window end of window
minwin= window/2; % min number of windows for a peak to be a real peak
for i=1:n-window;
  [z,j]= max(x(i:i+window));
  j= min(j);
  if z > x(i) & z > x(i+window), % peak must exceed endpt values
    if p==0, % always accept first peak
      p= 1;
      y= z;
      t= i+j;
      c= 1;
    else
      if i+j == t(p), % count number of windows peak occurs in
	c(p)= c(p)+1;
      else
	if c(p) > minwin, % if peak is in enough windows, its a real peak
	  p= p+1;
	end;
	y(p)= z;
	t(p)= i+j; 
	c(p)= 1;
      end;
    end;
  end;
end;

t=t-1; % but WHY?
