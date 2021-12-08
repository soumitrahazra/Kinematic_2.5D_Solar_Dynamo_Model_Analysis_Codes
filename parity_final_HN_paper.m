 load pasat_south_northern.dat
 x=pasat_south_northern(:,1);
 y=pasat_south_northern(:,2);
 z=pasat_south_northern(:,3);
 c1=sqrt(3/(4*pi));
 c2=sqrt(5/(4*pi));
 cons= (2.0*cos(65*pi/180))/(3*cos(65*pi/180)*cos(65*pi/180)-1);
 consa=1.0/cons;
 zs= z./y;
 for s= 1:length(x)
 xx(s)= x(s);
 qm(s)= (c1/c2)*cons*((zs(s)+1)./(zs(s)-1));
 dm(s)= (c2/c1)*consa*((zs(s)-1)./(zs(s)+1));
 if (qm(s) >= 0)
 pa(s)= (abs(qm(s))-1)./(abs(qm(s))+1);
 else
 pa(s)= (1- abs(dm(s)))./(1+ abs(dm(s)));
 end
 end
 %pa=smooth(pa);
 plot(x, smooth(pa),'-k')

 sa = [xx; pa];
 fid=fopen('paaritty.dat', 'w');
 fprintf(fid, '%6.8f %6.8f\n', sa);
 fclose(fid);
