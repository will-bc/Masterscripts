function graph_visualization(control_distance_ij,gp, thres)
%%  Description:
%Plot graph visualization and the threshold used
%
%% Input:
%
%control distance ij: small distances beteween cycles
%gp: the graph
%thres: Distance threshold



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
title('Time Series Graph')
end