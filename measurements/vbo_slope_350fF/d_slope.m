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
    final_dy1=[];
    final_dy2=[];
    final_x=[];
	if(j<10)
		adres = [file, "0",int2str(j), file2];
	else
		adres = [file, int2str(j), file2];
	end	
	a = csvread(adres);
	
	a(1:21,:)=[];
	a(end,:)=[];
	% a(:,1) = a(:,1)-a(1,1);


		if j==0
		
		% plot(a(:,1), a(:,4), 'LineWidth', 4, 'k');
	end
    gap = 30;
    range = 20;
    startpunt = 5052;
   
    hold on;
    for i=1:46
        point = 5000+i*100;
        x=a(point:point+400,1);
        y1=a(point:point+400,2);
        % y2=a(point:point+400,3);
        
        p1 = polyfit(x,y1,2);
        % p2 = polyfit(x,y2,2);

        fit1 = polyval(p1,x);
        % fit2 = polyval(p2,x);
        
        final_dy1(i) = (fit1(end)-fit1(1))/(x(1)-x(end)); 
        % final_dy2(i) = (fit2(end)-fit2(1))/(x(1)-x(end)); 
        final_x(i) = x(1);
         
        % plot(final_x,final_dy2*10, 'Linewidth', 2, 'Color', colorspec{mod(j,12)+1});
        % plot(x,yfit, 'Linewidth', 4, 'g');
        % plot(x(1:50:end),y(1:50:end),'r.');
    end

    loglog(final_x,abs(final_dy1), 'Linewidth', 2, 'Color', colorspec{mod(j,12)+1});
    % plot(a(startpunt:end-gap-endpunt,1), b(startpunt:end), 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});
    
    % plot(a(startpunt:end-gap-endpunt,1), b(startpunt:end), 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});

end

hold off;

% axis([-0.000001 0.00002 0 3.5]);
xlabel('time (s)');
ylabel('dV/dt')
legend(...
'V_{in}=2.8 V',...
'V_{in}=3.1 V',...
'V_{in}=3.6 V',...
'V_{in}=5.0 V',...
'V_{in}=7.0 V',...
'V_{in}=11.0V',...
'V_{in}=20.0V',...
'V_{in}=30.0V',...
'location', 'northeastoutside');
title('derivative of voltage on varying input currents, C=350fF');
print('-deps', '-color', fullfile(pwd, '../../report/fig/d_slope_350fF.eps'))


% close;
fprintf('\n\n');
% 
% %plot(1:length(middle), middle);
% %print('-deps', '-color', fullfile(pwd, 'time_vs_voltage.eps'))
% 
% 
% %plot expected versus real
% close;
% V_in = 2.5:0.1:20;
% 
% R = 100e6;
% C_int = 350e-15;
% C_par = 100e-15;
% C = C_int+C_par;
% V = 2.5;
% V_0 = 2.5;
% %t = C.*V.*R./(V_in-V_0);
% %I = (V_in-V_0)./R;
% dV_dt = (V_in-V_0)./(R*C);
% 
% hold on;
% 
% plot(V_in,dV_dt);
% 
% V_in = [
% 2.6
% 2.7
% 2.8
% 2.9
% 3.0
% 3.3
% 3.5
% 3.8
% 4.0
% 4.5
% 5
% 5.5
% 6
% 7
% 8
% 9
% 10
% 11
% 12
% 14
% 16
% 18
% 20
% ];
% 
% 
% I = (V_in-V_0)./R;
% 
% %plot(I, 1./((middle-4.02e-5).*2), 'r');
% middle = middle./1.2.*V_0; %deze stap is nodig door de current follower
% 
% plot(V_in, middle, 'r*');
% hold off;
% 
% xlabel('input voltage [V]');
% ylabel('dV/dt')
% legend('expected', 'measured', 'location', 'northeastoutside');
% title('expected versus measured times to charge a capacitor of 350 fF');
% print('-deps', '-color', '../../report/fig/vin_vs_time_350fF.eps');
% 
% 
% 
% 
% 
% 