function [control_distance_ij,C] = small_distance(data,nodos)
%qual entrada e saida ?



data= data';


%Cycles range creation

cont=1;
C = cell(1,size(nodos,2));  %cell with cycles it will find

for i= 1:size(nodos,2)
    C{1,i}= data(1,cont:nodos(i));
    cont= nodos(i)+1;

end

% Links
 
control_distance_ij = [];  %Control of Small distance


for i= 1: size(C,2)-1      
                             
    for j= i+1:size(C,2)                % i and j, all possible cycles combinations
        
        if size(C{i},2) < size(C{j},2)
            
            min_l = C{1,i};
            max_l = C{1,j};
            
        end
        
        if size(C{i},2) > size(C{j},2)
            
            min_l = C{1,j};
            max_l = C{1,i};
            
        end
        
        sum_distance =0;
        min_sum=0;
        
        for l=0:(size(max_l,2)-size(min_l,2))
            
            for pl=1: size(min_l,2)
                
                sum_distance= [sum_distance + (( max_l(l+pl) - min_l(pl))^(2))]; %norm
                      
                
            end
            
            min_sum(l+1)= sum_distance;
        
        
        end
        
        control_distance_ij= [control_distance_ij, ( min((min_sum) / (size(min_l,2))))];   % Small distance
            
            
            
     
    end
    
end
