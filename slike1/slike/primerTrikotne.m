function [Rx,Ry,Rz,Sx,Sy,Sz]=primerTrikotne(zRx,zRy,zRz,zSx,zSy,zSz,lambda0,mi0,lambda1,mi1)

Rx=zRx;
Ry=zRy;
Rz=zRz;
Sx=zSx;
Sy=zSy;
Sz=zSz;

n=size(Rx,1)-1; %stopnja ploskve

%pogoji pri v=0
Sx(2,1)=(1/(1-lambda0))*(-lambda0*Rx(2,1)+(1-mi0)*Rx(1,1)+mi0*Rx(1,2));
Sy(2,1)=(1/(1-lambda0))*(-lambda0*Ry(2,1)+(1-mi0)*Ry(1,1)+mi0*Ry(1,2));
Sz(2,1)=(1/(1-lambda0))*(-lambda0*Rz(2,1)+(1-mi0)*Rz(1,1)+mi0*Rz(1,2));

%pogoji pri v=1
Sx(2,n)=(1/(1-lambda1))*(-lambda1*Rx(2,n)+(1-mi1)*Rx(1,n)+mi1*Rx(1,n+1));
Sy(2,n)=(1/(1-lambda1))*(-lambda1*Ry(2,n)+(1-mi1)*Ry(1,n)+mi1*Ry(1,n+1));
Sz(2,n)=(1/(1-lambda1))*(-lambda1*Rz(2,n)+(1-mi1)*Rz(1,n)+mi1*Rz(1,n+1));

%notranje kontrolne toèke


end