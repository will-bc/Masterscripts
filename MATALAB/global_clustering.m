function [gc]= global_clustering(net)

% Coefficient Cluster Average of all nodes in a given network 

leng = length(net);

C= clustering_coef_bu(net);

gc = sum (C)/ leng;
    