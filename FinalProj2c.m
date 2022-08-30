clear
%Initalizing y and t to their intial values of 0
y(1,:)=[0,0,0,0];
t(1)=0;
%Setting h to our desired step size 
h=T/12800;
%Setting the period to 2.5 s
T=2.5;
%Setting N to 10 seconds over the step size
N=10/h;
%Start Timing
tic
%Iterating from 1 to the number of steps N
for i=1:N
    %Implementing forward euler to get the next y value
    y(i+1,:)=y(i,:)'+dvdt(t(i),y(i,:))*h;
    %Increasing the time by 1 at each iteration
    t(i+1)=t(i)+h;
end
%End timing
time=toc;

% Plotting all of the different desired plots of displacement and velocity into a larger subplot
subplot(2,2,1),plot(t,y(:,1))
grid on
title("Displacement vs. time of x2")
ylabel("x2 Displacement (m)")
xlabel("Time (seconds)")
subplot(2,2,2),plot(t,y(:,2))
grid on
title("Velocity vs. time of x2")
ylabel("x2 Velocity (m/s)")
xlabel("Time (seconds)")
subplot(2,2,3),plot(t,y(:,3))
grid on
title("Displacement vs. time of x1")
ylabel("x1 Displacement (m)")
xlabel("Time (seconds)")
subplot(2,2,4),plot(t,y(:,4))
grid on
title("Velocity vs. time of x1")
ylabel("x2 Velocity (m/s)")
xlabel("Time (seconds)")

