% Big Plot assortatiVIty X nodos 1 - excluding rat 6 
% For 2, 4
clear all
clc


cd ('C:\Users\CAUA\Desktop\Pre-data\data\VI_gam')


%%  Lines graph

figure(1)
load('r1-yn-e1.mat')
load('r1-yn-e0.mat')
load('r1-xn-e1.mat')
load('r1-xn-e0.mat')
plot(x_nodos1,y_ass1, '-o')
hold on
plot(x_nodos2,y_ass2, '-*','color','b')
lgd= legend('Rat 1 - E0','Rat 1 - E1');
lgd= legend('Rat 1 - E0','Rat 1 - E1', 'Location','southeast');
title(lgd, ' Rats - Event ')
load('r2-yn-e1.mat')
load('r2-yn-e0.mat')
load('r2-xn-e1.mat')
load('r2-xn-e0.mat')
plot(x_nodos1,y_ass1, '-o', 'color','k')
plot(x_nodos2,y_ass2, '-*','color','k')
lgd= legend('Rat 1 - E0','Rat 1 - E1','Rat 2 - E0','Rat 2 - E1', 'Location','southeast');
load('r3-yn-e1.mat')
load('r3-yn-e0.mat')
load('r3-xn-e1.mat')
load('r3-xn-e0.mat')
plot(x_nodos1,y_ass1, '-o','color', 'g')
plot(x_nodos2,y_ass2, '-*','color','g')
lgd= legend('Rat 1 - E0','Rat 1 - E1','Rat 2 - E0','Rat 2 - E1','Rat 3 - E0', 'Rat 3 - E1', 'Location','southeast');
load('r4-yn-e1.mat')
load('r4-yn-e0.mat')
load('r4-xn-e1.mat')
load('r4-xn-e0.mat')
plot(x_nodos1,y_ass1, '-o','color', 'm')
plot(x_nodos2,y_ass2, '-*','color','m')
lgd= legend('Rat 1 - E0','Rat 1 - E1','Rat 2 - E0','Rat 2 - E1','Rat 3 - E0', 'Rat 3 - E1','Rat 4 - E0','Rat 4 - E1', 'Location','southeast');
load('r5-yn-e1.mat')
load('r5-yn-e0.mat')
load('r5-xn-e1.mat')
load('r5-xn-e0.mat')
plot(x_nodos1,y_ass1, '-o','color', 'c')
plot(x_nodos2,y_ass2, '-*','color','c')
lgd= legend('Rat 1 - E0','Rat 1 - E1','Rat 2 - E0','Rat 2 - E1','Rat 3 - E0', 'Rat 3 - E1','Rat 4 - E0','Rat 4 - E1','Rat 5 - E0','Rat 5 - E1', 'Location','southeast');
load('r7-yn-e1.mat')
load('r7-yn-e0.mat')
load('r7-xn-e1.mat')
load('r7-xn-e0.mat')
plot(x_nodos1,y_ass1, '-o','color', [0.67 0.31 0.02])
plot(x_nodos2,y_ass2, '-*','color',[0.67 0.31 0.02])
lgd= legend('Rat 1 - E0','Rat 1 - E1','Rat 2 - E0','Rat 2 - E1','Rat 3 - E0', 'Rat 3 - E1','Rat 4 - E0','Rat 4 - E1','Rat 5 - E0','Rat 5 - E1','Rat 6 - E0','Rat 6 - E1','Rat 7 - E0','Rat 7 - E1', 'Location','southeast');
load('r8-yn-e1.mat')
load('r8-yn-e0.mat')
load('r8-xn-e1.mat')
load('r8-xn-e0.mat')
plot(x_nodos1,y_ass1, '-o','color',  [0.41 0.51 0.22])
plot(x_nodos2,y_ass2, '-*','color',[0.41 0.51 0.22])
lgd= legend('Rat 1 - E0','Rat 1 - E1','Rat 2 - E0','Rat 2 - E1','Rat 3 - E0', 'Rat 3 - E1','Rat 4 - E0','Rat 4 - E1','Rat 5 - E0','Rat 5 - E1','Rat 6 - E0','Rat 6 - E1','Rat 7 - E0','Rat 7 - E1','Rat 8 - E0', 'Rat 8 - E1', 'Location','southeast');
load('r9-yn-e1.mat')
load('r9-yn-e0.mat')
load('r9-xn-e1.mat')
load('r9-xn-e0.mat')
plot(x_nodos1,y_ass1, '-o','color',  [1    0.6  0 ])
plot(x_nodos2,y_ass2, '-*','color',[1    0.6  0 ])
lgd= legend('Rat 1 - E0','Rat 1 - E1','Rat 2 - E0','Rat 2 - E1','Rat 3 - E0', 'Rat 3 - E1','Rat 4 - E0','Rat 4 - E1','Rat 5 - E0','Rat 5 - E1','Rat 6 - E0','Rat 6 - E1','Rat 7 - E0','Rat 7 - E1','Rat 8 - E0', 'Rat 8 - E1','Rat 9 - E0','Rat 9 - E1', 'Location','southeast');
title(' Nodes X R ')
ylabel(' AssortatiVIty ')
xlabel(' Nodes ')
title(' Nodes X R - VI')

%% Bar graph

cd ('C:\Users\CAUA\Desktop\Pre-data\data\Rats')

figure(2)

c= categorical ({'Rat 1','Rat 2','Rat 3','Rat 4','Rat 5','Rat 6','Rat 7', 'Rat 8', 'Rat 9'} );
ap=[];
load('rat1.mat','animalPerformance')
ap=[ap, animalPerformance];
load('rat2.mat','animalPerformance')
ap=[ap, animalPerformance];
load('rat3.mat','animalPerformance')
ap=[ap, animalPerformance];
load('rat4.mat','animalPerformance')
ap=[ap, animalPerformance];
load('rat5.mat','animalPerformance')
ap=[ap, animalPerformance];
ap=[ap, 0];
load('rat7.mat','animalPerformance')
ap=[ap, animalPerformance];
load('rat8.mat','animalPerformance')
ap=[ap, animalPerformance];
load('rat9.mat','animalPerformance')
ap=[ap, animalPerformance];
cl = {'b', 'k', 'g', 'm','c','y',[0.67 0.31 0.02], [0.41 0.51 0.22],[1    0.6  0 ]};

barh(c(1),ap(1), 'FaceColor',cl{1})
hold on
barh(c(2),ap(2), 'FaceColor',cl{2})
barh(c(3),ap(3), 'FaceColor',cl{3})
barh(c(4),ap(4), 'FaceColor',cl{4})
barh(c(5),ap(5), 'FaceColor',cl{5})
barh(c(6),ap(6), 'FaceColor',cl{6})
barh(c(7),ap(7), 'FaceColor',cl{7})
barh(c(8),ap(8), 'FaceColor',cl{8})
barh(c(9),ap(9), 'FaceColor',cl{9})
ylabel('Rats')
xlabel('Performance')
title('Performance')

%% All together

f1= figure(1);
f2= figure(2);
figure (3);
h(1)=subplot(1,2,1);
h(2)=subplot(1,2,2);
copyobj(allchild(get(f1,'CurrentAxes')),h(1));
copyobj(allchild(get(f2,'CurrentAxes')),h(2));
subplot(1,2,2)
ylabel('Rats')
subplot(1,2,2)
xlabel('Performance')
subplot(1,2,2)
title('Performance')

