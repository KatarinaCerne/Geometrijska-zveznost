zRx = [0,2,4,6,8,10;0,2,4,6,8,10;0,2,4,6,8,10;0,2,4,6,8,10;0,2,4,6,8,10;0,2,4,6,8,10];
zRy = [0,0,0,0,0,0;2,2,2,2,2,2;4,4,4,4,4,4;6,6,6,6,6,6;8,8,8,8,8,8;10,10,10,10,10,10];
zRz = [0,4,4,0,2,0;0,6,6,2,4,2;2,6,6,2,3,2;0,4,0,0,1,1;-1,2,0,-1,-1,0;0,4,4,0,0,1];

zSx = [-10,-8,-6,-4,-2,0;-10,-8,-6,-4,0,0;-10,-8,-6,-4,0,0;-10,-8,-6,-4,0,0;-10,-8,-6,-4,0,0;-10,-8,-6,-4,-2,0];    
zSy = [0,0,0,0,0,0;2,2,2,2,0,2;4,4,4,4,0,4;6,6,6,6,0,6;8,8,8,8,0,8;10,10,10,10,10,10];
zSz = [0,2,0,4,-4,0;2,4,2,6,0,0;2,3,2,6,0,2;1,1,0,0,0,0;0,-1,-1,0,0,-1;1,0,0,4,-4,0];

e20=2;
e21=2;
f20=-1;
f21=1;

n=5;
mr=5;
ms=5;

Rx = zRx;
Ry = zRy;
Rz = zRz;
Sx = zSx;
Sy = zSy;
Sz = zSz;

meja=[Rx(:,1)';Ry(:,1)';Rz(:,1)']; % kontrolne toèke na skupnem robu

zx=zeros(1,n); %x-koordinate vektorjev z_i=P_{0,j+1}-P_{0,j}
zy=zeros(1,n); %y-koordinate vektorjev z_i
zz=zeros(1,n); %z-koordinate vektorjev z_i
for i=1:n
    zx(1,i)=meja(1,i+1)-meja(1,i);
    zy(1,i)=meja(2,i+1)-meja(2,i);
    zz(1,i)=meja(3,i+1)-meja(3,i);
end

px=zeros(1,n+1); %x-koordinate vektorjev p1j=P1j-P0j
py=zeros(1,n+1); %y-koordinate vektorjev p1j
pz=zeros(1,n+1); %z-koordinate vektorjev p1j
for i=1:n+1
    px(1,i)=Rx(i,2)-Rx(i,1);
    py(1,i)=Ry(i,2)-Ry(i,1);
    pz(1,i)=Rz(i,2)-Rz(i,1);
end

sx=zeros(1,n-1); %x-koordinate vektorjev sj=Z_{k+2}-2Z_{k+1}+Z_{k}
sy=zeros(1,n-1);
sz=zeros(1,n-1);
for i=1:n-1
   sx(1,i)=meja(1,i+2)-2*meja(1,i+1)+meja(1,i);
   sy(1,i)=meja(2,i+2)-2*meja(2,i+1)+meja(2,i); 
   sz(1,i)=meja(3,i+2)-2*meja(3,i+1)+meja(3,i); 
end

p2x=zeros(1,n+1);
p2y=zeros(1,n+1);
p2z=zeros(1,n+1);
for i=1:n+1
   p2x(1,i)=Rx(i,3)-2*Rx(i,2)+Rx(i,1);
   p2y(1,i)=Ry(i,3)-2*Ry(i,2)+Ry(i,1); 
   p2z(1,i)=Rz(i,3)-2*Rz(i,2)+Rz(i,1); 
end

p10=[px(1);py(1);pz(1)];
q10=[Sx(1,ms+1)-Sx(1,ms);Sy(1,ms+1)-Sy(1,ms);Sz(1,ms+1)-Sz(1,ms)];
z0=[zx(1);zy(1);zz(1)];
n1=cross(p10,z0);

e10=det([ms*q10,n*z0,n1])/det([mr*p10,n*z0,n1]);
f10=det([mr*p10,ms*q10,n1])/det([mr*p10,n*z0,n1]);

p1n=[px(n+1);py(n+1);pz(n+1)];
q1n=[Sx(n+1,ms+1)-Sx(n+1,ms);Sy(n+1,ms+1)-Sy(n+1,ms);Sz(n+1,ms+1)-Sz(n+1,ms)];
zn=[zx(n);zy(n);zz(n)];
n2=cross(p1n,zn);

e11=det([ms*q1n,n*zn,n2])/det([mr*p1n,n*zn,n2]);
f11=det([mr*p1n,ms*q1n,n2])/det([mr*p1n,n*zn,n2]);

hold on
set(gca,'visible','off')
%surf(rx,ry,rz,'Facecolor','white','EdgeColor','blue')
mesh(Rx,Ry,Rz,'Facecolor','none','EdgeColor','black')
%surf(sx,sy,sz,'Facecolor','white','EdgeColor','red')
mesh(Sx,Sy,Sz,'Facecolor','none','EdgeColor','black')
hold off