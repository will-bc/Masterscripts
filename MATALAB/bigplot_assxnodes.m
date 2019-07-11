function bigplot_assxnodes(cell)

% Plot assortativity in function of nodes.

nt = size(cell,2);

figure(1);



%%  Lines graph


%Legends

   signs={nan,nan};
   
   for i=3:nt
       
      signs= [signs,'-o', '-*'];
       
   end


%Plot

for i=3:nt
    
   x=[];
   y=[];
   
   for ii= 1 : length(cell{3,i})
       
   x= [x, length(cell{3,i}{1,ii})];
   y= [y, cell{4,i}(ii)];
   
   end
 
   plot(x,y, signs{i}); 
   legendInfo{i-2}= ['Rat ',num2str(cell{1,i}),' - ', cell{2,i}];
   hold on;
    
end

legend(legendInfo,'Location','southeast');
end

