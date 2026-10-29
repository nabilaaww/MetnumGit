## L0325031_Nabila Salma Az Zahra

% Volume bola yang diketahui (cm^3)
V_bola = 300;

% Fungsi nonlinear untuk mencari jari-jari
f = @(r) (4/3)*pi*r.^3 - V_bola;

% Interval awal hasil perkiraan grafik
a = 4;
b = 5;

% Maksimum iterasi dan toleransi jari-jari
max_iter = 20;
tol = 1e-6;

% Grafik fungsi nonlinear
r_grafik = linspace(0, 6, 500);
y_grafik = f(r_grafik);

figure(1);
plot(r_grafik, y_grafik, 'b-', 'LineWidth', 2);
hold on;
plot(r_grafik, zeros(size(r_grafik)), 'k--');
plot([a b], [f(a) f(b)], 'ro');
grid on;

xlabel('Jari-jari r (cm)');
ylabel('f(r)');
title('Grafik Persamaan Nonlinear Volume Bola');
legend('f(r)', 'f(r) = 0', 'Batas interval awal', ...
       'Location', 'northeast');

% Pemeriksaan interval awal
if f(a)*f(b) > 0
    error('Interval awal tidak mengapit akar.');
end

% Menyimpan hasil iterasi
hasil = zeros(max_iter, 5);
jumlah_iterasi = 0;

% Mulai running time algoritma biseksi
tic;

for k = 1:max_iter

    % Menghitung titik tengah interval
    c = (a+b)/2;
    fc = f(c);

    % Menyimpan iterasi, batas bawah, batas atas,
    % akar pendekatan, dan nilai fungsi
    hasil(k,:) = [k a b c fc];
    jumlah_iterasi = k;

    % Kondisi berhenti berdasarkan lebar interval
    if abs(b-a)/2 < tol
        break;
    end

    % Memperbarui interval
    if f(a)*fc < 0
        b = c;
    else
        a = c;
    end

end

waktu = toc;

% Akar pendekatan
r = c;

% Menghitung tinggi dan volume
tinggi = 2*r;
V_tabung = pi*r^2*tinggi;
V_luar = V_tabung - V_bola;

% Menampilkan hasil iterasi
fprintf('METODE BISEKSI - KASUS 3\n');
fprintf('Iter       a             b             r             f(r)\n');

for k = 1:jumlah_iterasi
    fprintf('%3d   %12.8f  %12.8f  %12.8f  %12.8f\n', ...
        hasil(k,1), hasil(k,2), hasil(k,3), ...
        hasil(k,4), hasil(k,5));
end

fprintf('\nHasil akhir:\n');
fprintf('Jari-jari bola/tabung = %.10f cm\n', r);
fprintf('Tinggi tabung         = %.10f cm\n', tinggi);
fprintf('Volume bola           = %.10f cm^3\n', ...
        (4/3)*pi*r^3);
fprintf('Volume tabung         = %.10f cm^3\n', V_tabung);
fprintf('Volume bagian luar    = %.10f cm^3\n', V_luar);
fprintf('Galat fungsi          = %.10e\n', abs(f(r)));
fprintf('Jumlah iterasi        = %d\n', jumlah_iterasi);
fprintf('Running time          = %.10f detik\n', waktu);
