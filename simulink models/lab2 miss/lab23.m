close all
m=10;
l=3;
t=0.01; % krok
for i=1:length(tout)
   plot(-l*sin(tout(i)), -l*cos(tout(i)), 'b.','MarkerSize',5*m);
   hold on
   line([0 -l*sin(tout(i))],[0 -l*cos(tout(i))],'Color','r','LineWidth',2);
   hold off
   axis([-1.1*l 1.1*l -1.1*l 1.1*l])
   pause(t);
end
