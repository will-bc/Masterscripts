function plot_bullshitflux (rede,assor)

[bg]= bestgraph(assor,rede);
[fc,FC,total_flo] = flow_coef_bd(bg);
x=[1:size(bg,1)];
plot(x, (total_flo/1000))
    xlabel('nodos')
    ylabel('coeficiente de fluxo')
    
end