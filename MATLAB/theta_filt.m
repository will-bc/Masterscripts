function [Filterd_Output] = theta_filt(data,fs)

%filter between 4-7.5 hz 

% lowpass <7.5
d=fdesign.lowpass('Fp,Fst,Ap,Ast', 7.5, 8,1,30, fs);
designmethods(d);
Hd = design(d,'equiripple');
F1 = filter(Hd,data);

% highpass >4

d = fdesign.highpass('Fst,Fp,Ast,Ap',3.5,4,10,1,fs);
designmethods(d);
Hd = design(d,'butter');
Filterd_Output = filter(Hd,F1);
%s_fft(Filterd_Output,fs);



end