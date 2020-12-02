clear all, clc, close all
N      = 20; %Number of *
Nf= 10; %number of frames
n      = 1:N/2; %vector file of 1 to N/2
tao    = n/N; %vector file of 1/N, 2/N, .., n/N
v=0.5;
X=rand(2*length(tao),Nf+1);%Matriz random
x = abs(cos(2*pi*tao))'; 
    x = [x;-x];
X(:,1)= x; %Reemplazar la primera columna de X por x.

for t = 1:Nf
    
    yt = abs(t*sin(2*pi*tao))';
    yt = [yt;yt];
    yt = yt + v*rand(length(yt),1);
    X(:,t+1) = yt; %La columna t+1 es reemplazado por yt. 
    plot(x,yt,'*r')
    axis([-1 1 0 Nf])
    hold on
    pause(0.2)
end
X