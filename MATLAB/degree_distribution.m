function [Dd,x1,y1] = degree_distribution(adj)

% Compute degree correlation P(k) = Xk / N

% X = number of vertices with k
% k = degree
% N = number of nodes

Dd={'Degree', 'P(k)'};
k = sum(adj,2);
[C,ia,ic] = unique(k);
c = hist(ic,1:max(ic));
Xk = [k(ia) c'];
x=[];  %bar plot
y=[];

for i=1:size(Xk,1)
    
   Pk=  Xk(i,2)/size(adj,1);
   Dd= [Dd;{Xk(i,1),Pk}];
   x=[x;Dd{i+1,1}];
   y=[y;Dd{i+1,2}];
   
end

x1=x;
y1=y;

bar(x,y);
title('Degree Distribution');
xlabel('k')
ylabel('P(k)')


end