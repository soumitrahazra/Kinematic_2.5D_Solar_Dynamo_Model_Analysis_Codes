load double1.dat
x=double1(:,1);
np=length(x);
p=10^8/(365*24*3600);
t=x.*p;
a=1;
s=2;
z=2;
n(1)=0;
m(1)=0;
y(1)=0;
for i=2:np
  if (t(i) > a)
 n(z)=i;
 y(s)=t(i);
 m(s)=i-n(z-1);
 s=s+1;
 z=z+1;
 a=a+1;
end
end
 v=[y;m];
 fid=fopen('erupt_norths.dat', 'w');
 fprintf(fid, '%6.8f  %6.8f\n',v);
 fclose(fid);

 k=1;
for i=1:length(y);
if (m(i)>1)
 zp(k)=y(i);
 mp(k)=m(i);
 k=k+1;
end
end
f=floor(zp);
nx=length(f);
l=1;
 for i=1:f(nx);
 if (i==f(l));
jp(i)=f(l);
hp(i)=mp(l);
l=l+1;
else
jp(i)=i;
hp(i)=0;
end
end
vp=[jp;hp];

fid=fopen('erupt_northsss.dat', 'w');
 fprintf(fid, '%6.8f  %6.8f\n',vp);
 fclose(fid);
