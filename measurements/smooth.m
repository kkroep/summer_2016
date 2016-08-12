% arg1 is csv location
% arg2 is eps destination


arg_list = argv ();
for i = 1:nargin
  printf (" %s\n", arg_list{i});
endfor


graphics_toolkit gnuplot;
a = csvread(arg_list{1});

smooth=13;
b=a(1:end-smooth+1,:);
for i=2:smooth
b = b+a(i:end-smooth+i,:);
end
a=b/smooth;

a(1:21,:)=[];
a(end,:)=[];
a(:,1) = a(:,1)-a(1,1);

hold on;
plot(a(:,1), a(:,4), 'LineWidth', 4);
plot(a(:,1), a(:,3), 'g', 'LineWidth', 4);
plot(a(:,1), a(:,2), 'r', 'LineWidth', 4);


hold off;

xlabel('time (s)');
ylabel('voltage (V)')
legend('reset', 'VB', 'output', 'location', 'northeastoutside');
title(arg_list{3});
print('-deps', '-color', fullfile(pwd, arg_list{2}))

