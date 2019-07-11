% Big-auto-assxnodes- PPC

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat1.mat')

% PPC - t3 e t4

PPC_alphaa = { 'rat'; 'event'; 'nets' ;  'assortativity ' ; ' parameters (zscore,m, n) '};


prt= {}; %parameters
for i=2.9:-0.05:2
 
prt= [ prt, [2,2.i]];
    
end

PPC_alphaa{5,2} = prt;

%1

rt=0;

%% E0

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];
N0={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')




%% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];
N1={}


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end
PPC_alphaa = [PPC_alphaa,{ rt; 'e1';N1 ; y_ass2; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')

clearvars -except PPC_alphaa
clc

%% 2

rt=2

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat2.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')




%% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];
N1={}


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e1';N1 ; y_ass2; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')

clearvars -except PPC_alphaa
clc

%% 3

rt=3

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat3.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];
N0={}


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')

%% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];
N1={}


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e1';N1 ; y_ass2; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')


clearvars -except PPC_alphaa
clc

%% 4

rt=4

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat4.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];
N0={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end
PPC_alphaa = [PPC_alphaa,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')

%% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];
N1={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
     if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e1';N1 ; y_ass2; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')

clearvars -except PPC_alphaa
clc

%% 5

rt=5

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat5.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];
N0={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end
PPC_alphaa = [PPC_alphaa,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')

%% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];
N1={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e1';N1 ; y_ass2; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')



clearvars -except PPC_alphaa
clc

% %% 6
% 
% load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat6.mat')
% 
% clear spikes_ts
% [t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);
% 
% 
% t3= alpha_filt(t3,500);
% 
% x_nodos1= [];
% y_ass1=[];
% 
% 
% 
% for i=2.9:-0.05:2
% 
%     [nodos]= v_clocalmaximum(t3,1.5,2,i);
%     if size(nodos,2) >= 3000
%         
%         break
%         
%     end
%     x_nodos1= [x_nodos1,size(nodos,2)]
%     [control_distance_ij,C] = small_distance(t3,nodos);
%      m= max(control_distance_ij);
%     [data2]= graph_density(t3,nodos,control_distance_ij,C, [0 0.0001 m]);
%     [y] = derivative (data2);
%         if size(y,1)==1
%             
%             y=y';
%         
%         end
%         
%         if size(y,1)~= size(data2,1)
%             
%             y(size(data2,1),1)= y(size(y,1),1);
%             
%         end
%     
%     m = max(y);    
%     [~,idx] = min(abs(y(:,1) - m));
%     [gp,thres,net]= small_graph(nodos,C, data2(idx,1),control_distance_ij);
%     [r,pk]=assortativity(net);
%     y_ass1= [y_ass1,r];
%     close all
%  
% end
% 
% %X1
% save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_gam\r6-xn-e0.mat','x_nodos1')
% 
% %Y1
% save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_gam\r6-yn-e0.mat','y_ass1')
% 
% % E1
% 
% t4= alpha_filt(t4,500);
% 
% x_nodos2= [];
% y_ass2=[];
% 
% 
% 
% for i=2.9:-0.05:2
% 
%     [nodos]= v_clocalmaximum(t4,1.5,2,i);
%     if size(nodos,2) >= 3000
%         
%         break
%         
%     end
%     x_nodos2= [x_nodos2,size(nodos,2)]
%     [control_distance_ij,C] = small_distance(t4,nodos);
%      m= max(control_distance_ij);
%     [data2]= graph_density(t4,nodos,control_distance_ij,C, [0 0.0001 m]);
%     [y] = derivative (data2);
%         if size(y,1)==1
%             
%             y=y';
%         
%         end
%         
%         if size(y,1)~= size(data2,1)
%             
%             y(size(data2,1),1)= y(size(y,1),1);
%             
%         end
%     
%     m = max(y);    
%     [~,idx] = min(abs(y(:,1) - m));
%     [gp,thres,net]= small_graph(nodos,C, data2(idx,1),control_distance_ij);
%     [r,pk]=assortativity(net);
%     y_ass2= [y_ass2,r];
%     close all
%  
% end
% 
% %X2 
% save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_gam\r6-xn-e1.mat','x_nodos2')
% 
% %Y2
% 
% save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_gam\r6-yn-e1.mat','y_ass2')
% 
% clear all
% clc

%% 7

rt=7

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat7.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];
N0={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')



%% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];
N1={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e1';N1 ; y_ass2; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')



clearvars -except PPC_alphaa
clc


%% 8 

rt=8

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat8.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];
N0={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0=[N0,net];
    y_ass1= [y_ass1,r];
    close all
 
end
PPC_alphaa = [PPC_alphaa,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')


%% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];
N1={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e1';N1 ; y_ass2; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')

clearvars -except PPC_alphaa
clc
%% 9 
rt=9

load('C:\Users\CAUA\Desktop\Pre-data\data\Rats\rat9.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,event,[0.5 0.5],1000);


t3= alpha_filt(t3,500);

x_nodos1= [];
y_ass1=[];
N0={};


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t3,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N0=[N0,net];
    [r,pk]=assortativity(net);
    y_ass1= [y_ass1,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e0';N0 ; y_ass1; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')

%% E1

t4= alpha_filt(t4,500);

x_nodos2= [];
y_ass2=[];
N1={}


for i=2.9:-0.05:2

    [nodos]= v_clocalmaximum(t4,1.5,2,i);
    if size(nodos,2) >= 3000
        
        break
        
    end
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
    N1=[N1,net];
    [r,pk]=assortativity(net);
    y_ass2= [y_ass2,r];
    close all
 
end

PPC_alphaa = [PPC_alphaa,{ rt; 'e1';N1 ; y_ass2; nan}];

save('C:\Users\CAUA\Desktop\Pre-data\data\PPC_alpha\PPC_alpha_after.mat','PPC_alphaa')


clearvars -except PPC_alphaa
clc