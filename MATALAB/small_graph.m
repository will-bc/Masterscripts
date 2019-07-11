function [gp,thres,matrix]= small_graph(nodos,C, thres,control_distance_ij)
%% Building graph 
%
%connection criterion: Small distance (D_{ij})
%
%%  Input:
%data - Time series
%nodos - nodos cycles


%Matrix nodos creation

matrix= zeros(size(nodos,2),size(nodos,2));


contw=1;

for i= 1: size(C,2)-1      
                             
    for j= i+1:size(C,2) 
        
        
        
        if control_distance_ij(contw) < thres
            
            matrix(i,j)= 1;
            
        end
        contw= contw+1;
end
end
        
gp= graph(matrix, 'upper');


end