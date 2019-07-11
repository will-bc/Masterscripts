% Small's Propose : Cycle graphs in pseudo times series (ts), 2006
% Copyright (c) Willian B. C; October 02, 2017.

%% Visualizing important statistical parameters
%
% The pseudo times series was generate from ANTA Small's software from
% first exemple and saved the variable oscilations 'yp'.
%
%Statistical parameters: Mean and Standart Derivation

clear all
clc

load('yp.mat');


% Settings

media= ones(1,size(yp,2))*mean(yp);
dpp= ones(1,size(yp,2))*(mean(yp)+std(yp)); %positives
dpn=ones(1,size(yp,2))*(mean(yp)-std(yp));  %negatives

%Plots

figure;
subplot(3,1,1);
area(dpp,'FaceColor',[0.9 0.9 0.9],'EdgeColor','none');
hold on;
area(dpn,'FaceColor',[0.9 0.9 0.9],'EdgeColor','none');
hold on;
plot(yp,'blue'); % Ts plot
hold on;
p1= plot(media,'LineWidth',1,'Color','red','LineWidth',1.5); %Mean Plot 
hold on;
p2= plot(dpp,'LineWidth',1,'Color','green','LineWidth',1.5); % Standard deviation plot up
hold on;
plot(dpn,'LineWidth',1,'Color','green','LineWidth',1.5); % Standard deviation plot down
hold on;
title('Pseudo Time Series')

%% Visualizing amplitudes using z-score parameter to identify local maximum 
%
%Used function findpeaks() from ANTA Small's software to find all the
%amplitudes
%


    
[p,pt]=findpeaks(yp);

for i= 1:size(p,2)
    global nodos
    zscore= (p(i) - mean(yp))/std(yp); 
    
    if zscore > 1.5                        %Only amplitudes with z-score > 1.5 is ploted
        plot(pt(i), p(i),'o');
        nodos= [nodos, pt(i)];
    end
end

legend([p1, p2], 'Mean', 'Standard deviation', 'Location', 'southeast');


%% Building the graph 
%
%connection criterion: Small distance (D_{ij})

%Matrix nodos creation
global matrix
matrix= zeros(size(nodos,2),size(nodos,2));

%Cycles range creation

cont=1;
global C;
C = cell(1,size(nodos,2));  %cell with cycles it will find

for i= 1:size(nodos,2)
    C{1,i}= yp(1,cont:nodos(i));
    cont= nodos(i)+1;

end

% Links

global control_distance_ij; %Control of Small distance 
control_distance_ij = [];


for i= 1: size(C,2)-1      
                             
    for j= i+1:size(C,2)                % i and j, all possible cycles combinations
        
        if size(C{i},2) < size(C{j},2)
            
            min_l = C{1,i}
            max_l = C{1,j}
            
        end
        
        if size(C{i},2) > size(C{j},2)
            
            min_l = C{1,j}
            max_l = C{1,i}
            
        end
        
        sum_distance =0;
        min_sum=0;
        
        for l=0:(size(max_l,2)-size(min_l,2))
            
            for pl=1: size(min_l,2)
                
                sum_distance= [sum_distance + (( max_l(l+pl) - min_l(pl))^(2))]; %norm
                      
                
            end
            
            min_sum(l+1)= sum_distance;
        
        
        end
        
        control_distance_ij= [control_distance_ij, ( min((min_sum) / (size(min_l,2))))];   % Small distance
            
            
            
     
    end
    
end

thres= ((max(control_distance_ij) - min(control_distance_ij))*0.05)+ min(control_distance_ij);


contw=1

for i= 1: size(C,2)-1      
                             
    for j= i+1:size(C,2) 
        
        
        
        if control_distance_ij(contw) < thres
            
            matrix(i,j)= 1;
            
        end
        contw= contw+1
end
end
        
gp= graph(matrix, 'upper');

subplot(3,1,2);
plot(gp);
title('Pseudo Time Series Graph')
subplot(3,1,3);
plot(control_distance_ij);
hold on;
threshold= ones(1,size(control_distance_ij,2))*thres;
plot(threshold,'--','LineWidth',0.5,'Color','red');
legend('Coefficient', 'Threshold','Location','southeast');
title('Coefficient: Small distance, D_{ij}')



%% Plots Separated for better visualization

%1
figure;
hold on;
plot(control_distance_ij);
threshold= ones(1,size(control_distance_ij,2))*thres;
plot(threshold,'--','LineWidth',0.5,'Color','red');
legend('Coefficient',[ 'Threshold <', num2str(thres)],'Location', 'southeast');
title('Coefficient: Small distance, D_{ij}')


%2
figure;
plot(gp);
title('Pseudo Time Series Graph')

%3
figure;
hold on;
area(dpp,'FaceColor',[0.9 0.9 0.9],'EdgeColor','none');
area(dpn,'FaceColor',[0.9 0.9 0.9],'EdgeColor','none');
plot(yp,'blue'); % Ts plot
p1=plot(media,'LineWidth',1,'Color','red','LineWidth',1.5); %Mean Plot 
p2=plot(dpp,'LineWidth',1,'Color','green','LineWidth',1.5); % Standard deviation plot up
plot(dpn,'LineWidth',1,'Color','green','LineWidth',1.5); % Standard deviation plot down
title('Pseudo Time Series');


for i= 1:size(p,2)
    global nodos
    zscore= (p(i) - mean(yp))/std(yp); 
    
    if zscore > 1.5                        %Only amplitudes with z-score > 1.5 is ploted
        plot(pt(i), p(i),'o');
        nodos= [nodos, pt(i)];
    end
end

legend([p1, p2], 'Mean', 'Standard deviation', 'Location', 'southeast');


'GGWP'