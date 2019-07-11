%Analizing nodes 


load('C:\Users\CAUA\Desktop\Pre-data\raw-data\rat1.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,E,[3 3],1000);


clear t2 t3 t4 t5 t6 t7 t8

t1= alpha_filt(t1,500);

x_nodos= [];
y_ass=[];


for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t1,1.5,2,i);
    x_nodos= [x_nodos,size(nodos,2)]
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
    y_ass= [y_ass,r];
    close all
 
end


