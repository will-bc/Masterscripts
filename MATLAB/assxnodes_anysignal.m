function assxnodes_anysignal(wn,name_variable,pathtosave);

%Automation algorithm to generate graphs of any signal

%Receive any signal, make graphs folliwng local standard variation
% and save the data of graphs and assortativity

%input

%wn = data
%name_variable = varible name in string value
%pathtosave = path to save in computer 

%melhorar : - Entrada de qual é o intervalo de variação e onde começar (as
%vezes não encontra nodos)
%           - Entrada da taxa de amostragem
%           - Mudar sigla wn
%           - add another filter
%           - change the filter
%           - fazer uma verificação se o vetor da dat esta em coluna e não
%           - linha(possível erro) 

%%wn= alpha_filt(wn,500);

x_nodos1= []; %nodos
y_ass1=[]; % assortativities
N0={};  %nets
wn_alpha= {};
local_variation=[];


for i= 2:-0.1:0
    i
    [nodos]= v_clocalmaximum(wn,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(wn,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(wn,nodos,control_distance_ij,C, [0 (m/1000) m]); %0.0001
    
    %Problems with decimals, junk way resolution:
    if sum(data2)==0
        control_distance_ij= control_distance_ij*10^(20);
        m= max(control_distance_ij);
        [data2]= graph_density(wn,nodos,control_distance_ij,C, [0 m*0.001 m]);
    end
    %_______________________________________________________
    
       
    [y] = derivative (data2);
        if size(y,1)==1
            
            y=y';
        
        end
        
        if size(y,1)~= size(data2,1)
            
            y(size(data2,1),1)= y(size(y,1),1);
            
        end
    
    m = max(y);    
    [~,idx] = min(abs(y(:,1) - m));
    [gp,thres,net]= small_graph(nodos,C, data2(idx,1),control_distance_ij);
     N0= [ N0, net ] ;
    
    [r,pk]=assortativity(net);
     y_ass1= [y_ass1,r];
     local_variation=[local_variation,i];
    close all
 
    wn_alpha = [{ N0 ; y_ass1;local_variation}];

    save([strcat(pathtosave,'\',name_variable)],'wn_alpha')
    
    
end
load handel
sound(y,Fs)
