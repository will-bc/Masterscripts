% Big-auto-assxnodes- SI

SI_gammm = { 'rat'; 'event'; 'nets' ;  'assortativity ' ; ' parameters (zscore,m, n) '};


prt= {}; %parameters
for i=3.2:-0.05:2
 
prt= [ prt, [1.5,2,i]];
    
end

SI_gammm{5,2} = prt;


load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat1.mat')

% SI - t5 e t6


%1

rt= 1;

%% E0

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0= [ N0, net ] 
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end


SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


clearvars -except SI_gammm
clc

%% 2

rt=2;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat2.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0= {}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')



%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')

clearvars -except SI_gammm
clc

%% 3

rt=3;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat3.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0={}



for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net]
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')

clearvars -except SI_gammm
clc

%% 4

rt=4;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat4.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0= [N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
     if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')

clearvars -except SI_gammm
clc

%% 5 

rt=5;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat5.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0={}



for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end


SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}



for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')

clearvars -except SI_gammm
clc

%% 6

rt=6;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat6.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0={};


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0=[N0,net];    
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')

%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}



for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


clearvars -except SI_gammm
clc

%% 7

rt=7;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat7.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


clearvars -except SI_gammm
clc


%% 8 

rt=8;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat8.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')

%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e1';N1 ; y_ass2;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')

clearvars -except SI_gammm
clc

%% 9 

rt=9;

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat9.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t5= gamma_filt(t5,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t5,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos1= [x_nodos1,size(nodos,2)]
    [control_distance_ij,C] = small_distance(t5,nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(t5,nodos,control_distance_ij,C, [0 0.0001 m]);
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
    N0= [N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

SI_gammm = [SI_gammm,{ rt; 'e0';N0 ; y_ass1;nan }];


save('C:\Users\CAUA\Desktop\Pre-data\data\SI_gamma\SI_gamma.mat','SI_gammm')


%% E1

t6= gamma_filt(t6,500); 

x_nodos2= [];
y_ass2=[];
N1={}


for i=3.2:-0.05:2

    [nodos]= v_clocalmaximum(t6,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
    x_nodos2= [x_nodos2,size(nodos,2)]
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

clearvars -except SI_gammm
clc