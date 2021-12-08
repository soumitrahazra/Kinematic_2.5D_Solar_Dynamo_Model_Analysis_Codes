 %Calculation of 22 year averaged signed asymmetry and parity in Hazra & Nandy 2019, MNRAS, 489, 4329 paper.
%Use erupt_northern.m and erupt_southern.m to generate erupt_northsss.dat and erupt_southsss.dat file.
%These two files are basically number of eruptions in the northern and southern hemispheres.
 load erupt_northsss.dat;
 mydata = erupt_northsss; 
 f=1;
 store = [] ;
 while (f<4115)
    
  sum =0 ;   
    for i=1:11
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
    for i=1:11
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
 for i=12:11:4120;
 x=[ x i] ;
 end
 %plot(x,store_north)
 %plot(x,diffn);

 load paarit.dat ;
 figure ; plot(x,diffn,'-b*','linewidth',2,'markersize',10);
 %hold on
 %plot(x,diffn,'*b','markersize',12);
 hold on ;
 plot(paarit(:,1),paarit(:,2),'-r','linewidth',2) 
 xlabel('Time (years)','fontsize',14)
 legend('Signed Asymmetry','Parity')
 set(legend,'fontSize',14)
