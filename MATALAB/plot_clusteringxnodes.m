function [gc,nodes]= plot_clusteringxnodes(nets)

% Plot clustering varing in function of nodes
% Input
%
% nets: Cell array with 1x N columns whose each column is a binary network 
%
%Output
%

gc=[];
nodes=[];

for i= 1: length(nets)
    gc = [gc,global_clustering(nets{1,i})];
    nodes= [nodes, length(nets{1,i})];    
end
    
plot(nodes,gc);
xlabel(['nodes'])
ylabel(['Clustering'])    
    

