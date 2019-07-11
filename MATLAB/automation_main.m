%Automation algorithm to generate graphs


%%%%%%%%%%%%%%% Original
load('C:\Users\CAUA\Desktop\Pre-data\raw-data\rat1.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,E,[3 3],1000);

series_LFP= cell(1,4);
series_LFP{1,1}= 'PFC';
series_LFP{1,2}= 'PPC';
series_LFP{1,3}= 'SI';
series_LFP{1,4}= 'VI';

%----------------------- PFC data

series_LFP{2,1}= t1; %E0
series_LFP{3,1}= t2; %E1

%----------------------- PPC data

series_LFP{2,2}= t3; %E0
series_LFP{3,2}= t4; %E1 ...

%----------------------- SI data

series_LFP{2,3}= t5;
series_LFP{3,3}= t6;

%----------------------- VI data

series_LFP{2,4}= t7;
series_LFP{3,4}= t8;

clear t1 t2 t3 t4 t5 t6 t7 t8


for i=1:size(series_LFP,2)*2
    
    if i <= 4
        
    [nodos]= v_clocalmaximum(series_LFP{2,i},2.5,1,1);
    [control_distance_ij,C] = small_distance(series_LFP{2,i},nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(series_LFP{2,i},nodos,control_distance_ij,C, [0 0.001 m]);
    [y] = derivative (data2);
        if size(y,1)==1
            
            y=y'
        
        end
        
        if size(y,1)~= size(data2,1)
            
            y(size(data2,1),1)= y(size(y,1),1);
            
        end
    
    m = max(y);    
    [~,idx] = min(abs(y(:,1) - m));
    [gp,thres,net]= small_graph(nodos,C, data2(idx,1),control_distance_ij);
    close all
    series_LFP{4,i}= net;
    [r,pk]=assortativity(net);
    series_LFP{6,i}= r;
    
    
    end
    
    if i > 4
        
    [nodos]= v_clocalmaximum(series_LFP{3,i-4},2.5,1,1);
    [control_distance_ij,C] = small_distance(series_LFP{3,i-4},nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(series_LFP{3,i-4},nodos,control_distance_ij,C, [0 0.001 m]);
    [y] = derivative (data2);
        if size(y,1)== 1
            
            y=y'
        
        end
        
        if size(y,1)~= size(data2,1)
            
            y(size(data2,1),1)= y(size(y,1),1);
            
        end
    
    m = max(y);    
    [~,idx] = min(abs(y(:,1) - m));
    [gp,thres,net]= small_graph(nodos,C, data2(idx,1),control_distance_ij);
    close all
    series_LFP{5,i-4}= net;
    [r,pk]=assortativity(net);
    series_LFP{7,i-4}= r;
    end
    
end

% Para plotagem:

figure('name', 'Assorvity');

subplot(2,5,1);
plot(0:10,0:10,'color','w')
text(4,5,'Rat 1', 'FontSize', 24)
axis('off')


subplot(2,5,2);
PFC= {'E0', series_LFP{6,1}; 'E1', series_LFP{7,1}};
bar([PFC{:,2}]);
set(gca,'xticklabel',PFC(:,1));
title('PFC')  ; 

subplot(2,5,3);
PPC= {'E0', series_LFP{6,2}; 'E1', series_LFP{7,2}};
bar([PPC{:,2}]);
set(gca,'xticklabel',PPC(:,1));
title('PPC') ;

subplot(2,5,4);
SI= {'E0', series_LFP{6,3}; 'E1', series_LFP{7,3}};
bar([SI{:,2}]);
set(gca,'xticklabel',SI(:,1));
title('SI') ;

subplot(2,5,5);
VI= {'E0', series_LFP{6,4}; 'E1', series_LFP{7,4}};
bar([VI{:,2}]);
set(gca,'xticklabel',VI(:,1));
title('VI') ;


%%%R2

load('C:\Users\CAUA\Desktop\Pre-data\raw-data\rat2.mat')

clear spikes_ts
[t1,t2,t3,t4,t5,t6,t7,t8]= ts_integration(LFP,E,[3 3],1000);

series_LFP= cell(1,4);
series_LFP{1,1}= 'PFC';
series_LFP{1,2}= 'PPC';
series_LFP{1,3}= 'SI';
series_LFP{1,4}= 'VI';

%----------------------- PFC data

series_LFP{2,1}= t1; %E0
series_LFP{3,1}= t2; %E1

%----------------------- PPC data

series_LFP{2,2}= t3; %E0
series_LFP{3,2}= t4; %E1 ...

%----------------------- SI data

series_LFP{2,3}= t5;
series_LFP{3,3}= t6;

%----------------------- VI data

series_LFP{2,4}= t7;
series_LFP{3,4}= t8;

clear t1 t2 t3 t4 t5 t6 t7 t8


for i=1:size(series_LFP,2)*2
    
    if i <= 4
        
    [nodos]= v_clocalmaximum(series_LFP{2,i},2.5,1,1);
    [control_distance_ij,C] = small_distance(series_LFP{2,i},nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(series_LFP{2,i},nodos,control_distance_ij,C, [0 0.001 m]);
    [y] = derivative (data2);
        if size(y,1)==1
            
            y=y'
        
        end
        
        if size(y,1)~= size(data2,1)
            
            y(size(data2,1),1)= y(size(y,1),1);
            
        end
    
    m = max(y);    
    [~,idx] = min(abs(y(:,1) - m));
    [gp,thres,net]= small_graph(nodos,C, data2(idx,1),control_distance_ij);
    series_LFP{4,i}= net;
    [r,pk]=assortativity(net);
    series_LFP{6,i}= r;
    
    
    end
    
    if i > 4
        
    [nodos]= v_clocalmaximum(series_LFP{3,i-4},2.5,1,1);
    [control_distance_ij,C] = small_distance(series_LFP{3,i-4},nodos);
     m= max(control_distance_ij);
    [data2]= graph_density(series_LFP{3,i-4},nodos,control_distance_ij,C, [0 0.001 m]);
    [y] = derivative (data2);
        if size(y,1)== 1
            
            y=y'
        
        end
        
        if size(y,1)~= size(data2,1)
            
            y(size(data2,1),1)= y(size(y,1),1);
            
        end
    
    m = max(y);    
    [~,idx] = min(abs(y(:,1) - m));
    [gp,thres,net]= small_graph(nodos,C, data2(idx,1),control_distance_ij);
    series_LFP{5,i-4}= net;
    [r,pk]=assortativity(net);
    series_LFP{7,i-4}= r;
    end
    
end

figure(1);
subplot(2,5,6);
plot(0:10,0:10,'color','w')
text(4,5,'Rat 2', 'FontSize', 24)
axis('off')


subplot(2,5,7);
PFC= {'E0', series_LFP{6,1}; 'E1', series_LFP{7,1}};
bar([PFC{:,2}]);
set(gca,'xticklabel',PFC(:,1));
title('PFC')  ; 

subplot(2,5,8);
PPC= {'E0', series_LFP{6,2}; 'E1', series_LFP{7,2}};
bar([PPC{:,2}]);
set(gca,'xticklabel',PPC(:,1));
title('PPC') ;

subplot(2,5,9);
SI= {'E0', series_LFP{6,3}; 'E1', series_LFP{7,3}};
bar([SI{:,2}]);
set(gca,'xticklabel',SI(:,1));
title('SI') ;

subplot(2,5,10);
VI= {'E0', series_LFP{6,4}; 'E1', series_LFP{7,4}};
bar([VI{:,2}]);
set(gca,'xticklabel',VI(:,1));
title('VI');


