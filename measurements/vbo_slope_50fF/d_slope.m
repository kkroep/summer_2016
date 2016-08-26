% arg1 is csv location
% arg2 is eps destination



file = "tek00";
file2 = "ALL.csv";


colorspec = {[0.4 0 0.8]; [0.4 0.8 0]; [0.4 0.7 0.7]; ...
  [0 0.4 0.8]; [0.8 0.4 0]; [0.7 0.4 0.7]; ...
  [0.8 0 0.4]; [0 0.8 0.4]; [0.7 0.7 0.4]; ...
  [0 0 0.7]; [0 0.7 0]; [0.7 0 0]};


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
V_in = V_in - 2.5;
I = V_in/20e6;

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
        y1=a(point:point+400,3);
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

    plot(final_x*I(j+1),abs(final_dy1)/I(j+1), 'Linewidth', 2, 'Color', colorspec{mod(j,12)+1});
    % plot(a(startpunt:end-gap-endpunt,1), b(startpunt:end), 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});
    
    % plot(a(startpunt:end-gap-endpunt,1), b(startpunt:end), 'LineWidth', 4, 'Color', colorspec{mod(j,12)+1});

end

hold off;

axis([0 5e-11 0 6e10]);
xlabel('charge (Q)');
ylabel('dV/dQ')
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
title('derivative of VBO on varying input currents, C=50fF');
print('-deps', '-color', fullfile(pwd, '../../report/fig/vbo_d_slope_50fF.eps'))

