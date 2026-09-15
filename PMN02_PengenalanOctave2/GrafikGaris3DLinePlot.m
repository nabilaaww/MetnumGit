## L0325031_NabilaSalmaAzZahra

t = 0:0.3:9*pi;

x = sqrt(t).*cos(3*t);
y = sqrt(t).*sin(3*t);
z = 0.1*t;

plot3(x,y,z,'k','linewidth',2);

grid on
xlabel('x');
ylabel('y');
zlabel('z');
