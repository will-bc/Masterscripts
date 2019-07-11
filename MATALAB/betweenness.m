function [bk,nbk]=betweenness(net)

%function [bk,nbk]=betweenness(net)
%
%compute the betweenness bk(i) of each node i
%
%That is, bk(i) is the numer of shortest paths from arbitrary pairs of
%nodes passing through node-i. nbk is normalised, i.e. nbk=bk/(n*(n-1))
%

[dn,dm]=size(net);
if dn~=dm,
    warning('adjacency matrix not square, panic!');
end;

%CreateStruct.WindowStyle='replace';
%CreateStruct.Interpreter='tex';
%hand=msgbox('Multiplying...','betweenness.m','help',CreateStruct);%,'waitbar(0,'Multiplying...');
%grandchild=get(hand,'Children');
%set(grandchild(3),'Visible','off')
%grandchild=get(grandchild(2),'Children');

bk=zeros(dn,1);
for nodei=1:dn,%repeat for each node, computing its antecedant matrix and then path weights
    
    %prime everything
    ancestor=sparse(dn,dm);
    paths=nan*ones(1,dn);
    newones=nodei;
    nnew=1; 
    pathlength=0;
    paths(newones)=pathlength;
    
    trys=1;
    %compute the sparse matrix of nodal predessors and the path lengths
    while any(isnan(paths)) && trys<1e4,
        pathlength=pathlength+1;
        %get new candidate nodes
        oldones=newones;
        newones=net(:,newones);
        %candidates must be not previously selected
        newones=newones.*(isnan(paths)'*ones(1,nnew));
        %weight newones 
        [newi,newj]=find(newones);
        newi=unique([newi,oldones(newj)],'rows');
        newj=newi(:,2);
        newi=newi(:,1);
        %update paths        
        paths(newi)=pathlength;
        %update the ancestral matrix
        ancestor=ancestor+sparse(newi,newj,pathlength,dn,dm);%need to be scaled!?
        %and finally newones
        newones=newi;
        nnew=length(newones);
        %increment 
        trys=trys+1;
    end;
    
    %run backwards through paths and ancesrot to determine betweenness ...
    bki=ones(dn,1);
    maxd=full(max(ancestor(:)));
    for d=maxd:-1:1,
        [newi,newj]=find(ancestor==d);
        sameones=sum(ancestor'==d)';
        
        bki=bki+sum(sparse(1:length(newi),newj,bki(newi)./sameones(newi),max(dn,length(newi)),dn))';
    end;

    %increment
    bk=bk+bki;   
    
 %   set(grandchild,'String',['Done ',int2str(nodei),' of ',int2str(dn)]);
 %   drawnow; 
    
end;

%bk is now the number of minimum paths passing through each node
nbk=bk./(dn*(dn-1));
%close(hand);

