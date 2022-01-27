
load run.dat;
x=run(:,1);
y=run(:,2);
z=1;
zs=2;
t=1;
ts=1;
 
 s=sign(y(1));
 sa(1)=1;
 np=1;
 for n=1:length(x)
  
 if ((y(n)/abs(y(n)))==s)
  z=zs;
  ns=n;
  sa(z)=ns;
   ts=t+2;
   else
   t=ts;
   np=n;
  sa(t)=np;
  zs= z+2;
    end
  end
  
  for m=1: (length(sa)-1)
   ssn(m)= trapz(x(sa(m):sa(m+1)), (y(sa(m):sa(m+1))).^2)/(x(sa(m+1))- x(sa(m)));
   end
   
   %% SSN smoothing using Gleisberg's low-pass filter

b2 = [1/8 2/8 2/8 2/8 1/8];
a = 1;
[SmoothSSN, zf] = filter(b2, a, ssn);

mn = mean(SmoothSSN)/2;
jkl = 1;
jklm = 1;
SmoothSSNnew = SmoothSSN - mn; % to find out zero-crossing


%% Drawing coloured Smoothed SSN plot
 
 y2 = SmoothSSN; 
 
for j = 1:length(sa)-1
    mid_cycle(j) = (x(sa(j))+x(sa(j+1)))/2;
end

%plot(mid_cycle,SmoothSSN,'k');
%hold on;
%plot(mid_cycle,mn*ones(1,length(SmoothSSN')),'r')
%xlabel('Time')
%ylabel('Smoothed SSN');
%axis tight

% 
 for index = 1:(length(sa)-1)
     if y2(index) <= mn
         y2(index) = mn;
     end
 end
% 
 index = 3:(length(sa)-1);
h2 = fill(mid_cycle(index([1 1:end end])),...        
[mn y2(index) mn],...
 'b','EdgeColor','k');


y2=SmoothSSN;
 for index = 1:(length(sa)-1)
     if y2(index) >= mn
         y2(index) = mn;
     end
 end
% 
 index = 3:(length(sa)-1); hold on;
h2 = fill(mid_cycle(index([1 1:end end])),...        
[mn y2(index) mn],...
 'r','EdgeColor','k');