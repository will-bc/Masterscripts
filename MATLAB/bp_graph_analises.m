function [table]= bp_graph_analises(cell);

% Basic properties of graph analises 
%
%
%
%Output:  Table with information
%
% Averages - 
% Clustering coeffient along rats before and during experiment 
% Degree connectivity
% Betweenness

table = {'rat'; 'event';'Degree';'Clustering' ;'Betweenness'};

for i=3:size(cell,2)

[bg]= bestgraph(cell{4,i},cell{3,i});

C=clustering_coef_bu(bg);

BC=betweenness_bin(bg);

[deg]=degrees(bg);

av_d= mean(deg);

av_c= mean(C);

av_b=mean(BC);

    table= [ table,{cell{1,i};cell{2,i};av_d;av_c;av_b}];

end

end
    
    
 


