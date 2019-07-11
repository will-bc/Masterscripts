SI_gammm = { 'rat'; 'event'; 'nets' ;  'assortativity ' ; ' parameters (zscore,m, n) '};

rt = 7;

prt= {}; %parameters
for i=3.2:-0.05:2
 
prt= [ prt, [1.5,2,i]];
    
end

SI_gammm{5,2} = prt;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat7.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);

t6= gamma_filt(t6,500); 

y_ass2=[];
N1= {}

for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    
    [control_distance_ij,C] = small_distance(t6,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t6,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N1= [N1, net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end


SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')



