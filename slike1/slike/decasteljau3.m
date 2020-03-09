function b = decasteljau3(B,u)
% Opis:
%   decasteljau3
%
% Definicija:
%   b = decasteljau3(B,u)
% Vhodna  podatka:
%   B   matrika  velikosti n+1 x n+1, ki  predstavlja
%   koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%   Bezierjevi  obliki (element  matrike  na  mestu (i,j),
%   j  <= n+2-i, doloèa  koeficient  polinoma z indeksom
%   n+2-i-j, j-1, i-1)),
%   u   baricentriène koordinate toèke
%
% Izhodni  podatek:
%   b   vrednost  v toèki u

n = size(B,1)-1;

for k=1:n
    for i = 1:(n+1-k)
        for j = 1:(n-k+1)
            B(i,j)=B(i,j)*u(1)+B(i,j+1)*u(2)+B(i+1,j)*u(3);
        end
    end  
    
end
   b = B(1,1); 
end