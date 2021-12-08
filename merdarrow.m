load merd.dat;
a=merd;   
n=length(a);     
R=a(1:255:n,2);
T=a(1:255,1);
[r,t]=meshgrid(R,T); 
x=r.*sin(t);  
y=r.*cos(t);   
fx=reshape(a(:,3),255,255);
fy=reshape(a(:,4),255,255);
%%quiver(r,t,-fx,-fy,4)
fr=-fx.*sin(t) - fy.*cos(t);
ft=-fx.*cos(t) + fy.*sin(t);
%% m = how sparsely the data is plotted
m=225
quiver(x(1:m:n),y(1:m:n),fr(1:m:n),ft(1:m:n),1.5)
