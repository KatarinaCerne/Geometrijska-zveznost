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

% %vektorji, na podlagi katerih izraèunamo lambda in mi
% v1x=Rx(2,2)-Rx(1,1);
% v1y=Ry(2,2)-Ry(1,1);
% v1z=Rz(2,2)-Rz(1,1);
% 
% v2x=Sx(2,2)-Rx(1,1);
% v2y=Sy(2,2)-Ry(1,1);
% v2z=Sz(2,2)-Rz(1,1);
% 
% v3x=Rx(1,2)-Rx(1,1);
% v3y=Ry(1,2)-Ry(1,1);
% v3z=Rz(1,2)-Rz(1,1);
% 
% v4x=Rx(2,3)-Rx(1,3);
% v4y=Ry(2,3)-Ry(1,3);
% v4z=Rz(2,3)-Rz(1,3);
% 
% v5x=Sx(2,3)-Rx(1,3);
% v5y=Sy(2,3)-Ry(1,3);
% v5z=Sz(2,3)-Rz(1,3);
% 
% v6x=Rx(1,4)-Rx(1,3);
% v6y=Ry(1,4)-Ry(1,3);
% v6z=Rz(1,4)-Rz(1,3);
% 
% %cramer
% p10=[v1x;v1y;v1z];
% q10=[v2x;v2y;v2z];
% z0=[v3x;v3y;v3z];
% n1=cross(p10,z0);
% 
% e0=det([q10,z0,n1])/det([p10,z0,n1]);
% f0=det([p10,q10,n1])/det([p10,z0,n1]);
% 
% p1n=[v4x;v4y;v4z];
% q1n=[v5x;v5y;v5z];
% zn=[v6x;v6y;v6z];
% n2=cross(p1n,zn);
% 
% e1=det([q1n,zn,n2])/det([p1n,zn,n2]);
% f1=det([p1n,q1n,n2])/det([p1n,zn,n2]);
% 
% lambda0=1/(e0-1);
% mi0=(e0-2)/(e0-1)*f0;
% lambda1=1/(e1-1);
% mi1=(e1-2)/(e1-1)*f1;

A = [2*(1-lambda0),2*lambda0;2*(1-lambda1),2*lambda1];
bx = [-(1-lambda1)*Sx(2,1)-lambda1*Rx(2,1)+(1-mi0)*2*Rx(1,2)+(1-mi1)*Rx(1,1)+mi0*2*Rx(1,3)+mi1*Rx(1,2);
    -(1-lambda0)*Sx(2,3)-lambda0*Rx(2,3)+(1-mi0)*Rx(1,3)+2*(1-mi1)*Rx(1,2)+mi0*Rx(1,4)+mi1*2*Rx(1,3)];
by = [-(1-lambda1)*Sy(2,1)-lambda1*Ry(2,1)+(1-mi0)*2*Ry(1,2)+(1-mi1)*Ry(1,1)+mi0*2*Ry(1,3)+mi1*Ry(1,2);
    -(1-lambda0)*Sy(2,3)-lambda0*Ry(2,3)+(1-mi0)*Ry(1,3)+2*(1-mi1)*Ry(1,2)+mi0*Ry(1,4)+mi1*2*Ry(1,3)];
bz = [-(1-lambda1)*Sz(2,1)-lambda1*Rz(2,1)+(1-mi0)*2*Rz(1,2)+(1-mi1)*Rz(1,1)+mi0*2*Rz(1,3)+mi1*Rz(1,2);
    -(1-lambda0)*Sz(2,3)-lambda0*Rz(2,3)+(1-mi0)*Rz(1,3)+2*(1-mi1)*Rz(1,2)+mi0*Rz(1,4)+mi1*2*Rz(1,3)];

resx=A\bx;
resy=A\by;
resz=A\bz;
Sx(2,2)=resx(1);
Rx(2,2)=resx(2);
Sy(2,2)=resy(1);
Ry(2,2)=resy(2);
Sz(2,2)=resz(1);
Rz(2,2)=resz(2);

d = 50;
u = linspace(0,1,d); %imeli bomo pravokoten trikotnik, kateti razdelimo na 50 delov
dim = nchoosek(d+1,2); %v trikotniku bo toliko toèk

U1 = zeros(dim,2); %sem shranjujemo karteziène koordinate toèk v trikotniku
U2 = zeros(dim,3); %baricentriène koordinate 

T=[0,0;1,0;0,1]; % vrstice so krajišèa trikotnika

k=1;
%naraèunamo toèke v trikotniku
%v teh toèkah bomo potem raèunali vrednosti bez. krpe
for i=1:d
   for j=1:d+1-i
       U1(k,:)=[u(i),u(j)];
       U2(k,:)=pointbary(U1(k,:),T);
       k=k+1;
   end
end

TRI = delaunay(U1(:,1),U1(:,2)); %triangulacija za risanje krpe

b = bezier3(Rx,Ry,Rz,U2);
b1 = bezier3(Sx,Sy,Sz,U2);

%odstranimo NaN
Rx1=Rx';
Ry1=Ry';
Rz1=Rz';
Sx1=Sx';
Sy1=Sy';
Sz1=Sz';

Rx1=Rx1(:)';
Ry1=Ry1(:)';
Rz1=Rz1(:)';
Sx1=Sx1(:)';
Sy1=Sy1(:)';
Sz1=Sz1(:)';

indeksi=isnan(Rx1);
Rx1(indeksi)=[];
indeksi=isnan(Ry1);
Ry1(indeksi)=[];
indeksi=isnan(Rz1);
Rz1(indeksi)=[];
indeksi=isnan(Sx1);
Sx1(indeksi)=[];
indeksi=isnan(Sy1);
Sy1(indeksi)=[];
indeksi=isnan(Sz1);
Sz1(indeksi)=[];

n=3; % stopnja
st_tock = length(Rx); %število kontrolnih toèk
U3 = zeros(st_tock,2); %sem bomo shranili karteziène koordinate domenskih toèk
%("nad" domenskimi toèkami ležijo kontrolne toèke)

l=1;
for k=1:n+1
   for j=1:n+2-k
     i=n+2-k-j;
     U3(l,:) = (i/n).*T(1,:)+((j-1)/n).*T(2,:)+((k-1)/n).*T(3,:); %domenske toèke
     [i,j-1,k-1];
     l=l+1;
   end
end

[TRI3,U4]=trimeshgrid(10);
[TRI4,U5]=trimeshgrid(3);
b3 = bezier3(Rx,Ry,Rz,U4);
%trisurf(TRI3,b3(:,1),b3(:,2),b3(:,3));
TRI2 = delaunay(U3(:,1),U3(:,2)); %triangulacija za risanje kontrolne mreže
%set(gca,'visible','off')
hold on
trisurf(TRI,b(:,1),b(:,2),b(:,3))
trisurf(TRI,b1(:,1),b1(:,2),b1(:,3))
trimesh(TRI4,Rx1,Ry1,Rz1,'Facecolor','none', 'EdgeColor','black');
trimesh(TRI4,Sx1,Sy1,Sz1,'Facecolor','none', 'EdgeColor','red');
hold off