close all
clc
clear all

sim( 'untitled' ) % uruchomienie modelu zapi sane go jako podwojneWahadlo
m1= str2num( get_param( 'untitled/Subsystem' , 'm1' ) ) ;
m2= str2num( get_param( 'untitled/Subsystem' , 'm2' ) ) ;
R = str2num( get_param( 'untitled/Subsystem' , 'R' ) ) ;
t=0.1; % krok
r=u(:,1);
xp=R*cos(0:0.01:2*pi);
yp=R*sin(0:0.01:2*pi);

for i=1:length(r)
   %dlugosci liny dla poszczecgolnych czesci wahadla
   ar(1)=r(i);
   ar(2)=r(1)*2;
   ar(3)=r(1)+(r(1)-r(i));
   
   %rysujemy model 
   plot(0,0);hold on;
   
   %lina - kulka-kolko
   line([0 -ar(1)*cos(y(i))],[0 -ar(1)*sin(y(i))],'Color','b');

   %lina - kolko-kolko2
   line([-ar(2), 0],[0 0],'Color','b');
   
   %lina kolko2-ciezarek
   line([-ar(2),-ar(2)],[0,-ar(3)],'Color','b');
   
   
   %kulka
   plot(-ar(1)*cos(y(i)), -ar(1)*sin(y(i)) , 'g.','MarkerSize',20*m1);
   
   %kolko1
   plot(-R+xp,-R+yp,'r.');
   
   %kolko2
   plot(xp-ar(2)+R,yp-R,'r.');
   
   % ciezarek
   plot(-ar(2),-ar(3), 'k.','MarkerSize',20*m2);
   
   hold off
   axis([-r(1)*3 r(1) -r(1)*2 r(1)*2])
   pause(t);
   
end

