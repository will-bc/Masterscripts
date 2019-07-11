function plot_anysignal_assxnodes(cell,marker,color) 

nodes=[];
assortativity=[];

for i=1:length(cell{1,1})
    
    if isnan(cell{2,1}(i))== 0
        
        nodes= [nodes,size(cell{1,1}{1,i},1)];
        assortativity= [assortativity, cell{2,1}(i)];
        
    end
    

end    
    
matrix_nodesxass= zeros(size(nodes,2),2);    



for i=1:size(nodes,2)
    
    [M,I] = min(nodes);
    matrix_nodesxass(i,1)= M;
    matrix_nodesxass(i,2)= assortativity(I);
    nodes(I)=[];
    assortativity(I)=[];
    
end

plot (matrix_nodesxass(:,1),matrix_nodesxass(:,2),marker,'color',color)
title('Assortativity X Nodes')
xlabel('Nodes')
ylabel('Assortativity')
end



