% arg1 is csv location
% arg2 is eps destination



file = "tek00";
file2 = "ALL.csv";


colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
  [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
  [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
  [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};



graphics_toolkit gnuplot;

% hold on;

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

		% if j==0
		% for i=1:4
			% b = [a(:  ,4); a(end,4); a(end,4); a(end,4); a(end,4);]...
			  % + [a(1  ,4); a(:  ,4); a(end,4); a(end,4); a(end,4);]...
			  % + [a(1  ,4); a(1  ,4); a(:  ,4); a(end,4); a(end,4);]...
			  % + [a(1  ,4); a(1  ,4); a(1  ,4); a(:  ,4); a(end,4);]...
			  % + [a(1  ,4); a(1  ,4); a(1  ,4); a(1  ,4); a(:  ,4);];
			% b(1:2)=[];
			% b(end-1:end)=[];
			% a(:,4)=b./5;
		% end
		
		% plot(a(:,1), a(:,3), 'LineWidth', 4, 'k');
		% for i=1:length(a(:,3))
			% if(a(i,3)>2)
				% fprintf('\noffset=%d\n', a(i,1));
				% break;
			% end
		% end
	% end
	% plot(a(:,1), a(:,2), 'r', 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});
	for i=1:size(a(:,2))
		if(a(i,2)<0.6)
			northwest = a(i ,1:2);
			southeast = a(i+1000 ,1:2);
			middle(j+1) = (northwest(2)-southeast(2))/(southeast(1)-northwest(1));
			break;
		end
	end
end

%plot expected versus real
close;
V_in = 2.5:0.1:10;

R = 3e6;
C_int = 150e-15;
C_par = 0;%50e-15;
C = C_int+C_par;
V = 2.5;
V_0 = 2.5;
%t = C.*V.*R./(V_in-V_0);
%I = (V_in-V_0)./R;
dV_dt = (V_in-V_0)./(R*C);

hold on;

plot(V_in,dV_dt);

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


I = (V_in-V_0)./R;

%plot(I, 1./((middle-4.02e-5).*2), 'r');


	
% source follower offset
middle = (middle+0.624)./0.827;



plot(V_in, middle, 'r*');
csvwrite("middle.csv", middle);
hold off;

xlabel('input voltage [V]');
ylabel('dV/dt')
legend('expected', 'measured', 'location', 'northeastoutside');
title('expected versus measured times to charge a capacitor of 50 fF');
print('-deps', '-color', '../../report/fig/bre_vin_vs_time_sat_50fF.eps');






