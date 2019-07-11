function plot_walksxnodes(nets)

% Plot walks varing in function of nodes
% Input
%
% nets: Cell array with 1x N columns whose each column is a binary network 
%
%Output
%

W=[];
nodes=[];

for i= 1: length(nets)
    
    [Wq,twalk,wlq] = findwalks(nets{1,i});
    W = [W,log10(twalk)]
    clear twalk wlq Wq
    nodes= [nodes, length(nets{1,i})];   
    
end
    
plot(nodes,W);
xlabel(['nodes'])
ylaber(['walks'])
    