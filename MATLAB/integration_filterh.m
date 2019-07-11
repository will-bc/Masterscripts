function [Filterd_Output] = integration_filterh(data,fs)

 d = fdesign.highpass('Fst,Fp,Ast,Ap',0.093,0.1,50,1,fs);
 designmethods(d);
 Hd = design(d,'butter');
% fvtool(Hd);
 Filterd_Output = filter(Hd,data);
 %s_fft(Filterd_Output,fs);
 
end