%Automation algorithm to generate graphs of white noise signal



wn = wgn(290000,1,-20);

wn= alpha_filt(wn,500);

x_nodos1= []; %nodos
y_ass1=[]; % assortativities
N0={};  %nets

wn_alpha= {};


for i=3:-0.05:2
    [nodos]= v_clocalmaximum(wn,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(wn,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(wn,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    close all
 
    wn_alpha = [{ N0 ; y_ass1; nan}];

    save('C:\Users\CAUA\Desktop\wn_alpha.mat','wn_alpha')
    
    
end
load handel
sound(y,Fs)
