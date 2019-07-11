function [Filterd_Output] = integration_filter(data,fs)

d=fdesign.lowpass('Fp,Fst,Ap,Ast', 100, 110,1,20, fs);
 designmethods(d);
 Hd = design(d,'equiripple');
 %fvtool(Hd);
 Filterd_Output = filter(Hd,data);
 s_fft(Filterd_Output,fs);