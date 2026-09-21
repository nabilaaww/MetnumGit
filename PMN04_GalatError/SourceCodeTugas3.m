## L0325031_NabilaSalmaAzZahra

% Menghitung galat perhitungan sin(x) menggunakan deret Taylor
% dengan N = {1,2,3,4,5} dan x = 1

x = 1;

% Nilai eksak
eksak = sin(x);

% Perhitungan menggunakan deret Taylor
for N = 1:5

    p = 0;

    for n = 0:N
        p = p + ((-1)^n * x^(2*n+1)) / factorial(2*n+1);
    end

    % Menghitung galat absolut
    galat = abs(eksak - p);

    % Menghitung galat relatif
    galat_relatif = galat / abs(eksak);

    fprintf('N = %d\n', N);
    fprintf('Pendekatan = %.10f\n', p);
    fprintf('Error = %.10f\n', galat);
    fprintf('Error Relatif = %.10f\n\n', galat_relatif);
end
