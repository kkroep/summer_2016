
graphics_toolkit gnuplot;
a = csvread('tek0004ALL.csv');

a(1:21,:)=[];

hold on;
plot(1:size(a,1), a(:,4));
plot(1:size(a,1), a(:,3), 'g');
plot(1:size(a,1), a(:,2), 'r');


hold off;

xlabel('time (ms)');
ylabel('voltage (V)')
legend('reset', 'out8', 'out4');

print -djpg integrator.jpg;
print -deps -color integrator.eps;