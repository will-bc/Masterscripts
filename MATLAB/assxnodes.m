%Analizing nodes 


%load

%% E0

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t1= alpha_filt(t1,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t1,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t1,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t1,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end


%% E1

t2= alpha_filt(t2,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t2,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t2,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t2,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

% %X 
% save('C:\Users\CAUA\Desktop\Pre-data\data\r9-xn-e0-alph.mat','x_nodos1')
% save('C:\Users\CAUA\Desktop\Pre-data\data\r9-xn-e1-alph.mat','x_nodos2')
% 
% %Y
% 
% save('C:\Users\CAUA\Desktop\Pre-data\data\r9-yn-e0-alph.mat','y_ass1')
% save('C:\Users\CAUA\Desktop\Pre-data\data\r9-yn-e1-alph.mat','y_ass2')

% 

%title('Nodes X Assortativity')
%xlabel('Nodes')
%ylabel(' R ')

