hold off
clc
clear
%Arm Lengths
a2=1;
a4=1;
%Desired X-Y-Position of the end effector
X=.707;
Y=1.707;
for t=0:.05:1
%t=t
%Desired X-Y-Position of the end effector as a function of time
xt=X*t; 
yt=Y*t; 
%Equations used to calculate theta 1/2
r1=sqrt(xt.^2+yt.^2);
phi1=acos(((a4.^2)-(a2.^2)-(r1.^2))/(-2*a2*r1));
phi2=atan2(yt,xt);
phi3=acos(((r1.^2)-(a2.^2)-(a4.^2))/(-2*a2*a4));
%T1 is Theta 1 in radians
T1=phi2-phi1;
%T2 is (180 degrees - angle phi3)
T2=pi-phi3;
%Vector coordinates of the linkage
x=[0 a2*cos(T1) xt];
y=[0 a2*sin(T1) yt];
%Theta in Degrees
T1=T1*(180/pi)
T2=T2*(180/pi)
%Plot end effector 
hold off
plot(x,y,'o-');  
axis equal
axis([-3 3 -3 3])
pause(.05)
hold on
end