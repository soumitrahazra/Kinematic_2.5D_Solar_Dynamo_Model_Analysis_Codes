 %Calculation of Parity following Chatterjee, Nandy & Choudhuri 2001 paper.
 %y=run(:,2) for southern hemisphere and z=ram(:,2) for northern hemisphere.
 %run.dat for southern hemisphere data and ram.dat for northern hemisphere data.
 %It is better if one writes both northern and southern hemisphere data in same data file.
 load run.dat;
 load ram.dat;
 x=run(:,1);
 y=run(:,2);
 z=ram(:,2);
 dt=0.01;
 p=10^8/(365*24*3600);
 nt=round(5.5/(p*dt));
 s=1
 for n=175:350:(length(x)-2*nt)
  int1=0;
  int2=0;
  int3=0;
 for k=n-nt:n+nt
 int1=int1+ y(k)*z(k);
 end
 for k=n-nt:n+nt
 int2=int2+y(k)*y(k);
 end
 for k= n-nt:n+nt
 int3=int3+ z(k)*z(k);
 end

 pa(s)= int1/(sqrt(int2)*sqrt(int3));
  t(s)=n*p*dt;
  s=s+1;
  end

  m=[t;pa];
 fid=fopen('paarit.dat','w');
 fprintf(fid, '%6.8f  %6.8f\n',m);
 fclose(fid);
