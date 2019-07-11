function [nodos] = v_clocalmaximum(data,threshold, win, m)

%   Description visualization cycle local maximum(v_clocalmaximum):
%
% Visualizing amplitudes using z-score parameter to identify local maximum
% and creation of graph nodes from local maximum as cycle. 
%
%Used function findpeaks() from ANTA Small's software to find all the
%amplitudes
% 
%%  Input:
%Time series vector column (data)
%
%threshold for z-score to separate local maximum
%
%WINdow to analyze.
%
%Minimal number of standard deviations from the mean for function getpeaks
%
%Default: win= 1 
%          m=1
%
%   Output:
%Figure of visualization and graph nodes.
% Copyright (c) Willian B. C; November 21, 2017.

if nargin<3,
  win=1;
end;
if nargin<4,
  m=1;
end;


[p1,p2]= v_bestatistical(data);
    
[p,pt]= getpeaks(data,win,m);

nodos=[];

for i= 1:size(p,2)
    
%     plot(pt(i), p(i),'o');
%     nodos= [pt];
    
    zscore= (p(i) - mean(data))/std(data);
    
    if zscore > threshold                   %Only amplitudes with z-score > 1.5 is ploted
        plot(pt(i), p(i),'o');
        nodos= [nodos, pt(i)];
    end
end



legend([p1, p2], 'Mean', 'Standard deviation', 'Location', 'southeast');

end
