%Southern Hemisphere (run.dat file)
 load run.dat;
 load ram.dat;
 x=run(:,1);
 y=run(:,2);
 yf=ram(:,2);
 z=1;
 zs=1;
 t=0;
 ts=0;
 dt=0.01;
 p=10^8/(365*24*3600);
 s=-1;
 intn(1)=0;
 intnn(1)=0;
 intp(1)=0;
 intpn(1)= 0;
 np=1;
 for n=1:length(x)
  
 if ((y(n)/abs(y(n)))==s)
  z=zs;
  ns=n;
  intp(t+2)=0;
  intpn(t+2)=0;
  intn(z)=intn(z)+y(n);
  intnn(z)= intnn(z) + yf(n);
  pas(z)= intn(z);
  pan(z)= intnn(z);
  tim(z)= floor((floor(np+((ns-np)/2)))*p*dt);
  ts=t+2;

 else
   t=ts;
   np=n;
  intp(t)=intp(t) + y(n);
  intpn(t) = intpn(t) + yf(n);
 pas(t)= intp(t);
 pan(t)= intpn(t);
 tim(t)= floor((floor(ns+((np-ns)/2)))*p*dt);
 zs= z+2;
 intn(z+2)=0;
 intnn(z+2)=0;
 end

 end

  m=[tim; pas; pan];
 fid=fopen('pasat_south_northern.dat','w');
 fprintf(fid, '%6.8f %6.8f %6.8f\n',m);
 fclose(fid);
