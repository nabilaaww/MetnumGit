## L0325031_NabilaSalmaAzZahra

% Perhitungan galat pada penjumlahan 1/1 + 1/2 + ... + 1/20

% a. Perhitungan tanpa pembulatan
eksak = 0;

for i = 1:20
    eksak = eksak + 1/i;
end

% b. Setiap pembagian dibulatkan menjadi 2 angka desimal
dibulatkan = 0;

for i = 1:20
    hasil = 1/i;
    hasil_bulat = round(hasil * 100) / 100;
    dibulatkan = dibulatkan + hasil_bulat;

    fprintf('1/%d = %.10f dibulatkan menjadi %.2f\n', ...
            i, hasil, hasil_bulat);
end

% c. Tanpa looping menggunakan fungsi sum
tanpa_looping = sum(1./(1:20));

% Menghitung galat
error_b = abs(eksak - dibulatkan);
error_c = abs(eksak - tanpa_looping);

fprintf('\n');
fprintf('Perhitungan eksak       = %.10f\n', eksak);
fprintf('Pembagian dibulatkan    = %.10f\n', dibulatkan);
fprintf('Tanpa looping (sum)     = %.10f\n', tanpa_looping);
fprintf('Error pembulatan        = %.10f\n', error_b);
fprintf('Error tanpa looping     = %.10f\n', error_c);
fprintf('\n');
