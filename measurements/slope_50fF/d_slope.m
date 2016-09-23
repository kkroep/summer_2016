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


		
    gap = 30;
    range = 20;
    startpunt = 5052;
   
    hold on;
    for i=1:46
        point = 5000+i*100;
        x=a(point:point+400,1);
        y1=a(point:point+400,2);
		y1 = y1.*2.5./1.4;
        	
		% source follower offset
		y1 = (y1+0.624)./0.827;


        p1 = polyfit(x,y1,2);

        fit1 = polyval(p1,x);
        
        final_dy1(i) = (fit1(end)-fit1(1))/(x(1)-x(end)); 
        final_x(i) = x(1);
         
    end

    plot(final_x*I(j+1),1./(abs(final_dy1)/I(j+1)), 'Linewidth', 2, 'Color', colorspec{mod(j,12)+1});

end

hold off;

axis([0 1.5e-12 0 1.5e-12]);
xlabel('charge (Q)');
ylabel('dQ/dV')
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
title('derivative of voltage on varying input currents, C3');
print('-deps', '-color', fullfile(pwd, '../../report/fig/d_slope_50fF.eps'))

