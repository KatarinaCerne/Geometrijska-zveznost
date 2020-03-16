%R stopnje (3,3)
%S stopnje (3,3)
%robovi so doloèeni tako, da so parametri 
%e0=e1=1, f0=0, f1=0
%zahtevamo C^1 zveznost

zRx = [0,2,4,6;0,2,4,6;0,2,4,6;0,2,4,6];
zRy = [0,0,0,0;2,2,2,2;4,4,4,4;6,6,6,6];
zRz = [0,4,4,0;0,6,6,2;2,6,6,2;0,4,0,0];

zSx = [-6,-4,-2,0;-6,-4,0,0;-6,-4,0,0;-6,-4,-2,0];
zSy = [0,0,0,0;2,2,0,2;4,4,0,4;6,6,6,6];
zSz = [0,4,-4,0;2,6,0,0;2,6,0,2;0,0,-4,0];

[Rx,Ry,Rz,Sx,Sy,Sz]=primer1(zRx,zRy,zRz,zSx,zSy,zSz);

u=linspace(0,1,50);
v=linspace(0,1,50);

[rx,ry,rz]=bezier2(Rx,Ry,Rz,u,v);
[sx,sy,sz]=bezier2(Sx,Sy,Sz,u,v);

hold on
set(gca,'visible','off')
surf(rx,ry,rz,'EdgeColor','blue')
mesh(Rx,Ry,Rz,'Facecolor','none','EdgeColor','black')
surf(sx,sy,sz,'EdgeColor','red')
mesh(Sx,Sy,Sz,'Facecolor','none','EdgeColor','black')
%scatter3(meja(1,:),meja(2,:),meja(3,:))
hold off