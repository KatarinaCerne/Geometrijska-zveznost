function b = bezier3 ( Bx , By , Bz , U )
% Opis :
% bezier3 izraèuna toèke na trikotni Bezierjevi ploskvi
%
% Definicija :
% b = bezier3 (Bx ,By ,Bz ,U)
%
% Vhodni podatki :
% Bx , By , Bz matrike velikosti n+1 x n+1 , ki doloèajo
% koordinate kontrolnih toèk Bezierjeve krpe
% ( element posamezne matrike na mestu (i,j),
% j <= n+2 -i, doloèa koordinato kontrolne
% toèke z indeksom (n+2 -i-j, j -1 , i -1)),
%
% U matrika , v kateri vrstice predstavljajo
% baricentriène koordinate toèk glede na
% domenski trikotnik , za katere raèunamo
% toèke na Bezierjevi krpi
%
% Izhodni podatek :
% b matrika , v kateri vsaka vrstica predstavlja
% toèko na Bezierjevi krpi p

%n = size(Bx,1)-1;
vel = size(U,1);

b = zeros(vel,3);

for i=1:3
    for j=1:vel
        bez_b = U(j,:);
        if i==1
           b(j,1) = decasteljau3(Bx,bez_b); 
        elseif i==2
           b(j,2) = decasteljau3(By,bez_b);  
        elseif i==3
           b(j,3) = decasteljau3(Bz,bez_b); 
        end
    end
end


end