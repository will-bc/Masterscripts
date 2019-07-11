% Big-auto-assxnodes

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat1.mat')

% PPC - t3 e t4

%1

%% E0

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r1-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r1-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r1-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r1-yn-e1.mat','y_ass2')

clear all
clc

%% 2

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat2.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r2-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r2-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r2-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r2-yn-e1.mat','y_ass2')

clear all
clc

%% 3

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat3.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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


% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r3-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r3-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r3-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r3-yn-e1.mat','y_ass2')

clear all
clc

%% 4

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat4.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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


% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r4-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r4-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r4-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r4-yn-e1.mat','y_ass2')

clear all
clc

%% 5 

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat5.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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


% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r5-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r5-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r5-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r5-yn-e1.mat','y_ass2')

clear all
clc

%% 6

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat6.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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


% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r6-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r6-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r6-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r6-yn-e1.mat','y_ass2')

clear all
clc

%% 7


load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat7.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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


% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r7-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r7-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r7-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r7-yn-e1.mat','y_ass2')

clear all
clc


%% 8 


load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat8.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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


% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r8-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r8-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r8-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r8-yn-e1.mat','y_ass2')

clear all
clc

%% 9 


load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat9.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[3 3],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t3,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
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


% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];



for i=3.2:-0.1:1

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    x_nodos2= [x_nodos2,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t4,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
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

%X 
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r9-xn-e0.mat','x_nodos1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r9-xn-e1.mat','x_nodos2')

%Y

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r9-yn-e0.mat','y_ass1')
save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_ alph\r9-yn-e1.mat','y_ass2')

clear all
clc