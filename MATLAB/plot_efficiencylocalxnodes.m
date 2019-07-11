function [el]= plot_efficiencylocalxnodes(nets)

% Plot mean local efficiency varing in function of nodes
% Input
%
% nets: Cell array with 1x N columns whose each column is a binary network 
%
%Output
%

el=[];
nodes=[];

for i= 1: length(nets)
    
    E=mean(efficiency_bin(nets{1,i},1));
    E = mean(E);
    
    el = [el, E];
    
    nodes= [nodes, length(nets{1,i})];   
    
end
    
plot(nodes,el);
xlabel(['nodes'])
ylabel(['Local Efficiency'])
    