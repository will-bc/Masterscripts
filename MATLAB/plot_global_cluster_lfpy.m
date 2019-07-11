%Plot betweennesss

x=[];
y=[];
z=[];
for i= 1:size(wn_alpha{1,1},2)
x= [x, size(wn_alpha{1,1}{1,i},2)];
end
for i= 1:size(wn_alpha{2,1},2)
fc=[];FC=[];
[gc]= global_clustering(cell2mat(wn_alpha{1,1}(1,i)));
y= [y, gc];
end
for i= 2:-0.1:0
z=[z,i];
end

plot3(x,z,y,'color',[0,0,1])
xlabel('nodos')
zlabel('coeficiente de cluster global')
ylabel('z-score')
title('1s100c');
grid on
hold on

lgd= legend('10hz','10hz&Poisson','Poisson');
