close all

sim( 'miss44' ) % uruchomienie s ymulac j i modelu zapi sane go jako sprWahadlo
m = str2num( get_param( 'miss44/Subsystem' , 'm' ) ) ; % pobranie masy z modelu

l= str2num( get_param( 'miss44/Subsystem' , 'l' ) ) ; % pobranie masy z modelu

l_max=(l+max(simout));

for i=1:length(simout)
   li=(l+simout(i));
   plot(-li*sin(simout1(i)), -li*cos(simout1(i)), 'b.','MarkerSize',5*m);
   hold on
   line([0 -li*sin(simout1(i))],[0 -li*cos(simout1(i))],'Color','r','LineWidth',2);
   hold off
   axis([-1.1*l_max 1.1*l_max -1.1*l_max 1.1*l_max])
   pause(t);
end
