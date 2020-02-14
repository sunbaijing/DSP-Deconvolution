function [g,W,fp,fu] = f_GaussianA4(f0,df,nfft)
%Create gaussian pulse and spectrum for RFs
%   


    a=pi*f0/(-0.5*log(0.0432));
    ['GaussianA3: f0 ',num2str(f0),' df ',num2str(df),' nfft ',num2str(nfft),' a ',num2str(a)]
    nfft2=nfft/2;
    
    for iff=1:nfft2+1
        ff(iff)=(iff-1)*df;
        G(iff)=exp(-(pi*ff(iff)/a)^2);
        
    end 
    
    for iff=nfft2+2:nfft
        ff(iff)=-(nfft-iff+1)*df;
        G(iff)=exp(-(pi*ff(iff)/a)^2);
        
    end 
        W=complex(G);
        
        g=real(fftshift(ifft(W,nfft)));
        
        fu=fftshift(ff);
        
        fp=ff;

end

