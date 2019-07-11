[control_distance_ij,C] = small_distance(t1,nodos);
n=1
edges=[]

for i=0:0.001:0.035
   
    inform= ['Distance - count?'];
    edges(n,1) = i;
    
    [G]= small_graph(nodos,C,i, control_distance_ij);
    
    edges(n,2)= numedges (G);
    
    
    n=n+1;
    
    
    
    
end

plot(edges(:,1),edges(:,2));
