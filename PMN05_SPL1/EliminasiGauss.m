## L0325031_NabilaSalmaAzZahra

% Matriks koefisien dan vektor hasil
A = [2 1 -1;
     4 3  1;
    -2 1  2];

b = [3;
     9;
     4];

[n, m] = size(A);

% Membentuk matriks augmented
Ab = [A b];

fprintf('Matriks augmented awal:\n');
disp(Ab);

% Forward elimination
for i = 1:n-1

    % Mencari pivot terbesar
    [pivot, k] = max(abs(Ab(i:n, i)));

    % Pertukaran baris jika diperlukan
    if k ~= 1
        temp = Ab(i, :);
        Ab(i, :) = Ab(i+k-1, :);
        Ab(i+k-1, :) = temp;
    end

    % Eliminasi baris di bawah pivot
    for h = i+1:n
        m = Ab(h, i) / Ab(i, i);
        Ab(h, :) = Ab(h, :) - m * Ab(i, :);
    end
end

fprintf('Hasil forward elimination:\n');
disp(Ab);

% Backward substitution
x = zeros(n, 1);

x(n) = Ab(n, n+1) / Ab(n, n);

for i = n-1:-1:1
    x(i) = (Ab(i, n+1) - Ab(i, i+1:n) * x(i+1:n)) / Ab(i, i);
end

fprintf('Hasil solusi Eliminasi Gauss:\n');
fprintf('x1 = %.6f\n', x(1));
fprintf('x2 = %.6f\n', x(2));
fprintf('x3 = %.6f\n', x(3));
