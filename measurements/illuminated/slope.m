% arg1 is csv location
% arg2 is eps destination



file = "tek00";
file2 = "ALL.csv";


colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
  [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
  [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
  [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};

colorspec = {[1 0 0]; [0.6 0 0]; ...
             [0 1 0]; [0 0.6 0]; ...
             [0 0 1]; [0 0 0.6]}


style  = ':-';

graphics_toolkit gnuplot;

hold on;

for j=0:5
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

	plot(a(:,1), a(:,2), style(mod(j,2)+1), 'LineWidth', 2, 'Color', colorspec{mod(j,12)+1});
	% plot(a(:,1), a(:,3), 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});

end

hold off;

axis([-0.000001 0.01 0.5 2.5]);
xlabel('time (s)');
ylabel('voltage (V)')
legend(...
'dark, V_{bias}=18 V',...
'lluminated, V_{bias}=18 V',... %'VBO, V_{in}=2.8 V',...
'dark, V_{bias}=24 V',...
'illuminated, V_{bias}=24 V',...
'dark, V_{bias}=30 V',...
'illuminated, V_{bias}=30 V',...
'location', 'northeastoutside');
title('slope on varying bias voltages. dark versus illuminated, C=450fF');
print('-deps', '-color', fullfile(pwd, '../../report/fig/slope_illuminated.eps'))
print('-dpdf', '-color', fullfile(pwd, 'illuminated_waveform.pdf'))

