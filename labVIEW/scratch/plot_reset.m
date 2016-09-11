[tmp] = dir;


colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
   [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
   [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
   [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};   

graphics_toolkit gnuplot;

hold on;
j=1;
for i=1:size(tmp,1)
    if(strncmp(tmp(i).name, "reset_", 6))
        C = csvread(tmp(i).name);
        plot(C(:,1), abs(C(:,2)), 'linewidth', 2, 'Color', colorspec{mod(j,12)+1});
        legend_names(j,:)=['pin', tmp(i).name(7:8)];
        j=j+1;
    end
end
hold off;

legend(legend_names, 'location', 'northeastoutside');
title('VBO reset voltage for pin 26-38');
xlabel('input voltage [V]');
ylabel('VBO during reset [V]');
print('-dpdf', '-color', fullfile(pwd, 'plot_reset.pdf'));
print('-deps', '-color', fullfile(pwd, '../../report/fig/pin26-38_reset_-25-0V.eps')) 
