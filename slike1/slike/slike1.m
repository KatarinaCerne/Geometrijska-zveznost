% Bx = [0,3,5,6;1,4,5,7;0,3,5,6];
% By = [-1,-2,-1,-2;1,2,1,2;5,5,6,5];
% Bz = [-3,-2,0,-5;3,6,3,2;-1,4,-2,8];

Bx=[0,2,4,6;0,2,4,6;0,2,4,6;0,2,4,6];
By=[0,0,0,0;2,2,2,2;4,4,4,4;6,6,6,6];
Bz=[0,4,4,0;0,6,6,2;2,6,6,2;0,4,0,0];

u=linspace(0,1,50);
v=linspace(0,1,50);

[bx,by,bz]=bezier2(Bx,By,Bz,u,v);

hold on
%set(gca,'visible','off')
surf(bx,by,bz,'Facecolor','white','EdgeColor','blue')
mesh(Bx,By,Bz,'Facecolor','none','EdgeColor','black')
hold off