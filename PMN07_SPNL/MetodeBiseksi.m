#L0325031_Nabila Salma Az Zahra

% Tiga fungsi nonlinear
f = {
    @(x) 3*x.^3 - 5*x.^2 + 4*x - 8;
    @(x) exp(x) - x.^2;
    @(x) log(x+2) + 2*x - 3
};

% Interval awal [a, b]
interval = [
     1.5   2.0;
    -1.0   0.0;
     0.5   1.5
];

max_iter = 20;
tol = 0.0001;

for j = 1:3

    fungsi = f{j};
    a = interval(j,1);
    b = interval(j,2);

    % Menyimpan riwayat iterasi
    hasil = zeros(max_iter,5);
    jumlah_iterasi = 0;

    if fungsi(a) * fungsi(b) > 0
        fprintf('Interval persamaan %d tidak valid\n', j);
        continue;
    end

    % Mulai running time algoritma
    tic;

    for k = 1:max_iter

        % Titik tengah
        xr = (a+b)/2;
        fx = fungsi(xr);
        galat = abs(fx);

        % Simpan hasil iterasi
        hasil(k,:) = [k a b xr galat];
        jumlah_iterasi = k;

        % Kondisi berhenti
        if galat < tol
            break;
        end

        % Memperbarui interval
        if fungsi(a) * fx < 0
            b = xr;
        else
            a = xr;
        end

    end

    waktu = toc;

    % Menampilkan hasil
    fprintf('\nMETODE BISEKSI - PERSAMAAN %d\n', j);
    fprintf('Iter       a           b           xr          |f(xr)|\n');

    for k = 1:jumlah_iterasi
        fprintf('%3d   %11.7f %11.7f %11.7f %12.8f\n', ...
            hasil(k,1), hasil(k,2), ...
            hasil(k,3), hasil(k,4), hasil(k,5));
    end

    fprintf('\nJumlah iterasi = %d\n', jumlah_iterasi);
    fprintf('Akar hampiran  = %.10f\n', xr);
    fprintf('Galat |f(xr)|  = %.10f\n', galat);
    fprintf('Running time   = %.10f detik\n', waktu);

    if galat >= tol
        fprintf('Peringatan: toleransi belum tercapai.\n');
    end

end
