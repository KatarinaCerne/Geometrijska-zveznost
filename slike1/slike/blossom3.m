function b = blossom3(B,U)
% Opis:
%   blossom3  izraèuna  razcvet  polinoma  dveh  spremenljivk
%
% Definicija:
%   b = blossom3(B,U)
% Vhodna  podatka:
%   B   matrika  velikosti n+1 x n+1, ki  predstavlja
%   koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%   Bezierjevi  obliki (element  matrike  na  mestu (i,j),
%   j  <= n+2-i, doloèa  koeficient  polinoma z indeksom
%   n+2-i-j, j-1, i-1)),
%   u   matrika  velikosti n x 3, v kateri  vrstice
%   predstavljavo  baricentriène  koordinate  toèk  glede
%   na  domenski  trikotnik , za  katere  izvajamo  razcvet
%   polinoma
%
% Izhodni  podatek:
%   b   vrednost  razcveta  polinoma , doloèenega z matriko B,
%   v toèkah , doloèenih z matriko u

n = size(U,1);

for k=1:n
    for i = 1:(n+1-k)
        for j = 1:(n-k+1)
            B(i,j)=B(i,j)*U(k,1)+B(i,j+1)*U(k,2)+B(i+1,j)*U(k,3);
        end
    end  
    
end
   b = B(1,1); 
end