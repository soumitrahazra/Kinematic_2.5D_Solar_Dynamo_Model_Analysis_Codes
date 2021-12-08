load double2.dat
b=double2;
fac=1.0e8/(365*24*3600);
hth=-b(:,2).*b(:,2);
hold on
b(length(hth),1)
start=0.0%input('start plotting from time=');
tend=0.0%input('Maximum time from previous plot=');
startj=min(find(b(:,1)>start))
for j=startj:length(hth);
     if and(ge(hth(j),0),ge(b(j,2),0))==1
	h1= plot(b(j,1)*fac+tend,b(j,3),'+ r');
	set(h1,'MarkerSize',4)

     elseif and(ge(hth(j),0),le(b(j,2),0))==1
	h2=plot(b(j,1)*fac+tend,b(j,3),'+ k');
	set(h2,'MarkerSize',4)
     elseif and(le(hth(j),0),ge(b(j,2),0))==1
     h3=plot(b(j,1)*fac+tend,b(j,3),'+ r');
	set(h3,'MarkerSize',2)
     elseif and(le(hth(j),0),le(b(j,2),0))==1
     h4=plot(b(j,1)*fac+tend,b(j,3),'+ k');
	set(h4,'MarkerSize',2)
     end
end  
%hold off  
xlabel('Time (years)','fontsize',16.0)
ylabel('Latitude','fontsize',16.0)
set(gca,'fontsize',14);
