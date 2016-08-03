% arg1 is csv location
% arg2 is eps destination


arg_list = argv ();
for i = 1:nargin
  printf (" %s\n", arg_list{i});
endfor


graphics_toolkit gnuplot;
a = csvread(arg_list{1});

a(1:21,:)=[];
a(end,:)=[];
a(:,1) = a(:,1)-a(1,1);

hold on;
plot(a(:,1), a(:,3));
plot(a(:,1), a(:,2), 'r');


hold off;

xlabel('time (s)');
ylabel('voltage (V)')
legend('reset', 'outout', 'location', 'northeastoutside');
title(arg_list{3});
print('-deps', '-color', fullfile(pwd, arg_list{2}))
