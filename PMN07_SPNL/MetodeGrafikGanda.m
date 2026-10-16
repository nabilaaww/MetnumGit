#L0325031_Nabila Salma Az Zahra

% Rentang nilai x
x1 = linspace(0, 3, 1000);
x2 = linspace(-2, 2, 1000);
x3 = linspace(-1.9, 3, 1000);

% Menghitung running time
tic;

% Persamaan 1
g1 = 3*x1.^3 - 5*x1.^2 + 4*x1 - 7;
h1 = ones(size(x1));

% Persamaan 2
g2 = exp(x2);
h2 = x2.^2;

% Persamaan 3
g3 = log(x3+2);
h3 = 3 - 2*x3;

waktu = toc;

% Grafik ganda persamaan 1
figure(1);
plot(x1, g1, 'b-', 'LineWidth', 2);
hold on;
plot(x1, h1, 'r--', 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 1');
legend('y = 3x^3 - 5x^2 + 4x - 7', 'y = 1');

% Grafik ganda persamaan 2
figure(2);
plot(x2, g2, 'b-', 'LineWidth', 2);
hold on;
plot(x2, h2, 'r--', 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 2');
legend('y = e^x', 'y = x^2');

% Grafik ganda persamaan 3
figure(3);
plot(x3, g3, 'b-', 'LineWidth', 2);
hold on;
plot(x3, h3, 'r--', 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 3');
legend('y = log(x+2)', 'y = 3-2x');

fprintf('METODE GRAFIK GANDA\n');
fprintf('Running time = %.10f detik\n', waktu);
