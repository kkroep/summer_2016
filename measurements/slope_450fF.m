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

for j=0:22
	if(j<10)
		adres = [file, "0",int2str(j), file2];
	else
		adres = [file, int2str(j), file2];
	end	
	a = csvread(adres);

	smooth=13;
	b=a(1:end-smooth+1,:);
	for i=2:smooth
		b = b+a(i:end-smooth+i,:);
	end
	a=b/smooth;

	a(1:21,:)=[];
	a(end,:)=[];
	a(:,1) = a(:,1)-a(1,1);

	if j==0
		plot(a(:,1), a(:,4), 'LineWidth', 4, 'k');
		for i=1:length(a(:,4))
			if(a(i,4)>2)
				fprintf('\noffset=%d\n', a(i,1));
				break;
			end
		end
	end
	%plot(a(:,1), a(:,3), 'g', 'LineWidth', 4);
	plot(a(:,1), a(:,2), 'r', 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});

	for i=1:length(a(:,2))
		if(a(i,2)<0.7)
			middle(j+1) = a(i,1);
			break;
		end
	end
end

hold off;

xlabel('time (s)');
ylabel('voltage (V)')
legend('reset',...
'V_{in}=2.6V',...
'V_{in}=2.7V',...
'V_{in}=2.8V',...
'V_{in}=2.9V',...
'V_{in}=3.0V',...
'V_{in}=3.3V',...
'V_{in}=3.5V',...
'V_{in}=3.8V',...
'V_{in}=4.0V',...
'V_{in}=4.5V',...
'V_{in}=5.0V',...
'V_{in}=5.5V',...
'V_{in}=6.0V',...
'V_{in}=7.0V',...
'V_{in}=8.0V',...
'V_{in}=9.0V',...
'V_{in}=10.0V',...
'V_{in}=11.0V',...
'V_{in}=12.0V',...
'V_{in}=14.0V',...
'V_{in}=16.0V',...
'V_{in}=18.0V',...
'V_{in}=20.0V',...
'location', 'northeastoutside');
title('slope on varying inputr currents');
print('-deps', '-color', fullfile(pwd, '../report/fig/slope_450fF.eps'))


close;
fprintf('\n\n');

for i=1:length(middle)
	fprintf('%d\n', middle(i));
end
size(middle)
plot(1:length(middle), middle);
print('-deps', '-color', fullfile(pwd, 'time_vs_voltage.eps'))
