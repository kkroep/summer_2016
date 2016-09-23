


colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
  [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
  [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
  [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};

i
V_in = [
2.8
3.1
3.6
5
7
11
20
30
]; 

graphics_toolkit gnuplot;

hold on;
middle = csvread("middle.csv");
plot(V_in, middle, '-*', 'Color', colorspec{2});

middle = csvread("../vbo_slope_350fF/middle.csv");
plot(V_in, middle, '-*', 'Color', colorspec{3});



middle = csvread("../vbo_slope_150fF/middle.csv");
plot(V_in, middle, '-*', 'Color', colorspec{4});



middle = csvread("../vbo_slope_50fF/middle.csv");
plot(V_in, middle, '-*', 'Color', colorspec{1});






hold off;


axis([0 30 -100000 200]);
xlabel('input voltage [V]');
ylabel('dV/dt')
legend('C0', 'C1', 'C2', 'C3', 'location', 'northeastoutside');
title('dV/dt of VBO against input voltage for all capacitances, R = 20 M\Omega');
print('-deps', '-color', '../../report/fig/vbo_vin_vs_time_sat.eps');






