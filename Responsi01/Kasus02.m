#L0325031_Nabila Salma Az Zahra

% Matriks koefisien
A = [2.5  1.5  5.0  0.5;
     4.0  0.75 1.0  2.0;
     2.0  1.5  0.5  6.0;
     1.0  4.25 2.0  0.9];

% Total belanja dalam ribuan rupiah
b = [161; 149; 251.5; 173];

n = length(b);

% Pemeriksaan konvergensi Gauss-Seidel
D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);

Tgs = -(D + L) \ U;
rho = max(abs(eig(Tgs)));

fprintf('Radius spektral Gauss-Seidel = %.10f\n', rho);

% Metode langsung Gauss-Jordan
Aug = [A b];

tic;

for k = 1:n

    % Normalisasi elemen pivot menjadi 1
    Aug(k,:) = Aug(k,:) / Aug(k,k);

    % Menghilangkan elemen lain pada kolom pivot
    for i = 1:n
        if i ~= k
            m = Aug(i,k);
            Aug(i,:) = Aug(i,:) - m * Aug(k,:);
        end
    end

end

x = Aug(:,n+1);

waktu = toc;

fprintf('\nMETODE GAUSS-JORDAN\n');
fprintf('Harga beras = Rp %.2f per kg\n', x(1)*1000);
fprintf('Harga telur = Rp %.2f per kg\n', x(2)*1000);
fprintf('Harga tepung = Rp %.2f per kg\n', x(3)*1000);
fprintf('Harga ayam = Rp %.2f per kg\n', x(4)*1000);
fprintf('Running time = %.10f detik\n', waktu);

% Memeriksa kembali total belanja
fprintf('\nPemeriksaan total belanja:\n');
disp(A*x);
