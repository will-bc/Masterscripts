function [y] = derivative (data)
%% Description:
%
% Do deravative (dy / dx ) = ( y2 - y1 ) / (x2 - x1)
%
%% Input
%
%    data  - two vectors column, N rows with 2 columns. First column 
%is X and second Y. 

for i=1 : size(data,1)-1
    
   y(i)= (data(i+1,2)-data(i,2))/(data(i+1,1)-data(i,1));
   
   y= y'
   
  
  
    
    
    
end


y(size(y,1)+1) =  y(size(y,1))
end