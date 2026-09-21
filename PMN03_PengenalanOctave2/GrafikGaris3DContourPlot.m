## L0325031_NabilaSalmaAzZahra

x = -2:0.1:2;
y = -2:0.1:2;
[X,Y] = meshgrid(x,y);
Z = 1.2.^(-0.2*sqrt(X.^2 + Y.^2)).*cos(Y).*sin(0.5*X);
contour3(X,Y,Z,25)
xlabel('x');
ylabel('y');
zlabel('z');
