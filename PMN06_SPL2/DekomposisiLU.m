## L0325031_Nabila Salma Az Zahra

% Matriks koefisien
A = [5 -1 -1 0 0;
    -1 5 -1 -1 0;
    -1 -1 4 -1 -1;
     0 0 1 4 -2;
     0 1 -1 1 4];

b = [-1; 2; 6; 2; -1];

n = length(b);

% Matriks L dan U
L = eye(n);
U = A;

% Mulai menghitung running time algoritma
tic;

% Dekomposisi LU
for k = 1:n-1
    for i = k+1:n

        m = U(i,k) / U(k,k);
        L(i,k) = m;

        U(i,k:n) = U(i,k:n) - m * U(k,k:n);
    end
end

% Forward substitution: Ly = b
y = zeros(n,1);

for i = 1:n
    y(i) = b(i) - L(i,1:i-1) * y(1:i-1);
end

% Back substitution: Ux = y
x = zeros(n,1);

for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
end

waktu = toc;

fprintf('\nMatriks L:\n');
disp(L);

fprintf('Matriks U:\n');
disp(U);

fprintf('Solusi:\n');
fprintf('p = %.10f\n', x(1));
fprintf('q = %.10f\n', x(2));
fprintf('r = %.10f\n', x(3));
fprintf('s = %.10f\n', x(4));
fprintf('t = %.10f\n', x(5));

fprintf('Running time = %.10f detik\n', waktu);
