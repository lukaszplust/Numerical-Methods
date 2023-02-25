
% 1. Omów argumenty i rezultat wywołania B=sparse(w1,w2,w3,M,M).
M = 7;
w1=([4 6 3 4 5 5 6 7 5 6 4 6 4 7 6]);
w2=([1 1 2 2 2 3 3 3 4 4 5 5 6 6 7]);
w3=([2 3 4 3 5 5 6 7 1 4 7 6 4 7 6]);
B =sparse(w1,w2,w3,M,M);
%A =sparse(w1,w2,1,M,M);

%2. Omów argumenty i rezultat wywołania C=spdiags(rand(M,1),0,M,M).

C=spdiags(rand(M,1),0,M,M);

%3. Omów wywołanie [w1,w2,w3]=find(B). ???????
[w1,w2,w3]=find(B);

%4. Omów wywołanie spy(B).


%5. Omów wywołanie A=zeros(M).
A=zeros(M);

%6.Omów wywołanie A(2:5,3)=7.
A(2:5,3)=7; % -> wiersze od 2 do 5 kolumny 3 wypelniam 7

%7. Omów wywołanie D=sparse(A).

D=sparse(A); % z tej utworzonej znajduje tam gdzie jest 7 i 
% wypisuje mi np (2,3) 7, (3,3) 7 itp

%8. Omów wywołanie E=full(B).
E=full(B); % wypelniam macierz E tym co jest w B np w B
% (4,1) 2 -> do 1 kolumny w 4 wierszy wpisuje 2 dla macierzy E


%9. Omów wywołanie F=eye(M).

F=eye(M); % utworze macierz 7 na 7 z jedynkami na przekatnej

%10. Omów wywołanie G=speye(M).

G=speye(M); % nie przedstawione w postaci macierzy

