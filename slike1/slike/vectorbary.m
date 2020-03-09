function b_k = vectorbary(t,T)
x=t(1);
y=t(2);
A = [1,1,1;T(1,1),T(2,1),T(3,1);T(1,2),T(2,2),T(3,2)];

b_k = A\[0;x;y];
% u=b_k(1);
% v=b_k(2);
% w=b_k(3);



end