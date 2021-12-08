%Southern Hemisphere (run.dat file)
%Calculation of peak amplitude 
%Soumitra (7.5.2016)
 clear all;
 load run.dat;
 x=run(:,1);
 y=run(:,2);
 z=1;
 zs=1;
 t=1;
 g=1;
 ts=1;
 ns=1;
 nt=1;
 p=10^8/(365*24*3600);
 xx=x.*p;
 s=sign(y(1));
 nq=1;
 j=1;
 i=1;
 yp(1)=0;
 ys(1)=0;
 for n=1:length(x)
  
 if ((y(n)/abs(y(n)))==s)
  g=zs;
  zz(g)= max(abs(yp(1:ns)));
  ys(j)= y(n);
  nt=j;
  j=j+1;
  xs(g)=xx(n);
  i=1;
 t=zs+1;
 else
   zz(t)= max(abs(ys(1:nt)));
   yp(i)= y(n);
   ns=i;
   i=i+1;
   xs(t)=xx(n);
   j=1;
   zs=t+1;
 end
 
 end
% Calculation for periodicity
 time(1)=0;
 time(2)= xs(1);
 for n= 3:length(xs)
  time(n)= xs(n-1)- xs(n-2);
 end

  m=[xs; time; zz];
 fid=fopen('amp_period_southers.dat','w');
 fprintf(fid, '%6.8f %6.8f %6.8f\n',m);
 fclose(fid);
