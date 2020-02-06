<<<<<<< HEAD
close all;
clear all;
load('ReceiverFunctionExample.mat');
dt=0.05;
f0=2;f1=0.5;% two frequency
nfft=4096;% power of 2
df=1/(dt*nfft);% sampling rate
[g1,W1,fp1,fu1]=f_GaussianA4(f0,df,nfft);
[g2,W2,fp2,fu2]=f_GaussianA4(f1,df,nfft);
W0=ones(1,4096);
% Generate shaping and unshaping filters
T0=rectpuls((t-10)/30);
%define the time window from -5 to 25 by using rectangular
z1=z1.*T0; z2=z2.*T0;
% apply on vertical components
R1=fft(r1,4096);R2=fft(r2,4096);
Z1=fft(z1,4096);Z2=fft(z2,4096);
%Fourier Transform
CZ1=conj(Z1);CZ2=conj(Z2);
%Calculate the conjugate of Z  
APZ1=Z1.*CZ1; APZ2=Z2.*CZ2;
%Calculate power of amplitudes
W=[W0',W1',W2'];
% combine three W into one new matrix.
Tit=["with unshaping filter","with 2hz shaping filter","with 0.5 hz shaping filter"];
eps1=[.03,.01,.003,.001]*max(APZ1);
eps2=[.03,.01,.003,.001]*max(APZ2);
% select the values of water level
for j=1:3
    Wn=W(:,j);
    STR=Tit(j);
   for i=1:4
      ep1=eps1(i);
      ep2=eps2(i);
      RF1=(R1.*CZ1.*Wn)./(Z1.*CZ1+ep1);
      RF2=(R2.*CZ2.*Wn)./(Z1.*CZ1+ep2);
      rf1=fftshift(ifft(RF1));
      rf2=fftshift(ifft(RF2));
      figure(2*j-1);
      subplot(2,2,i); 
      plot(rf1);
      title(['rf1 with coefficient =',num2str(ep1),STR]);
      set(gca,'FontSize',5);
      figure(2*j);
      subplot(2,2,i);
      plot(rf2);
      title(['rf2 with coefficient =',num2str(ep2),STR]);
      set(gca,'FontSize',5);
    end
end
=======
close all;
clear all;
load('ReceiverFunctionExample.mat');
dt=0.05;
f0=2;f1=0.5;% two frequency
nfft=4096;% power of 2
df=1/(dt*nfft);% sampling rate
[g1,W1,fp1,fu1]=f_GaussianA4(f0,df,nfft);
[g2,W2,fp2,fu2]=f_GaussianA4(f1,df,nfft);
W0=ones(1,4096);
% Generate shaping and unshaping filters
T0=rectpuls((t-10)/30);
%define the time window from -5 to 25 by using rectangular
z1=z1.*T0; z2=z2.*T0;
% apply on vertical components
R1=fft(r1,4096);R2=fft(r2,4096);
Z1=fft(z1,4096);Z2=fft(z2,4096);
%Fourier Transform
CZ1=conj(Z1);CZ2=conj(Z2);
%Calculate the conjugate of Z  
APZ1=Z1.*CZ1; APZ2=Z2.*CZ2;
%Calculate power of amplitudes
W=[W0',W1',W2'];
% combine three W into one new matrix.
Tit=["with unshaping filter","with 2hz shaping filter","with 0.5 hz shaping filter"];
eps1=[.03,.01,.003,.001]*max(APZ1);
eps2=[.03,.01,.003,.001]*max(APZ2);
% select the values of water level
for j=1:3
    Wn=W(:,j);
    STR=Tit(j);
   for i=1:4
      ep1=eps1(i);
      ep2=eps2(i);
      RF1=(R1.*CZ1.*Wn)./(Z1.*CZ1+ep1);
      RF2=(R2.*CZ2.*Wn)./(Z1.*CZ1+ep2);
      rf1=fftshift(ifft(RF1));
      rf2=fftshift(ifft(RF2));
      figure(2*j-1);
      subplot(2,2,i); 
      plot(rf1);
      title(['rf1 with coefficient =',num2str(ep1),STR]);
      set(gca,'FontSize',5);
      figure(2*j);
      subplot(2,2,i);
      plot(rf2);
      title(['rf2 with coefficient =',num2str(ep2),STR]);
      set(gca,'FontSize',5);
    end
end
>>>>>>> first-commit
