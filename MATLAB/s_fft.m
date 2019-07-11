function s_fft(data,fs)
%make all process to visualize the frenquency spectrum
%Input
%Data = serial times in column vector 

L= size(data,1);
f = fs*(0:(L/2))/L;

Y= fft(data);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

plot(f,P1) ;
title('Single-Sided Amplitude Spectrum of S(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');