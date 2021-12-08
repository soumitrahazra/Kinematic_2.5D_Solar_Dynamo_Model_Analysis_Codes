load butter.dat ;
 a=butter;
 n=length(a);
 R=a(1:298:n,1);
 T=a(1:298,2);
 [r,t]=meshgrid(R,T);
 p=(10^8)/(365*24*3600);
 x=r.*p;
 y=(90-(t*(180/pi)));
 f=reshape(a(:,3),298,n/298);
 contourf(x,y,f,20); shading flat
