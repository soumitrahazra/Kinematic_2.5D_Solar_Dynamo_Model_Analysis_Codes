
function strip
axis([0 6.96 -6.96 6.96])
axis equal
axis manual
hold on
x=0:0.0001:3.82;
plot(x,(3.82.^2-x.^2).^(1/2),'k-');
x=0:0.0001:3.82;
plot(x,-(3.82.^2-x.^2).^(1/2),'k-');
x=0:0.001:4.65;
plot(x,(4.65.^2-x.^2).^(1/2),'k--'); 
x=0:0.001:4.65;
plot(x,-(4.65.^2-x.^2).^(1/2),'k--');
x=0:0.001:5.0;
plot(x,(5.^2-x.^2).^(1/2),'k--');
x=0:0.001:5.0;
plot(x,-(5.^2-x.^2).^(1/2),'k--');
x=0:0.0001:6.96;
plot(x,(6.96.^2-x.^2).^(1/2),'k-');
x=0:0.0001:6.96;
plot(x,-(6.96.^2-x.^2).^(1/2),'k-');
x=[3.82,6.96];
axis off
plot(x,[0,0],'k-')
plot([0,0],x,'k-')
plot([0,0],-x,'k-') 