##L0325031_Nabila Salma Az Zahra

% Parameter sesuai soal
h0 = 5;
lambda = 12;
v = 36;
x_exp = 10;

% Rentang t = 0 sampai t = 5
t = linspace(0, 5, 501);

% Derajat maksimum deret Taylor
n_list = [23, 24, 25];

tic;

% Fungsi eksak
z = t*v/lambda;
h_eksak = h0 * (cos(z) + exp(x_exp));

% Penyimpanan hasil
h_aprox = zeros(length(n_list), length(t));
galat = zeros(length(n_list), length(t));
rata_galat = zeros(length(n_list), 1);

for j = 1:length(n_list)

    n = n_list(j);

    % Pendekatan Taylor fungsi cosinus
    cos_approx = zeros(size(t));

    for k = 0:n
        cos_approx = cos_approx + ...
            ((-1)^k .* z.^(2*k)) / factorial(2*k);
    end

    % Pendekatan Taylor fungsi eksponensial
    exp_approx = 0;

    for k = 0:n
        exp_approx = exp_approx + ...
            (x_exp^k) / factorial(k);
    end

    % Fungsi pendekatan
    h_aprox(j,:) = h0 * (cos_approx + exp_approx);

    % Galat mutlak
    galat(j,:) = abs(h_eksak - h_aprox(j,:));

    % Rata-rata galat mutlak
    rata_galat(j) = mean(galat(j,:));

end

waktu = toc;

% Grafik fungsi eksak dan pendekatan
figure(1);
plot(t, h_eksak, 'k-', 'LineWidth', 2);
hold on;
plot(t, h_aprox(1,:), 'r--', 'LineWidth', 1.5);
plot(t, h_aprox(2,:), 'b-.', 'LineWidth', 1.5);
plot(t, h_aprox(3,:), 'g:', 'LineWidth', 1.5);
grid on;
xlabel('t');
ylabel('h(t)');
title('Perbandingan Fungsi Eksak dan Deret Taylor');
legend('Eksak', 'n = 23', 'n = 24', 'n = 25', ...
       'Location', 'best');

% Grafik galat mutlak
figure(2);
plot(t, galat(1,:), 'r-', 'LineWidth', 1.5);
hold on;
plot(t, galat(2,:), 'b-', 'LineWidth', 1.5);
plot(t, galat(3,:), 'g-', 'LineWidth', 1.5);
grid on;
xlabel('t');
ylabel('Galat mutlak');
title('Galat Mutlak Pendekatan Deret Taylor');
legend('n = 23', 'n = 24', 'n = 25', ...
       'Location', 'best');

% Menampilkan hasil
fprintf('KASUS 1: DERET TAYLOR\n');

for j = 1:length(n_list)
    fprintf('n = %d, rata-rata galat mutlak = %.10f\n', ...
        n_list(j), rata_galat(j));
end

fprintf('Running time = %.10f detik\n', waktu);
