% Bx = [3,3,3,3;2,2,2,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];
% By = [-1.5,-0.5,0.5,1.5;-1,0,1,NaN;-0.5,0.5,NaN,NaN;0,NaN,NaN,NaN];
% Bz = [1.5,1.5,1.5,1.5;1.5,1.5,1.5,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];
% 
% Bx2 = [3,3,3,3;4,4,4,NaN;5,5,NaN,NaN;6,NaN,NaN,NaN];
% By2 = [-1.5,-0.5,0.5,1.5;-1,0,1,NaN;-0.5,0.5,NaN,NaN;0,NaN,NaN,NaN];
% Bz2 = [1.5,1.5,1.5,1.5;1.5,1.5,1.5,NaN;1,1,NaN,NaN;0,NaN,NaN,NaN];

Bx = [0,2,6,8;1,3,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
By = [0,1,0,-1;2,2,3,NaN;4,3,NaN,NaN;5,NaN,NaN,NaN];
Bz = [-2,1,-2,0;-4,2,-3,NaN;0,-5,NaN,NaN;-3,NaN,NaN,NaN];

Bx2 = [0,2,6,8;1,3,7,NaN;2,5,NaN,NaN;4,NaN,NaN,NaN];
By2 = [0,1,0,-1;-2,-2,-3,NaN;-4,-3,NaN,NaN;-5,NaN,NaN,NaN];
Bz2 = [-2,1,-2,0;4,-2,3,NaN;0,5,NaN,NaN;3,NaN,NaN,NaN];

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

b = bezier3(Bx,By,Bz,U2);
bb = bezier3(Bx2,By2,Bz2,U2);

%odstranimo NaNe:
Bx1 = [3,3,3,3,2,2,2,1,1,0];
By1 = [-1.5,-0.5,0.5,1.5,-1,0,1,-0.5,0.5,0];
Bz1 = [1.5,1.5,1.5,1.5,1.5,1.5,1.5,1,1,0];

Bx3 = [3,3,3,3,4,4,4,5,5,6];
By3 = [-1.5,-0.5,0.5,1.5,-1,0,1,-0.5,0.5,0];
Bz3 = [1.5,1.5,1.5,1.5,1.5,1.5,1.5,1,1,0];

n=3; % stopnja
st_tock = length(Bx1); %število kontrolnih toèk
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
b3 = bezier3(Bx,By,Bz,U4);
bb3 = bezier3(Bx2,By2,Bz2,U4);
%trisurf(TRI3,b3(:,1),b3(:,2),b3(:,3));
TRI2 = delaunay(U3(:,1),U3(:,2)); %triangulacija za risanje kontrolne mreže
%set(gca,'visible','off')
hold on
trisurf(TRI,b(:,1),b(:,2),b(:,3))
trisurf(TRI,bb(:,1),bb(:,2),bb(:,3))
%trimesh(TRI4,Bx1,By1,Bz1,'Facecolor','none', 'EdgeColor','blue');
%trimesh(TRI4,Bx3,By3,Bz3,'Facecolor','none', 'EdgeColor','red');
hold off