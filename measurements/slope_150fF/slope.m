% arg1 is csv location
% arg2 is eps destination



file = "tek00";
file2 = "ALL.csv";


colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
  [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
  [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
  [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};



graphics_toolkit gnuplot;

hold on;

for j=0:7
	if(j<10)
		adres = [file, "0",int2str(j), file2];
	else
		adres = [file, int2str(j), file2];
	end	
	a = csvread(adres);
	
	a(1:21,:)=[];
	a(end,:)=[];
	% a(:,1) = a(:,1)-a(1,1);

    for i=1:4
		b = [a(:  ,2); a(end,2); a(end,2); a(end,2); a(end,2);]...
		  + [a(1  ,2); a(:  ,2); a(end,2); a(end,2); a(end,2);]...
		  + [a(1  ,2); a(1  ,2); a(:  ,2); a(end,2); a(end,2);]...
		  + [a(1  ,2); a(1  ,2); a(1  ,2); a(:  ,2); a(end,2);]...
		  + [a(1  ,2); a(1  ,2); a(1  ,2); a(1  ,2); a(:  ,2);];
		b(1:2)=[];
		b(end-1:end)=[];
		a(:,2)=b./5;
	end

	for i=1:4
		b = [a(:  ,3); a(end,3); a(end,3); a(end,3); a(end,3);]...
		  + [a(1  ,3); a(:  ,3); a(end,3); a(end,3); a(end,3);]...
		  + [a(1  ,3); a(1  ,3); a(:  ,3); a(end,3); a(end,3);]...
		  + [a(1  ,3); a(1  ,3); a(1  ,3); a(:  ,3); a(end,3);]...
		  + [a(1  ,3); a(1  ,3); a(1  ,3); a(1  ,3); a(:  ,3);];
		b(1:2)=[];
		b(end-1:end)=[];
		a(:,3)=b./5;
	end
	
	% source follower offset
	a(:,2) = (a(:,2)+0.624)./0.827;
	a(:,3) = (a(:,3)+0.624)./0.827;

	plot(a(:,1), a(:,2), 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});
	plot(a(:,1), a(:,3), 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});

end

hold off;

axis([-0.000001 0.00003 0.5 3.0]);
xlabel('time (s)');
ylabel('voltage (V)')
legend(...
'V_{in}=2.8 V',...
'',... %'VBO, V_{in}=2.8 V',...
'V_{in}=3.1 V',...
'',...
'V_{in}=3.6 V',...
'',...
'V_{in}=5.0 V',...
'',...
'V_{in}=7.0 V',...
'',...
'V_{in}=11  V',...
'',...
'V_{in}=20  V',...
'',...
'V_{in}=30  V',...
'',...
'location', 'northeastoutside');
title('slope on varying input currents, C=150fF');
print('-deps', '-color', fullfile(pwd, '../../report/fig/slope_150fF.eps'))

