function [plot_density]= graph_density(data,nodos,control_distance_ij,C, interval)
%% Description:
%Visualization of graph density X variation of Small distance to set the
%best thershold of graph
%
%%  Input:
%data: vector column with data
%nodos: nodos of cycles
%control_distance_ij: intervals coords of cycles
%C : cycles
%interval: Vector row with 3 columns. 1º column - initial of interval
% default (0); 2 º step length and 3º end of interval. It make the 
%density analise of interval of values distances.

plot_density= [];
n=1;


for i= interval(1): interval(2):interval(3) 
   
    inform= ['Distance - Density']
    plot_density(n,1) = i
    
    [G]= small_graph(nodos,C,i, control_distance_ij);
    
    edges_ram= numedges (G);
    
    total_nodes= numnodes(G);
    
    total_edges= (total_nodes*(total_nodes-1))/(2);
    
    density= (edges_ram/total_edges);
    
    plot_density(n,2) = density;
    
    n=n+1;
    
    
    
    
end

plot(plot_density(:,1),plot_density(:,2));


end
