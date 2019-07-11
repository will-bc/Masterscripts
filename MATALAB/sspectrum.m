function [f,P] = sspectrum(y,s)

% [f,P] = sspectrum(y,s)
% power spectrum of time series y
% called sspectrum to avoid confusion with matlab spectrum
% s is the sampling frequency
%

if nargin<2,
   s=1;
   disp('s=1;');
end;

Y= fft(y);
N= length(Y);
P= Y .* conj(Y) / N;
f= s / N * (1:floor(N/2)-1);
P= P(2:length(f)+1,:);
