close all
clc
m1=1;
m2=2;
l1=1;
l2=2;
t=0.01; % krok
for i=1:length(out4.signals.values)
 
   subplot(1,2,1)
   plot(-l1*sin(out4.signals.values(i)), -l1*cos(out4.signals.values(i)), 'r.','MarkerSize',10*m1);
   hold on
   line([0 -l1*sin(out4.signals.values(i))],[0 -l1*cos(out4.signals.values(i))],'Color','b');
   
   line([-l1*sin(out4.signals.values(i)) -l2*sin(out3.signals.values(i))],[-l1*cos(out4.signals.values(i)) -l2*cos(out3.signals.values(i))],'Color','k');
   
   plot(-l2*sin(out3.signals.values(i)), -l2*cos(out3.signals.values(i)), 'g.','MarkerSize',10*m2);
   
   
   hold off
   axis([-1.1*(l1+l2) 1.1*(l1+l2) -1.1*(l1+l2) 1.1*(l1+l2)])
   
   
   
   
   subplot(1,2,2)
   plot(-l1*sin(out3.signals.values(i)), -l1*cos(out3.signals.values(i)), 'r.','MarkerSize',10*m1);
   hold on
   line([0 -l1*sin(out3.signals.values(i))],[0 -l1*cos(out3.signals.values(i))],'Color','b');
   
   line([-l1*sin(out3.signals.values(i)) -l2*sin(out4.signals.values(i))],[-l1*cos(out3.signals.values(i)) -l2*cos(out4.signals.values(i))],'Color','k');
   
   plot(-l2*sin(out4.signals.values(i)), -l2*cos(out4.signals.values(i)), 'g.','MarkerSize',10*m2);
   
   
   hold off
   axis([-1.1*(l1+l2) 1.1*(l1+l2) -1.1*(l1+l2) 1.1*(l1+l2)])
   
   pause(t);
   
end

