function [Rx,Ry,Rz,Sx,Sy,Sz]=primer1(zRx,zRy,zRz,zSx,zSy,zSz)
%funkcija izraèuna manjkajoèe kontrolne toèke, tako da sta ploskvi R in S na
%skupnem robu G^1-zvezni, v primeru da so povezovalne funkcije minimalnih
%stopenj in da imata ploskvi enako stopnjo v drugi spr.

%Vhod:
%-matrike zRx,zRy,zRz vsebujejo x, y in z-koordinate vnaprej izbranih kontrolnih
%toèk ploskve R 
%-matrike zSx,zSy,zSz vsebujejo x, y in z-koordinate vnaprej izbranih kontrolnih
%toèk ploskve S. na mestih, kjer kontrolne toèke še niso doloèene, vsebujejo 0 

%Izhod:
%-matrike Rx,Ry,Rz,Sx,Sy,Sz vsebujejo x, y in z-koordinate kontrolnih toèk
%ploskev R in S, izraèunanih tako, da sta na stiku ploskvi G^1-zvezni

n=size(zRx,1)-1; %stopnja v 2. spr.
mr=size(zRx,2)-1; %stopnja R v 1. spr.
ms=size(zSx,2)-1; %stopnja S v 1. spr.

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

%cramer
p10=[px(1);py(1);pz(1)];
q10=[Sx(1,ms+1)-Sx(1,ms);Sy(1,ms+1)-Sy(1,ms);Sz(1,ms+1)-Sz(1,ms)];
z0=[zx(1);zy(1);zz(1)];
n1=cross(p10,z0);

e0=det([ms*q10,n*z0,n1])/det([mr*p10,n*z0,n1]);
f0=det([mr*p10,ms*q10,n1])/det([mr*p10,n*z0,n1]);

p1n=[px(n+1);py(n+1);pz(n+1)];
q1n=[Sx(n+1,ms+1)-Sx(n+1,ms);Sy(n+1,ms+1)-Sy(n+1,ms);Sz(n+1,ms+1)-Sz(n+1,ms)];
zn=[zx(n);zy(n);zz(n)];
n2=cross(p1n,zn);

e1=det([ms*q1n,n*zn,n2])/det([mr*p1n,n*zn,n2]);
f1=det([mr*p1n,ms*q1n,n2])/det([mr*p1n,n*zn,n2]);

%notranje kontrolne toèke
for i=2:n
Sx(i,ms)=Sx(i,ms+1)-e0*px(i)*(mr/ms)-(n/ms)*(f0*zx(i)*(1-((i-1)/n))+f1*zx(i-1)*((i-1)/n));
Sy(i,ms)=Sy(i,ms+1)-e0*py(i)*(mr/ms)-(n/ms)*(f0*zy(i)*(1-((i-1)/n))+f1*zy(i-1)*((i-1)/n));
Sz(i,ms)=Sz(i,ms+1)-e0*pz(i)*(mr/ms)-(n/ms)*(f0*zz(i)*(1-((i-1)/n))+f1*zz(i-1)*((i-1)/n));
end


end