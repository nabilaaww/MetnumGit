## L0325031_NabilaSalmaAzZahra

% Menghitung galat perhitungan e^x menggunakan deret Taylor
% dengan x = 0.3 dan n = {0,1,2,3,4}

x = 0.3;

% Nilai eksak
eksak = exp(x);

% Perhitungan menggunakan deret Taylor
for n = 0:4

    p = 0;

    for i = 0:n
        p = p + (x^i / factorial(i));
    end

    % Menghitung galat absolut
    galat = abs(eksak - p);

    % Menghitung galat relatif
    galat_relatif = galat / abs(eksak);

    fprintf('n = %d\n', n);
    fprintf('Pendekatan = %.10f\n', p);
    fprintf('Error = %.10f\n', galat);
    fprintf('Error Relatif = %.10f\n\n', galat_relatif);
end
