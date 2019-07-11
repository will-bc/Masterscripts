function [Filterd_Output] = beta_filt(data,fs)

%filter between 13-30 hz 

% lowpass <30 
d=fdesign.lowpass('Fp,Fst,Ap,Ast', 30, 35,1,30, fs);
designmethods(d);
Hd = design(d,'equiripple');
F1 = filter(Hd,data);


% highpass >13

d = fdesign.highpass('Fst,Fp,Ast,Ap',12.75,13,10,1,fs);
designmethods(d);
Hd = design(d,'butter');
Filterd_Output = filter(Hd,F1);
%s_fft(Filterd_Output,fs);



end
