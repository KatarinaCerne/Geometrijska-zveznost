%R stopnje (3,3)
%S stopnje (3,3)
%robovi so doloèeni tako, da so parametri 
%e0=e1=1, f0=3, f1=-2
%zahtevamo G^1 zveznost
%uporabimo metodo, kjer sta E_1 in F_1 linearna polinoma

zRx = [0,2,4,6;0,6,4,6;0,2,4,6;0,2,4,6];
zRy = [0,0,0,0;2,6,2,2;4,4,4,4;6,6,6,6];
zRz = [0,4,4,0;0,12,6,2;2,6,6,2;0,4,0,0];

%èe je e1=1
zSx1 = [-6,-4,-2,0;-6,-4,0,0;-6,-4,0,0;-6,-4,-2,0];
zSy1 = [0,0,-6,0;2,2,0,2;4,4,0,4;6,6,10,6];
zSz1 = [0,4,-4,0;2,6,0,0;2,6,0,2;0,0,-8,0];

%èe je e1=2
zSx2 = [-6,-4,-2,0;-6,-4,0,0;-6,-4,0,0;-6,-4,-4,0];
zSy2 = [0,0,-6,0;2,2,0,2;4,4,0,4;6,6,10,6];
zSz2 = [0,4,-4,0;2,6,0,0;2,6,0,2;0,0,-12,0];

%èe je e1=5
zSx2 = [-6,-4,-2,0;-6,-4,0,0;-6,-4,0,0;-6,-4,-10,0];
zSy2 = [0,0,-6,0;2,2,0,2;4,4,0,4;6,6,10,6];
zSz2 = [0,4,-4,0;2,6,0,0;2,6,0,2;0,0,-24,0];

[Rx1,Ry1,Rz1,Sx1,Sy1,Sz1]=primer2(zRx,zRy,zRz,zSx1,zSy1,zSz1);
[Rx2,Ry2,Rz2,Sx2,Sy2,Sz2]=primer2(zRx,zRy,zRz,zSx2,zSy2,zSz2);

u=linspace(0,1,50);
v=linspace(0,1,50);

[rx1,ry1,rz1]=bezier2(Rx1,Ry1,Rz1,u,v);
[sx1,sy1,sz1]=bezier2(Sx1,Sy1,Sz1,u,v);

[rx2,ry2,rz2]=bezier2(Rx2,Ry2,Rz2,u,v);
[sx2,sy2,sz2]=bezier2(Sx2,Sy2,Sz2,u,v);

figure

subplot(1,2,1,'Position',[0.01,0,0.38,1])
hold on
set(gca,'visible','off')
set(gca,'xlim',[-6,6])
surf(rx1,ry1,rz1,'EdgeColor','blue')
mesh(Rx1,Ry1,Rz1,'Facecolor','none','EdgeColor','black')
surf(sx1,sy1,sz1,'EdgeColor','red')
mesh(Sx1,Sy1,Sz1,'Facecolor','none','EdgeColor','black')
%scatter3(meja(1,:),meja(2,:),meja(3,:))
hold off

subplot(1,2,2,'Position',[0.48,0,0.52,1])
hold on
set(gca,'visible','off')
set(gca,'xlim',[-10,6])
surf(rx2,ry2,rz2,'EdgeColor','blue')
mesh(Rx2,Ry2,Rz2,'Facecolor','none','EdgeColor','black')
surf(sx2,sy2,sz2,'EdgeColor','red')
mesh(Sx2,Sy2,Sz2,'Facecolor','none','EdgeColor','black')
%scatter3(meja(1,:),meja(2,:),meja(3,:))
hold off
