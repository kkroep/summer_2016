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


measurements = [
3.0 1.520
3.2 1.770
3.4 1.930
3.6 2.110
3.8 2.280
4.0 2.360
4.2 2.430
4.4 2.510
4.6 2.570
4.8 2.660
5.0 2.690
];


measurements(:,2) = (measurements(:,2)+0.624)./0.827;


plot(measurements(:,1), measurements(:,2), 'k-+');

hold on;




hold off;
xlabel('V_g [V]');
ylabel('VBOi limit [V]')
legend('measured', 'location', 'northeastoutside');
title('effect of Vg on the voltage limiter');
print('-deps', '-color', '../report/fig/vg_vs_vbo.eps');










