clear
format long
load dampingforce1.mat
load springforce1.mat
y0=[0,0,0,0];
T=2.5;
tspan=[0 10];
h=T/400;
tic
[t1,v1] = rk4sysNew(@dvdt,tspan,y0,h);
timeR=toc
% subplot(2,2,1),plot(t1',v1(:,1))
% grid on
% title("Displacement vs. time of x2")
% ylabel("x2 Displacement (m)")
% xlabel("Time (seconds)")
% hold on
% subplot(2,2,2),plot(t1',v1(:,2))
% grid on
% title("Velocity vs. time of x2")
% ylabel("x2 Velocity (m/s)")
% xlabel("Time (seconds)")
% hold on
% subplot(2,2,3),plot(t1',v1(:,3))
% grid on
% title("Displacement vs. time of x1")
% ylabel("x1 Displacement (m)")
% xlabel("Time (seconds)")
% hold on
% subplot(2,2,4),plot(t1',v1(:,4))
% grid on
% title("Velocity vs. time of x1")
% ylabel("x2 Velocity (m/s)")
% xlabel("Time (seconds)")
% hold on
% 
% sgtitle('RK4 at timestep of T/400 for amplitude 16 m/s^2')

%Creating a variable and storing all the velocity values in it from x2
x2velocity=v1(:,2);
%Initializing a vector that will store all the values for x2 acceleration
x2acc=[];
%O(h^2) centered finite difference approximation
%Iterating from 1 to the length of the velocity vector-2
for i=1:length(x2velocity)-2
        %Finding the x2 acceleration at each timestep via the centered
        %finite difference approximation
        x2acc(i)=(x2velocity(i+2)-x2velocity(i))/(2*h);
end
%Matching sizing for plotting purposes
x2acc(1600)=0;
x2acc(1601)=0;
%Plotting the acceleration vs. time for each amplitude
figure
plot(t1,x2acc)
title("Second Floor Acceleration vs. Time for Amplitude 16 m/s^2")
ylabel("Second Floor Acceleration (m/s^2)")
xlabel("Time (s)")
grid on



%O(h) forward finite difference approximation
%Initializing a new vector that will store the x2 acceleration values for each
%timestep
x2accForward=[];
%Iterating from 2 to the length of x2velocity vector-1 
for i=2:length(x2velocity)-1
    %Finding the x2 acceleration at each timestep using a forward finite
    %difference approximation
    x2accForward(i)=(x2velocity(i+1)-x2velocity(i-1))/(h);
end
%Matching sizing for plotting purposes
x2accForward(1601)=0;
%Plotting the x2 acceleration vs. time for each amplitude
figure
plot(t1,x2accForward)
title("Second Floor Acceleration vs. Time for Amplitude 16 m/s^2")
ylabel("Second Floor Acceleration (m/s^2)")
xlabel("Time (s)")
grid on









