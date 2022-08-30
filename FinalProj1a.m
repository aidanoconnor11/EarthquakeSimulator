clear
load dampingforce1.mat
load springforce1.mat



n=11;

x=Fsp(2,:)'
y=Fsp(1,:)'

xd=Fd(2,:)'
yd=Fd(1,:)'
[a1 x1 xtx1]=polylsq(x,y,n,3);


[a2 x2 xtx2]=polylsq(xd,yd,n,2);

x11=linspace(-.01,.01);
Fsplsq=(a1(2)*x11)+(a1(3)*(x11).^2)+(a1(4)*(x11).^3);
x22=linspace(-10,10);
Fdlsq=(a2(2)*x22)+(a2(3)*x22.^2);

figure
plot(x11,Fsplsq)
hold on 
plot(Fsp(2,:),Fsp(1,:))
title("Spring force vs. Displacement")
ylabel("Spring Force (N)")
xlabel("Displacement (meters)")
legend('Least Squares of Spring Force','Actual Data')

figure
plot(x22,Fdlsq)
hold on
plot(Fd(2,:),Fd(1,:))
title("Damping force vs. Velocity")
ylabel("Damping Force (N)")
xlabel("Velocity (meters/second)")
legend('Least Squares of Damping Force','Actual Data')