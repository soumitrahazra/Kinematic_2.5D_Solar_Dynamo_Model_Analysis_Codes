%NORTERN HEMISPHERE (ram.dat file)
load ram.dat;
 x=ram(:,1);
 y=ram(:,2);
 z=1; 
 zs=1;
 t=0;
 ts=0;
 dt=0.01;
 p=10^8/(365*24*3600);
 s= 1;
 intn(1)=0;
 intp(1)=0;
 np=1;
 for n=1:length(x)
  
 if ((y(n)/abs(y(n)))==s)
  z=zs;
  ns=n;
  intp(t+2)=0;
  intn(z)=intn(z)+y(n);
  pa(z)= intn(z);
  tim(z)= floor((floor(np+((ns-np)/2)))*p*dt);
  ts=t+2;

 else
   t=ts;
   np=n;
  intp(t)=intp(t) + y(n);
 pa(t)= intp(t);
 tim(t)= floor((floor(ns+((np-ns)/2)))*p*dt);
 zs= z+2;
 intn(z+2)=0;
 end

 end

  m=[tim; pa];
 fid=fopen('pasat_northern.dat','w');
 fprintf(fid, '%6.8f %6.8f\n',m);
 fclose(fid);
