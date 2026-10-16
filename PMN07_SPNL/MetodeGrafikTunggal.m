#L0325031_Nabila Salma Az Zahra

% Fungsi nonlinear
f1 = @(x) 3*x.^3 - 5*x.^2 + 4*x - 8;
f2 = @(x) exp(x) - x.^2;
f3 = @(x) log(x+2) + 2*x - 3;

% Rentang nilai x
x1 = linspace(0, 3, 1000);
x2 = linspace(-2, 2, 1000);
x3 = linspace(-1.9, 3, 1000);

% Menghitung running time
tic;

y1 = f1(x1);
y2 = f2(x2);
y3 = f3(x3);

waktu = toc;

% Grafik persamaan pertama
figure(1);
plot(x1, y1, 'b-', 'LineWidth', 2);
hold on;
plot(x1, zeros(size(x1)), 'k--');
grid on;
xlabel('x');
ylabel('f_1(x)');
title('Grafik Tunggal Persamaan 1');

% Grafik persamaan kedua
figure(2);
plot(x2, y2, 'r-', 'LineWidth', 2);
hold on;
plot(x2, zeros(size(x2)), 'k--');
grid on;
xlabel('x');
ylabel('f_2(x)');
title('Grafik Tunggal Persamaan 2');

% Grafik persamaan ketiga
figure(3);
plot(x3, y3, 'g-', 'LineWidth', 2);
hold on;
plot(x3, zeros(size(x3)), 'k--');
grid on;
xlabel('x');
ylabel('f_3(x)');
title('Grafik Tunggal Persamaan 3');

fprintf('METODE GRAFIK TUNGGAL\n');
fprintf('Running time = %.10f detik\n', waktu);
