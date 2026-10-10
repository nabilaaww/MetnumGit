## L0325031_Nabila Salma Az Zahra

% Matriks koefisien
A = [5 -1 -1 0 0;
    -1 5 -1 -1 0;
    -1 -1 4 -1 -1;
     0 0 1 4 -2;
     0 1 -1 1 4];

% Vektor konstanta
b = [-1; 2; 6; 2; -1];

n = length(b);
Aug = [A b];

% Mulai menghitung running time algoritma
tic;

% Eliminasi Gauss
for k = 1:n-1
    for i = k+1:n
        m = Aug(i,k) / Aug(k,k);
        Aug(i,k:n+1) = Aug(i,k:n+1) - m * Aug(k,k:n+1);
    end
end

% Back substitution
x = zeros(n,1);

for i = n:-1:1
    x(i) = (Aug(i,n+1) - Aug(i,i+1:n) * x(i+1:n)) / Aug(i,i);
end

waktu = toc;

fprintf('p = %.10f\n', x(1));
fprintf('q = %.10f\n', x(2));
fprintf('r = %.10f\n', x(3));
fprintf('s = %.10f\n', x(4));
fprintf('t = %.10f\n', x(5));
fprintf('Running time = %.10f detik\n', waktu);
