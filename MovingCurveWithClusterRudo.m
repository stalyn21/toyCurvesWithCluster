clear all, clc, close all

function rng(x)
  randn("seed",x)
  rand("seed",x)
end

%Un comentario en el cod para variar
N = 150; %Number of *
Nf = 10; %number of frames
n = 1:N/2;
tao = n/N;
v=0.5;
s = 13; %seed for the random numbers
%X=rand(2*length(tao),Nf+1);%Matriz random
rng(s);
Y=rand(2*length(tao),Nf);%Matriz random
x = abs(cos(2*pi*tao))'; 
x = [x;-x];
x= double(x);
size(x);
%X(:,1)= x; %Reemplazar la primera columna de X por x.

for t = 1:Nf 
    yt = abs(t*sin(2*pi*tao))';
    yt = [yt;yt];
    rng(s);
    mu = rand(length(yt),1);
    yt = yt + v*mu;
    Y(:,t) = yt; %La columna t es reemplazado por yt. 
    plot(x,yt,'*r')
    axis([-1 1 0 Nf+Nf/10])
    hold on
    pause(0.2)
end

x;
Y = double(Y);
xr = repmat(x,1,Nf );
X=[xr(:) Y(:)];
%X=[Y(:) xr(:)];
k=3;

lab= kmeans(X,k);
%Iout = reshape(lab,size(x,1),Nf)';
%Iout

%imagesc(Iout)
%lab;
scatter(X(:,1), X(:,2), 10, lab, 'filled')