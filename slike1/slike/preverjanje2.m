zRx = [0,2,6,8;1,3,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
zRy = [0,1,0,-1;2,2,3,NaN;4,3,NaN,NaN;5,NaN,NaN,NaN];
zRz = [-2,1,-2,0;4,-2,3,NaN;0,5,NaN,NaN;3,NaN,NaN,NaN];

zSx = [0,2,6,8;1,3,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
zSy = [0,1,0,-1;-2,-2,-3,NaN;-4,-3,NaN,NaN;-5,NaN,NaN,NaN];
zSz = [-2,1,-2,0;-4,2,-3,NaN;0,-5,NaN,NaN;-3,NaN,NaN,NaN];

% zRx = [3,3,3,3;2,2,2,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];
% zRy = [-1.5,-0.5,0.5,1.5;-1,0,1,NaN;-0.5,0.5,NaN,NaN;0,NaN,NaN,NaN];
% zRz = [1.5,1.5,1.5,1.5;1.5,1.5,1.5,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];
% 
% zSx = [3,3,3,3;4,4,4,NaN;5,5,NaN,NaN;6,NaN,NaN,NaN];
% zSy = [-1.5,-0.5,0.5,1.5;-1,0,1,NaN;-0.5,0.5,NaN,NaN;0,NaN,NaN,NaN];
% zSz = [1.5,1.5,1.5,1.5;1.5,1.5,1.5,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];

lambda0=1/3;
lambda1=1/4;
mi0=1/4;
mi1=1/2;

[Rx,Ry,Rz,Sx,Sy,Sz]=primerTrikotne(zRx,zRy,zRz,zSx,zSy,zSz,lambda0,mi0,lambda1,mi1);

%vektorji, na podlagi katerih izraèunamo lambda in mi
v1x=Sx(2,1)-Rx(1,1);
v1y=Sy(2,1)-Ry(1,1);
v1z=Sz(2,1)-Rz(1,1);

v2x=Rx(2,1)-Rx(1,1);
v2y=Ry(2,1)-Ry(1,1);
v2z=Rz(2,1)-Rz(1,1);

v3x=Rx(1,2)-Rx(1,1);
v3y=Ry(1,2)-Ry(1,1);
v3z=Rz(1,2)-Rz(1,1);

v4x=Sx(2,3)-Rx(1,3);
v4y=Sy(2,3)-Ry(1,3);
v4z=Sz(2,3)-Rz(1,3);

v5x=Rx(2,3)-Rx(1,3);
v5y=Ry(2,3)-Ry(1,3);
v5z=Rz(2,3)-Rz(1,3);

v6x=Rx(1,4)-Rx(1,3);
v6y=Ry(1,4)-Ry(1,3);
v6z=Rz(1,4)-Rz(1,3);

%cramer
p10=[v2x;v2y;v2z];
q10=[v1x;v1y;v1z];
z0=[v3x;v3y;v3z];
n1=cross(p10,z0);

e0=det([q10,z0,n1])/det([p10,z0,n1]);
f0=det([p10,q10,n1])/det([p10,z0,n1]);

p1n=[v5x;v5y;v5z];
q1n=[v4x;v4y;v4z];
zn=[v6x;v6y;v6z];
n2=cross(p1n,zn);

e1=det([q1n,zn,n2])/det([p1n,zn,n2]);
f1=det([p1n,q1n,n2])/det([p1n,zn,n2]);

lambda0=e0/(e0-1);
mi0=(1-lambda0)*f0;
lambda1=e1/(e1-1);
mi1=(1-lambda1)*f1;