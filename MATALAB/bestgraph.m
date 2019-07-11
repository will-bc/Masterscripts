function [bg]= bestgraph(assor,netss)

% Finder best graph 
%
% Input:
%
% vector of assortativities and nets: Cell array with 1x N columns 
%whose each column is a binary network 
%
%Output:
%
%binary network to deep analises


[n,idx]= max(assor);

bg= netss{idx}; 






end