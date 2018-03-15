close all
clc
clear all

sim( 'untitled' ) % uruchomienie modelu zapi sane go jako podwojneWahadlo

m1= str2num( get_param( 'untitled/Subsystem' , 'm1' ) ) ;
m2= str2num( get_param( 'untitled/Subsystem' , 'm2' ) ) ;
l1= str2num( get_param( 'untitled/Subsystem' , 'l1' ) ) ;
l2= str2num( get_param( 'untitled/Subsystem' , 'l2' ) ) ;
t=0.01; % krok

for i=1:length(out1)/5
 
   %subplot(1,2,1)
   plot(-l1*sin(out1(i)), -l1*cos(out1(i)), 'r.','MarkerSize',20*m1);
   hold on
   line([0 -l1*sin(out1(i))],[0 -l1*cos(out1(i))],'Color','b');
   
   line([-l1*sin(out1(i)) -l1*sin(out1(i))-l2*sin(out2(i))],[-l1*cos(out1(i)) -l1*cos(out1(i))-l2*cos(out2(i))],'Color','k');
   
   plot(-l1*sin(out1(i))-l2*sin(out2(i)),-l1*cos(out1(i))-l2*cos(out2(i)) , 'g.','MarkerSize',20*m2);
   
   
   hold off
   axis([-1.1*(l1+l2) 1.1*(l1+l2) -1.1*(l1+l2) 1.1*(l1+l2)])
   
   
   
   %{
   subplot(1,2,2)
   plot(-l1*sin(out2(i)), -l1*cos(out2(i)), 'r.','MarkerSize',10*m1);
   hold on
   line([0 -l1*sin(out2(i))],[0 -l1*cos(out2(i))],'Color','b');
   
   line([-l1*sin(out2(i)) -l2*sin(out1(i))],[-l1*cos(out2(i)) -l2*cos(out1(i))],'Color','k');
   
   plot(-l2*sin(out1(i)), -l2*cos(out1(i)), 'g.','MarkerSize',10*m2);
   
   
   hold off
   axis([-1.1*(l1+l2) 1.1*(l1+l2) -1.1*(l1+l2) 1.1*(l1+l2)])
   %}
   
   pause(t);
   
end

