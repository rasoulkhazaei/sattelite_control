clear
clc
close all

%% sec1 without controler
A = [0 1 0 0;0 0 0 0;0 0 0 1;0 0 -4.509 0];
B=[0; 0.0064; 0; 0.076];
C=[1 0 0.076 0];
D = 0;
[num, den] = ss2tf(A, B, C, D);
f = tf(num, den);
figure(1)
rlocus(f)
s = tf('s');
figure(2)
y = f;
step(y)
figure(3)
y=f/(1+f);
step(y,1000);
%% with controler
controller=(s+1/2)/(s+6.33);
prefilter=.5/(s+1/2);
h=controller*f;
figure(4)
k=1.27*10e3;
%y=k*h/(1+k*h);
y=k*h/(1+k*h);
step(y,10);
figure(5)
rlocus(h);
