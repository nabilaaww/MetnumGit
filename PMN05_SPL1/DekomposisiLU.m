## L0325031_NabilaSalmaAzZahra

% Matriks koefisien dan vektor hasil
A = [2 1 -1;
     4 3  1;
    -2 1  2];

b = [3;
     9;
     4];

[n, m] = size(A);

% Membentuk matriks L dan U
L = eye(n);
U = A;

% Proses dekomposisi LU
for i = 1:n-1

    % Eliminasi baris di bawah pivot
    for h = i+1:n

        % Menghitung pengali
        m = U(h, i) / U(i, i);

        % Menyimpan pengali ke matriks L
        L(h, i) = m;

        % Membentuk matriks U
        U(h, :) = U(h, :) - m * U(i, :);
    end
end

fprintf('Matriks L:\n');
disp(L);

fprintf('Matriks U:\n');
disp(U);

fprintf('Hasil perkalian L * U:\n');
disp(L * U);

% Forward substitution untuk Ly = b
y = zeros(n, 1);

y(1) = b(1) / L(1,1);

for i = 2:n
    y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i,i);
end

fprintf('Hasil forward substitution (y):\n');
disp(y);

% Backward substitution untuk Ux = y
x = zeros(n, 1);

x(n) = y(n) / U(n,n);

for i = n-1:-1:1
    x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i,i);
end

fprintf('Hasil solusi Dekomposisi LU:\n');
fprintf('x1 = %.6f\n', x(1));
fprintf('x2 = %.6f\n', x(2));
fprintf('x3 = %.6f\n', x(3));

