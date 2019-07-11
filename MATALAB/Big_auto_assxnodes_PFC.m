% Big-auto-assxnodes- PFC alpha 
%* automatizar a palavra alpha

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat1.mat')

% PFC - t1 e t2

PFC_gamma = { 'rat'; 'event'; 'nets' ;  'assortativity ' ; ' parameters (zscore,m, n) '};
rt= 0;


prt= {}; %parameters
for i=2.5:-0.1:1
 
prt= [ prt, [1.5,2,i]];
    
end

PFC_gamma{5,2} = prt;

%1
rt=1;

%% E0

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= []; %nodos
y_ass1=[]; % assortativities
N0={};  %nets



for i=2.5:-0.1:1
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
     N0= [ N0, net ] ;
    
    [r,pk]=assortativity(net);
     y_ass1= [y_ass1,r];
    close all
 
end

    
PFC_gamma = [PFC_gamma,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')



%% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1={};




for i=2.5:-0.1:1
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
    N1=[N1,net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')


clearvars -except PFC_gamma
clc

%% 2
rt=2;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat2.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=2.5:-0.1:1
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
    N0= [N0, net]
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{rt; 'e0';N0 ; y_ass1;nan}];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

%% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1={}



for i=2.5:-0.1:1
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
    N1= [N1, net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

clearvars -except PFC_gamma
clc

%% 3
rt=3;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat3.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=2.5:-0.1:1
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
    N0= [N0, net]
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e0';N0 ; y_ass1;nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

%%

% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1={}


for i=2.5:-0.1:1
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
    N1=[ N1, net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
    
end

PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

clearvars -except PFC_gamma
clc

%% 4

rt=4;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat4.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= [];
y_ass1=[];
N0= {}


for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t1,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0= [ N0, net]
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e0';N0 ; y_ass1;nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')


%% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1= {}



for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t2,1.5,2,i);
     if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1= [N1, net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end


PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

clearvars -except PFC_gamma
clc

%% 5 

rt=5

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat5.mat');

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= [];
y_ass1=[];
N0= {}



for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t1,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0= [ N0, net]
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end


PFC_gamma = [PFC_gamma,{ rt; 'e0';N0 ; y_ass1;nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')


%% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1={}


for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t2,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1= [N1, net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

clearvars -except PFC_gamma
clc

%% 6

rt=6

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat6.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= [];
y_ass1=[];
N0= {}


for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t1,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0= [N0, net]
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e0';N0 ; y_ass1;nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')


%% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1= {}



for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t2,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1= [N1, net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

clearvars -except PFC_gamma
clc

%% 7

rt=7

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat7.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= [];
y_ass1=[];
N0= {}



for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t1,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0= [N0, net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e0';N0 ; y_ass1;nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

%% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1 = {}


for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t2,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1= [N1, net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

clearvars -except PFC_gamma
clc


%% 8 

rt= 8

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat8.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= [];
y_ass1=[];
N0= {}


for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t1,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0 = [ N0, net] 
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e0';N0 ; y_ass1;nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

%% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1= {}


for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t2,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1, net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

clearvars -except PFC_gamma
clc

%% 9 

rt= 9

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat9.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t1= gamma_filt(t1,500);

x_nodos1= [];
y_ass1=[];
N0= {}


for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t1,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0= [ N0, net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e0';N0 ; y_ass1;nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')

%save('C:\Users\CAUA\Desktop\Pre-data\data\PFC_gamma\r9-net-e0.mat','N0')

% %X1
% 
% save('C:\Users\CAUA\Desktop\Pre-data\data\PFC_gam\r9-xn-e0.mat','x_nodos1')
% 
% %Y1
% 
% save('C:\Users\CAUA\Desktop\Pre-data\data\PFC_gam\r9-yn-e0.mat','y_ass1')

%% E1

t2= gamma_filt(t2,500);

x_nodos2= [];
y_ass2=[];
N1={}


for i=2.5:-0.1:1

    [nodos]= v_clocalmaximum(t2,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1= [ N1, net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PFC_gamma = [PFC_gamma,{ rt; 'e1';N1 ; y_ass2; nan }];

save('C:\Users\CAUA\Desktop\PFC_gammaa.mat','PFC_gamma')
% 
% %X 
% 
% save('C:\Users\CAUA\Desktop\Pre-data\data\PFC_gam\r9-xn-e1.mat','x_nodos2')
% 
% %Y
% 
% save('C:\Users\CAUA\Desktop\Pre-data\data\PFC_gam\r9-yn-e1.mat','y_ass2')

clearvars -except PFC_gamma
clc