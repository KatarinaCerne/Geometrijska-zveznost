function [bx,by,bz] = bezier2(Bx ,By ,Bz,u,v)
% Opis:
%   bezier2  vrne  toèke  na  Bezierjevi  ploskvi  iz  tenzorskega
%   produkta
%
% Definicija:
%   [bx ,by,bz] = bezier2(Bx,By ,Bz,u,v)
%
% Vhodni  podatki:
%   Bx , By, Bz    matrike  velikosti n+1 x m+1, ki  doloèajo
%   koordinate  kontrolnih  toèk ,
%   u, v
%   vrstici  dolžine M in N, ki  predstavljata
%   parametre v smereh u in v.
%
% Izhodni  podatki:
%   bx , by, bz    matrike  velikosti N x M, ki  predstavljajo
%   toèke  na  Bezierjevi  ploskvi:
%   [bx(J,I) by(J,I) bz(J,I)] je  toèka  pri
%   parametrih u(I) in v(J).

n = size(Bx,1)-1; %stopnja v v-smeri
m = size(Bx,2)-1; %stopnja v u-smeri

N = length(v); %št. toèk v v-smeri
M = length(u); %št. toèk v u-smeri

bx = zeros(N,M); %u teèe, v fiksen: vrstica
by = zeros(N,M);
bz = zeros(N,M);

for iu = 1:length(u)
    for iv = 1:length(v)
        novi_b = zeros(m+1,3);
        %pri fiksnem u imamo krivuljo stopnje n s kontrolnimi toèkami 
        %sum_{i=0}^m b_ij B_i^m(u)
        for i=1:m+1
            b_za_not = [Bx(:,i),By(:,i),Bz(:,i)]; %velikosti (n+1)x3
            %to je kontrolni poligon za prerez pri fiksnem u
            novi_b(i,:)=bezier(b_za_not,v(iv)); %bezier vrne vrstico
            %sem shranimo toèke sum_{i=0}^m b_ij B_i^m(u) - to je ena
            %vrstica v novi_b
            %novi_b je kontrolni poligon za zadnjega decasteljauja, ki ga
            %moramo izvesti
        end        
        vrednost = bezier(novi_b,u(iu));
        bx(iv,iu)=vrednost(1);
        by(iv,iu)=vrednost(2);
        bz(iv,iu)=vrednost(3);
    end
    
end

end