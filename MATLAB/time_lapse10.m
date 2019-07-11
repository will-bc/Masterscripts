function time_lapse10(net, C)

%10 best time lapses
% Ordering 10 best time lapses and show in event where he is located. 

BC=betweenness_bin(net);
bn = {'value', 'node'}; % best nodos

for i = 1:10   % creat cell array highest value betweenness centrality  X node
    [value,node]= max(BC);
    BC(node) = 0 ;
    bn {i+1,1}= value;
    bn {i+1,2}= node;

end

tl = {'slice', 'time_frequency'}

for i = 1:10 
    
    
    


end






