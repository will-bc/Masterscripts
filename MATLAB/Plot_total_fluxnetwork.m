%Plot network flow 

x=[];
y=[];
z=[];
for i= 1:size(wn_alpha{1,1},2)
x= [x, size(wn_alpha{1,1}{1,i},2)];
end
for i= 1:size(wn_alpha{2,1},2)
fc=[];FC=[];
[fc,FC]=flow_coef_bd(cell2mat(wn_alpha{1,1}(1,i)))
y= [y, FC];
end
for i= 2:-0.1:0
z=[z,i];
end

plot3(x,z,y,'color',[0,0,1])
xlabel('nodos')
zlabel('coeficiente de fluxo')
ylabel('z-score')
title('1s100c');
grid on
hold on
