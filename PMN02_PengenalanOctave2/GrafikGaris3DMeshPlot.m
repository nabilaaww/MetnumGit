## L0325031_NabilaSalmaAzZahra

x = -6.4:0.2:6.6;
y = x;
[X,Y] = meshgrid(x,y);

R = sqrt(X.^2 + Y.^2);
Z = sin(R)./R;

mesh(X,Y,Z);
