%1
a = 1;%bok kwadratu
r_max = a/3;%promien
n_max = 100;%ilosc pecherzykow

%2
X = 0;%wspolrzedna X srodka kola
Y = 0;%wspolrzedna Y srodka kola
R = 0;%promien

n = 0;%2d chyba -> pocztkowa wartosc narysowanych okregow(ilosc)

x = [];%zapamietana wartosc X okregu
y = [];%zapamietana wartosc Y okregu
r = [];%zapamietana wartosc R okregu

count = 0;%liczba prob losowania kolka
all_area = [];%powierzchnia calkowita
counter = [];

while (n <= n_max)% wartosc jest mniejsza od maksymalnej
    fit = false;%ustawiam flage na false->zakladam,ze nie pasuje
    while(fit == false)
        X = rand(1) * a;%2c rand(1)->wybiera liczbe miedzy 0 a 1
        Y = rand(1) * a;%2c
        R = rand(1) * r_max;%2c
        X_LEFT = X - R;
        X_RIGHT = X + R;
        Y_UP = Y + R;
        Y_DOWN = Y - R;
        if (X_RIGHT <= a && X_LEFT > 0 && Y_UP <= a && Y_DOWN >0)
            fit = true;
        end 
        count = count +1;%liczba prob losowania kolka    
    end
    intersects = false;
    for i = 1:n
        DistanceBetweenCenters = sqrt((x(i)-X)^2 + (y(i) - Y)^2);
        SumOfRadius = R + r(i);
        if(SumOfRadius >= DistanceBetweenCenters)
        %jesli odleglosc wieksza niz promien to nie przecinaja sie
            intersects = true;
        break;
        end    
    end
    if(intersects==false)
        n = n + 1;
        x(n) = X;
        y(n) = Y;
        r(n) = R;
        area = pi*R*R;
        if(n==1)
            all_area(n) = area;
        else
            all_area(n) = all_area(n-1) + area;
        end    
        counter(n) = count;
        count = 0;

        fprintf(1, ' %s%5d%s%.3g\r ', 'n =',  n, ' S = ', area);
        pause(0.01);
        axis equal
        plot_circ(X,Y,R);
        hold on
    end

end
hold off

title("Wykres powierzchni calkowitej w zaleznosci od ilosci pecherzykow");
figure("Name", "Powierzchnia Całkowita");
semilogx(all_area);
xlabel("Liczba pęcherzyków");
ylabel("Powierzchnia calkowita");
saveas(gcf, "wykres1.png");

title("Wykres średniej liczby losowań wielkości pęcherzyków");
figure("Name", "Średnia liczba losowań");
loglog(cumsum(counter)./linspace(1, n, n));
xlabel("Liczba pęcherzyków");
ylabel("Średnia liczba losowań");
saveas(gcf, "wykres2.png");

function plot_circ(X, Y, R)
theta = linspace(0,2*pi);
x = R*cos(theta) + X;
y = R*sin(theta) + Y;
plot(x,y)
end
