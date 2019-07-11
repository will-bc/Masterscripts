function teste(cell)


n0= 2;
n1= 3;

for i= 2:(size(cell,2)/2)+1
   
   
   plot(cell{1,n0},cell{3,n0}, '*', 'color', 'r');
   n0=n0+2;
   hold on ;
   
   plot(cell{1,n1},cell{3,n1}, '*', 'color', 'b');
   n1=n1+2;
   hold on;
    
end

xlabel('Rat')
ylabel('Degree')
title('Average Cluestering')
legend('bar 1','bar 2','location','northwest')



end