zRx = [0,2,6,8;1,3,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
zRy = [0,1,0,-1;2,2,3,NaN;4,3,NaN,NaN;5,NaN,NaN,NaN];
zRz = [-2,1,-2,0;4,-2,3,NaN;0,5,NaN,NaN;3,NaN,NaN,NaN];

zSx = [0,2,6,8;1,4,7,NaN;3,5,NaN,NaN;3,NaN,NaN,NaN];
zSy = [0,1,0,-1;-1,0,-1,NaN;-2,-3,NaN,NaN;-3,NaN,NaN,NaN];
zSz = [-2,1,-2,0;1.5,1.5,1.5,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];

lambda0=1/3;
lambda1=1/4;
mi0=1/4;
mi1=1/2;

[Rx,Ry,Rz,Sx,Sy,Sz]=primerTrikotne(zRx,zRy,zRz,zSx,zSy,zSz,lambda0,mi0,lambda1,mi1);


% Rx = [3,3,3,3;2,2,2,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];
% Ry = [-1.5,-0.5,0.5,1.5;-1,0,1,NaN;-0.5,0.5,NaN,NaN;0,NaN,NaN,NaN];
% Rz = [1.5,1.5,1.5,1.5;1.5,1.5,1.5,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];
% 
% Sx = [3,3,3,3;4,4,4,NaN;5,5,NaN,NaN;6,NaN,NaN,NaN];
% Sy = [-1.5,-0.5,0.5,1.5;-1,0,1,NaN;-0.5,0.5,NaN,NaN;0,NaN,NaN,NaN];
% Sz = [1.5,1.5,1.5,1.5;1.5,1.5,1.5,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];


% Rx = [0,2,6,8;1,-0.4688,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
% Ry = [0,1,0,-1;2,5.4149,3,NaN;4,3,NaN,NaN;5,NaN,NaN,NaN];
% Rz = [-2,1,-2,0;4,16.3559,3,NaN;0,5,NaN,NaN;3,NaN,NaN,NaN];
% 
% Sx = [0,2,6,8;0.25,5.1563,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
% Sy = [0,1,0,-1;-0.625,-1.2309,-1.6667,NaN;-4,-3,NaN,NaN;-5,NaN,NaN,NaN];
% Sz = [-2,1,-2,0;-3.875,-6.7483,-2.3333,NaN;0,-5,NaN,NaN;-3,NaN,NaN,NaN];

% Rx = [0,2,6,8;1,Inf,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
% Ry = [0,1,0,-1;2,Inf,3,NaN;4,3,NaN,NaN;5,NaN,NaN,NaN];
% Rz = [-2,1,-2,0;4,Inf,3,NaN;0,5,NaN,NaN;3,NaN,NaN,NaN];
% 
% Sx = [0,2,6,8;0.25,Inf,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
% Sy = [0,1,0,-1;-0.625,Inf,-1.6667,NaN;-4,-3,NaN,NaN;-5,NaN,NaN,NaN];
% Sz = [-2,1,-2,0;-3.875,Inf,-2.3333,NaN;0,-5,NaN,NaN;-3,NaN,NaN,NaN];

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



%odstranimo NaNe:
% Rx1 = [0,2,6,8,1,3,7,2,5,4];
% Ry1 = [0,1,0,-1,2,2,3,4,3,5];
% Rz1 = [-2,1,-2,0,4,-2,3,0,5,3];
% 
% Sx1 = [0,2,6,8,1,4,7,3,5,3];
% Sy1 = [0,1,0,-1,-1,0,-1,-2,-3,-3];
% Sz1 = [-2,1,-2,0,1.5,1.5,1.5,1,1,0];

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
set(gca,'visible','off')
hold on
trisurf(TRI,b(:,1),b(:,2),b(:,3))
trisurf(TRI,b1(:,1),b1(:,2),b1(:,3))
trimesh(TRI4,Rx1,Ry1,Rz1,'Facecolor','none', 'EdgeColor','black');
trimesh(TRI4,Sx1,Sy1,Sz1,'Facecolor','none', 'EdgeColor','black');
hold off
pbaspect([1,1,1])