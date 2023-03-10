%sparse=macierze rzadkie
%ZAD A
%wygenerowanie tablicy edges
Edges = sparse([1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7;
                4, 6, 4, 5, 3, 6, 5, 7, 6, 5, 6, 4, 4, 7, 6]);

%ZAD B
N = 7; %liczba stron w sieci
d = 0.85;%parametr z polecenia

%macierz sąsiedztwa->przedstawia za pomoca macierzy sasiedztwa polaczenie sieci
B = sparse(Edges(2,:), Edges(1,:),1,N,N); %1->wartosc elementow niezerowych

%do B potrzebuje ones hmmm czy na pewno?

%macierz jednostkowa
I = speye(N);

%L(i) wyznaczam dzięki wczesniej obliczonej macierzy B
%L(i) -> liczba linków wychodzacych ze strony i-tej
L = zeros(1,N);

for i = 1:N
    L(i) = sum(B(:,i));
end
L = sparse(L)';%tu trzeba zrobic transpozycje 
%dzieki sparse podawane sa tylko dane odnosnie wartosci, pomija sie 0

%wektor b
b = zeros(N,1);
b(:,1) = (1-d)/N;%wypelniam cala kolumne(dlatego biore wszystkie wiersze czyli -> :, i pierwsza kolumne ->1)

%macierz diagonalna->wartosci tylko na przekatnej,reszta rowna 0
A=spdiags(1./L,0,N,N);

M = sparse(I - d*B*A); %macierz M
%ZAD C
whos A B I M b
%ZAD D
spy(B);
print -dpng spy_b

%ZAD E
%r->wartosci PR wszystkich N stron w sieci
r = M\b;

bar(r);
saveas(gcf, "bar.png");
