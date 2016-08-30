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
0.0 0.0
0.2 0.0
0.4 0.0
0.6 0.02
0.8 0.096
1.0 0.226
1.2 0.376
1.4 0.532
1.6 0.696
1.8 0.850
2.0 1.030
2.2 1.180
2.4 1.360
2.6 1.530
2.8 1.690
3.0 1.880
3.2 2.040
3.4 2.220
3.6 2.380
3.8 2.520
4.0 2.540
4.2 2.540
4.4 2.540
];


plot(measurements(:,1), measurements(:,2), 'k-+');

hold on;


a = (1.88-0.226)/2
b = 1.03-a*2



x= 0:0.1:5;
y = a.*x + b;
plot(x, y);


hold off;
xlabel('input voltage [V]');
ylabel('VBO [V]')
legend('measured', 'vbo=0.827v_{in}-0.624', 'location', 'northeastoutside');
title('characteristics of source follower');
print('-deps', '-color', '../report/fig/source_follower.eps');










