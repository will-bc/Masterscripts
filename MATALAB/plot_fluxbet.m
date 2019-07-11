function plot_fluxbet(cell1,cell2);

%subplots of flow of betweenness


f=1;
r=1;

for i= 3: (size(cell1,2))
    
    figure('Name',num2str(r));
    [bg]= bestgraph(cell1{4,i},cell1{3,i});
    x=[1:size(bg,1)];
    [fc,FC,total_flo] = flow_coef_bd(bg);
    subplot(1,2,1)
     plot(x, (total_flo/1000))
    xlabel('nodos')
    ylabel('coeficiente de fluxo')
    title('Antes')
    
    
    [bg]= bestgraph(cell2{4,i},cell2{3,i});
    [fc,FC,total_flo] = flow_coef_bd(bg);
    x=[1:size(bg,1)];
    subplot(1,2,2)
    plot(x, (total_flo/1000))
    xlabel('nodos')
    ylabel('coeficiente de fluxo')
    title('Depois')
    
    r=r+0.5;
    f=f+1;
    
end