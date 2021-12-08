load erupt_northsss.dat;
 mydata = erupt_northsss; 
 f=1;
 store = [] ;
 while (f<4115)
    
  sum =0 ;   
    for i=1:22
    sum = sum + mydata(f,2);
    f=f+1;
    end
    store = [ store sum ];
  f;
 end

 store_north = store ; 
 load erupt_southsss.dat ; 
 mydata2 = erupt_southsss ; 
 f=1;
 store_south = [] ;
 while (f<4115)
    
  sum =0 ;   
    for i=1:22
    sum = sum + mydata2(f,2);
    f=f+1;
    end
    store_south = [ store_south sum ];
    f;
 end
 %plot(store_north)
 %hold on ;
 %plot(store_south,'r') ;
 diff = store_north - store_south ;
 diffn = diff./max(diff);
 %figure ;
  x=[];
 for i=23:22:4120;
 x=[ x i] ;
 end
 %plot(x,store_north)
 %plot(x,diffn);
 
 z=zeros(1,187);
 load paarit.dat ;
 figure ; plot(x,diffn,'-b*','linewidth',2,'markersize',10);
 %hold on
 %plot(x,diffn,'*b','markersize',12);
 hold on ;
 plot(paarit(:,1),paarit(:,2),'-r','linewidth',2) 
 hold on
% line([0 0], yL);
  plot(x,z,'--k','linewidth',2)
 xlabel('Time (years)','fontsize',14)
 legend('Signed Asymmetry','Parity')
 set(legend,'fontSize',14)
