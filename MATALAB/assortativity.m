function [r,pk]=assortativity(net);

%function [r,pk]=assortativity(net);
%
%compute the assortativity/disassortativity of network net
%
%-1<=r<1. r>0 implies assortativity, r<0 implies disassrotativity
%pk is the index matrix, that is there are are pk(:,3) occurence of links
%between nodes with degree pk(:,1) and pk(:,2)
%

net=net-diag(diag(net)); %exclude main diagonal
[nodei,nodej]=find(net); 
ndeg=full(sum(net));
nodei=ndeg(nodei);
nodej=ndeg(nodej);

pk=[nodei' nodej']; %the raw observed degree pairs
[pk,pki,pkj]=unique(pk,'rows');%now just the unsique members
pkn=hist(pkj,1:length(pk(:,1)));%and now with frequency counts
pk=[pk pkn'];

%from Newman (PRL 89 208701) we can compute the correlation as
m=1/length(nodei);
r=(m*sum(nodei+nodej)/2)^2;
r=(m*nodei*nodej'-r) / (m*sum(nodei.^2+nodej.^2)/2-r);
r=full(r);