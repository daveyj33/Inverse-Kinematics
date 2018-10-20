
clc; clear;
x=1.7071; y=0; z=-1.7071; %End Effector Position
a1=1; a2=1; a3=1; ac=1;% Link Lengths

t1=atan(y/x); % TOP VIEW: Angle of rotation in xy-plane (YAW)

r1=sqrt((x-ac*cos(t1))^2+(y-ac*sin(t1))^2);
r4=sqrt((x+ac*cos(t1))^2+(y+ac*sin(t1))^2);%
r2=z; %
phi2=atan(r2/r1); %

r3= sqrt(r1^2+r2^2);%
phi1=acos((-a3^2+a2^2+r3^2)/(2*a2*r3)); %
t2=phi2-phi1; %

phi3=acos((-r3^2+a2^2+a3^2)/(2*a2*a3)); % 
t3=pi-phi3;

x=[0 ac*cos(t1) ac*cos(t1)+a2*cos(t2) ac*cos(t1)+a2*cos(t2)+a3*cos(t2+t3)]
y=[0 ac*sin(t1) ac*sin(t1)+a2*cos(t2)*sin(t1) ac*sin(t1)+a2*cos(t2)*sin(t1)+a3*cos(t2+t3)*sin(t1)]
z=[0 0 a2*sin(t2) a2*sin(t2)+a3*sin(t2+t3)]

hold on
plot3(x,y,z,'o-')
axis equal
t1=t1*180/pi
t2=t2*180/pi
t3=t3*(180/pi)
