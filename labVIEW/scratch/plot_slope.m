[tmp] = dir;


colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
   [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
   [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
   [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};   

colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; ...
   [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
   [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
   [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};   



graphics_toolkit gnuplot;

hold on;
j=1;
for i=1:size(tmp,1)
    if(strncmp(tmp(i).name, "GaN_", 4))
        C = csvread(tmp(i).name);
        C(:,2) = abs(C(:,2).*10^-15);
        semilogy(C(:,1), C(:,2), '.','linewidth', 2, 'Color', colorspec{mod(j,12)+1});
        legend_names(j,:)=['pin', tmp(i).name(5:6)];
        j=j+1;
    end
end
hold off;

% legend(legend_names, 'location', 'northeastoutside');
%legend('DCR', 'DCR', 'illuminated', 'illuminated', 'out', 'location', 'northeastoutside');
% legend('OUT', 'VBO', 'location', 'northeastoutside');
% axis([-97 0 2e-7 4e-7]);
title('I/V curve for pin 30');
xlabel('input voltage [V]');
ylabel('Current [A]');
print('-dpdf', '-color', fullfile(pwd, 'plot_slope.pdf'));
%print('-deps', '-color', fullfile(pwd, '../../report/fig/pin30_slope.eps'))
