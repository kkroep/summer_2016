% arg1 is csv location
% arg2 is eps destination
clear all;
close;
clc;

colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
  [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
  [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
  [0 0 0.4]; [0 0.4 0]; [0.4 0 0]};


graphics_toolkit gnuplot;

%% Poisson Jetser
V_in = 2.5:0.1:20;

t = 5*12.6e-6./(V_in-2.4);
t =t./2; %because we calculate half time jetsers
hold on;

plot(V_in,t);

%loglog(P_av, P_peak, 'linewidth', 4);


measurements = [
2.6 0.0002746
2.7 0.00023632
2.8 0.00018717
2.9 0.00014572
3.0 0.0001338
3.3 0.00010328
3.5 0.00009184
3.8 0.00007968
4.0 0.0000758
4.5 0.00006668
5.0 0.00006116
5.5 0.00005788
6.0 0.00005556
7   0.000053
8   0.00005056
9   0.00004872 
10  0.00004732
11  0.00004656
12  0.00004588
14  0.00004448
16  0.00004416
18  0.0000436
20  0.0000432
];  


plot(measurements(:,1), measurements(:,2)-4.02e-5, 'r');

hold off;
xlabel('input voltage [V]');
ylabel('integration time [s]')
legend('expected', 'measured', 'location', 'northeastoutside');
title('expected versus measured times to charge a capacitor of 450 fF');
print('-deps', '-color', '../report/fig/vin_vs_time_450fF.eps');










