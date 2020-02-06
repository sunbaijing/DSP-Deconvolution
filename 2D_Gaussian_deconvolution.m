clear all;
close all;
load('MSH_Elev.mat');
n1=length(xxkm);
n2=length(yykm);
nffx=8192;nffy=8192;
dx=0.1;dy=0.1;
fnx=1/(2*dx);fny=1/(2*dy);% Nyquist frequency
dkx=1/(dx*nffx);dky=1/(dy*nffy);% define the sampling rate 

kx=[-fnx:dkx:fnx-dkx];
ky=[-fny:dky:fny-dky];
% define the vector of kx and ky
figure(1);
subplot(1,2,1);
imagesc(xxkm,yykm,Elev);
colorbar;
% do Fourier Transform
G2=fft2(Elev,nffy,nffx);
G20=fftshift(G2);
subplot(1,2,2);
Gam=abs(G20);
spec=Gam.^2;
% plot the amplitude in frequency domain
imagesc(log10(spec));
colorbar;
gx=spec(:,1);
% extract vector along kx=0
gy=spec(1,:);
% extract vector along ky=0
figure(2);
subplot(2,1,1);
loglog(kx,gx);
title('power spectrum along kx=0');
subplot(2,1,2);
loglog(ky,gy);
title('power spectrum along ky=0');

r=[2.5,10,20,40];
% define the range of coefficient r

for k=1:4
 r0=r(k);
 % set the coefficient r0 
 [gsx,gsy]=meshgrid(0.1*(-4096:4095),0.1*(-4096:4095));
G1=exp(-pi*(gsx.^2+gsy.^2)/(r0^2));
G1=fftshift(G1);
%define 2-D Gaussian Function
G1F0=fft2(G1);
G1F=fftshift(G1F0);
GF=times(G1F,G20);
% apply the filter to original data
gf=ifft2(GF);
gf=gf(1:n2,1:n1);
figure(3)
subplot(2,2,k);
imagesc(xxkm,yykm,abs(gf));
colorbar
title(['filter 2-D Gaussian with r0=',num2str(r0)]);

end
