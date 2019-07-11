function [p1,p2]= v_bestatistical(data)
%   Description Visualization basics estatistical(v_bestatistical) :
%
%Visualizing important statistical parameters from time series.
%
%Statistical parameters: Mean and Standart Derivation.
%
%%   Input:
%Time series vector column.
%
%   Output:
%Figure of visualization.
% Copyright (c) Willian B. C; November 21, 2017.

%% Settings


data= data';


media= ones(1,size(data,2))*mean(data);
dpp= ones(1,size(data,2))*(mean(data)+std(data)); %positives
dpn=ones(1,size(data,2))*(mean(data)-std(data));  %negatives

%Plots

figure;
area(dpp,'FaceColor',[0.9 0.9 0.9],'EdgeColor','none');
hold on;
area(dpn,'FaceColor',[0.9 0.9 0.9],'EdgeColor','none');
hold on;
plot(data,'blue'); % Ts plot
hold on;
p1= plot(media,'LineWidth',1,'Color','red','LineWidth',1.5); %Mean Plot 
hold on;
p2= plot(dpp,'LineWidth',1,'Color','green','LineWidth',1.5); % Standard deviation plot up
hold on;
plot(dpn,'LineWidth',1,'Color','green','LineWidth',1.5); % Standard deviation plot down
hold on;
title('Time Series')
end

