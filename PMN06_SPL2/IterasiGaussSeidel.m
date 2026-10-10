## L0325031_Nabila Salma Az Zahra

A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];
b = [-1; 2; 6; 2; -1];

% Nilai eksak dari metode langsung (untuk soal no 2)
x_eksak = [55/169; 422/507; 70/39; 7/169; -10/507];

max_iter = 20;
tol = 0.001;
kriteria = 1;   % 1 = berhenti jika galat thd nilai eksak < tol
                % 2 = berhenti jika selisih antar iterasi < tol

x = zeros(5,1);              % tebakan awal
hasil = zeros(max_iter,5);     % alokasi di luar tic-toc
jumlah_iterasi = max_iter;     % default jika tidak konvergen

% ---- hanya algoritma yang dihitung waktunya ----
tic;
for k = 1:max_iter
    x_lama = x;
    x(1) = (-1 + x(2) + x(3)) / 5;
    x(2) = ( 2 + x(1) + x(3) + x(4)) / 5;
    x(3) = ( 6 + x(1) + x(2) + x(4) + x(5)) / 4;
    x(4) = ( 2 - x(3) + 2*x(5)) / 4;
    x(5) = (-1 - x(2) + x(3) - x(4)) / 4;
    hasil(k,:) = x';

    if kriteria == 1
        stop = max(abs(x_eksak - x)) < tol;
    else
        stop = max(abs(x - x_lama)) < tol;
    end
    if stop
        jumlah_iterasi = k;
        break;
    end
end
waktu = toc;
% -------------------------------------------------

% Galat dihitung setelah toc
galat = max(abs(repmat(x_eksak', jumlah_iterasi, 1) - hasil(1:jumlah_iterasi, :)), [], 2);

if jumlah_iterasi == max_iter && galat(end) >= tol
    fprintf('(Peringatan: belum mencapai toleransi dalam %d iterasi)\n', max_iter);
end
fprintf('Jumlah iterasi = %d\n\n', jumlah_iterasi);
fprintf('Iter         p             q             r             s             t          Galat maks\n');
for k = 1:jumlah_iterasi
    fprintf('%3d   %12.8f  %12.8f  %12.8f  %12.8f  %12.8f  %12.8f\n', ...
        k, hasil(k,1), hasil(k,2), hasil(k,3), hasil(k,4), hasil(k,5), galat(k));
end

fprintf('\nHasil akhir:\n');
fprintf('p = %.10f\nq = %.10f\nr = %.10f\ns = %.10f\nt = %.10f\n', x);
fprintf('\nGalat absolut tiap variabel |eksak - hampiran|:\n');
galat_var = abs(x_eksak - x);
fprintf('p: %.3e\nq: %.3e\nr: %.3e\ns: %.3e\nt: %.3e\n', galat_var);
fprintf('Galat maksimum = %.3e\n', max(galat_var));
fprintf('Running time   = %.10f detik\n', waktu);
