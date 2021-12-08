load diffrot.dat;
 a=diffrot;
 n=length(a)
 R=a(1:300:n,1);
 T=a(1:300,2);
 [r,t]=meshgrid(R,T);
 x=-r.*sin(t);
 y=r.*cos(t);
 f=reshape(a(:,3),300,n/300);
 pcolor(x,y,f) ; shading flat
 strip;
 colormap('coolwarm');
