function plot_circ(X, Y, R)
    theta = linspace(0, 2*pi);
    x = R*cos(theta) + X;
    y = R*sin(theta) + Y;
    plot(x,y)
end

%1

a = 4;%bok kwadratu
r_max = a/3;%promien
n_max = 1000;%ilosc pecherzykow

%2
count = 0;
n = 0;
X = 0;
Y = 0;
R = 0;
x = [];
y = [];
r = [];
while (n <= n_max)
    fit = false;
    while(fit == false)
        count = count +1;
        X = rand * a;
        Y = rand * a;
        R = rand * r_max;
            if (X + R <= a && X - R > 0 && Y + R <= a && Y - R >0)
                fit = true;
    end
    
    count = count + 1;
    end

    intersect = false;

    for i = 1:n
        x_distance = (X - x(i));
        y_distance = (Y - y(i));

        distance = sqrt(x_distance * x_distance + y_distance * y_distance);
        
        if(dist < r(i) + R && dist > abs(r(i) - R))
            intersect = true;
        else if(dist == r(i) + R)
                intersect = true;
        end
        end

    if(intersect == false)
        n = n + 1;
        area = pi*R*R;
        x(n) = X;
        y(n) = Y;
        r(n) = R;
        area(n) = area;
        plot_circ(X,Y,R);
        count(n) = count;
        count = 0;

