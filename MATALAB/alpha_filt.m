function [Filterd_Output] = alpha_filt(data,fs)

%filter between 7.5-12.5 hz 

% lowpass <12.5
d=fdesign.lowpass('Fp,Fst,Ap,Ast', 12.5, 13,1,20, fs);
designmethods(d);
Hd = design(d,'equiripple');
F1 = filter(Hd,data);


% highpass >7.5

d = fdesign.highpass('Fst,Fp,Ast,Ap',7.2,7.5,10,1,fs);
designmethods(d);
Hd = design(d,'butter');
Filterd_Output = filter(Hd,F1);
%s_fft(Filterd_Output,fs);



end