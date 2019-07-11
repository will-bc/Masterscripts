function [C]= t_netinC(net,parameters,signal)

% F.: Transforming net in C
%
%Input:
%
%network binary matrix
%
%parameters: vector 1 row, 2 columns. [ windows, local zscore ] 


[nodos]= v_clocalmaximum(signal,2,parameters(1),parameters(2));
[control_distance_ij,C] = small_distance(signal,nodos);

end