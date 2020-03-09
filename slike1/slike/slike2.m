Bx1=[0,1,2,3;0,1,2,3;0,1,2,3;0,1,2,3];
By1=[0,0,0,0;1,1,1,1;2,2,2,2;3,3,3,3];
Bz1=[0,1,1.5,1.5;0,1,1.5,1.5;0,1,1.5,1.5;0,1,1.5,1.5];

Bx2=[3,4,5,6;3,4,5,6;3,4,5,6;3,4,5,6];
By2=[0,0,0,0;1,1,1,1;2,2,2,2;3,3,3,3];
Bz2=[1.5,1.5,1,0;1.5,1.5,1,0;1.5,1.5,1,0;1.5,1.5,1,0];

u=linspace(0,1,50);
v=linspace(0,1,50);

[bx1,by1,bz1]=bezier2(Bx1,By1,Bz1,u,v);
[bx2,by2,bz2]=bezier2(Bx2,By2,Bz2,u,v);

hold on
%set(gca,'visible','off')
surf(bx1,by1,bz1,'Facecolor','white','EdgeColor','blue')
mesh(Bx1,By1,Bz1,'Facecolor','none','EdgeColor','black')
surf(bx2,by2,bz2,'Facecolor','white','EdgeColor','red')
mesh(Bx2,By2,Bz2,'Facecolor','none','EdgeColor','black')
hold off