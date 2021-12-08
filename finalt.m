 load final.dat;
 a=final;
 n=length(a);
 R=a(1:300:n,2);
 T=a(1:300,1);
 [r,t]=meshgrid(R,T);
 x=r.*sin(t);
 y=r.*cos(t);
 f=reshape(a(:,4),300,n/300);
 contourf(x,y,f,20); shading flat
 colorbar;
 strip;
