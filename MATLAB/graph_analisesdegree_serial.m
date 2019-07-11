function graph_analisesdegree_serial(cell);

for i=3:size(cell,2)
    
    [bg]= bestgraph(cell{4,i},cell{3,i});
    Graph= GraphLoadAdjacencyMatrixFromFile(bg);
    Degrees = GraphCountNodesDegree(Graph);
    h1= figure;
    % incoming:
    [y x] = hist(Degrees(:,2),unique(Degrees(:,2)));
    loglog(x,y/sum(y),'*r');
    hold on
    % outgoing
    [y x] = hist(Degrees(:,3),unique(Degrees(:,3)));
    loglog(x,y/sum(y),'dg');
    % expected distribution:
    loglog(XAxis,YAxis/sum(YAxis),':b');
    xlabel('k,Degree');
    ylabel('P(k)');
    title('Node Degree Distribution');
    legend({'Incoming','Outgoing','Expected'});
    
end



end