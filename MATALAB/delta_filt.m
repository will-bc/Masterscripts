function [Filterd_Output] = delta_filt(data,fs)

%filter between 4-7.5 hz 

% lowpass <4
d=fdesign.lowpass('Fp,Fst,Ap,Ast', 4, 4.5,1,25, fs);
designmethods(d);
Hd = design(d,'equiripple');
F1 = filter(Hd,data);


% highpass > 0.5

d = fdesign.highpass('Fst,Fp,Ast,Ap',0.1,0.5,10,1,fs);
designmethods(d);
Hd = design(d,'butter');
Filterd_Output = filter(Hd,F1);
%s_fft(Filterd_Output,fs);



end