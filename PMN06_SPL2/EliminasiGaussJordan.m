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

% Eliminasi Gauss-Jordan
for k = 1:n

    % Membuat elemen pivot menjadi 1
    Aug(k,:) = Aug(k,:) / Aug(k,k);

    % Menghilangkan elemen pada kolom pivot
    for i = 1:n
        if i ~= k
            m = Aug(i,k);
            Aug(i,:) = Aug(i,:) - m * Aug(k,:);
        end
    end
end

x = Aug(:,n+1);

waktu = toc;

fprintf('p = %.10f\n', x(1));
fprintf('q = %.10f\n', x(2));
fprintf('r = %.10f\n', x(3));
fprintf('s = %.10f\n', x(4));
fprintf('t = %.10f\n', x(5));
fprintf('Running time = %.10f detik\n', waktu);
