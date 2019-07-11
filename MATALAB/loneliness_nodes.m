function [mat,perct]= loneliness_nodes(mat);
% Receive a matrix and remove all nodes with none k=0 (no connections).
% Return the new matrix and % of nodes with k=0.

v= 0 ;
tg= length(mat);
i = 1;

   while(i<=length(mat)) 
       if(sum(mat(i,:)) == 0 && sum(mat(:,i)) == 0)
             % node i is isolated
             mat(:,i) = []; % remove its related column
             mat(i,:) = []; % remove its related row
             v=v+1        
        else
             i = i + 1;
        end
   end

perct = v/tg;



end