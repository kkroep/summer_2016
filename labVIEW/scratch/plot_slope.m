[tmp] = dir;


colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
   [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
   [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
   [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};   

graphics_toolkit gnuplot;

hold on;
j=1;
for i=1:size(tmp,1)
    if(strncmp(tmp(i).name, "GaN_", 4))
        C = csvread(tmp(i).name);
        semilogy(C(:,1), abs(C(:,2)), 'linewidth', 2, 'Color', colorspec{mod(j,12)+1});
        legend_names(j,:)=['pin', tmp(i).name(5:6)];
        j=j+1;
    end
end
hold off;

legend(legend_names, 'location', 'northeastoutside');
title('I/V curve for pin 26-40');
xlabel('input voltage [V]');
ylabel('slope [dV/dt]');
print('-dpdf', '-color', fullfile(pwd, 'plot_slope.pdf'));
print('-deps', '-color', fullfile(pwd, '../../report/fig/pin26-40_slope_0-25V.eps'))
