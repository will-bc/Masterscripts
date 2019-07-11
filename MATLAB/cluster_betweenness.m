function cluster_betweenness(cell1,cell2)

% Plot clustering X betweennes
%Burro jeito no loop
%Input:
%
% bééééé´´e´hhhhh 


for i=2:size(cell1,2)
    
       
        plot(cell1{1,i},cell1{4,i},'color','b','marker', 'o')
        hold on
   
        
        plot( cell2{1,i},cell2{4,i},'color','r','marker', 'o')
        hold on
   
end

y= mean([cell1{4,[2:18]},cell2{4,[2:18]}]);
plot([1:9],ones(1,9)*y)
sd= std([cell1{4,[2:18]},cell2{4,[2:18]}]);
plot([1:9], ones(1,9)*(y+sd))
plot([1:9], ones(1,9)*(y-sd))

end