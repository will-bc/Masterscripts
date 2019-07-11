function [Filterd_Output] = gamma_filt(data,fs)

%filter high pass 40 hz 

d = fdesign.highpass('Fst,Fp,Ast,Ap',35,40,50,1,fs);
designmethods(d);
Hd = design(d,'butter');
%fvtool(Hd);
Filterd_Output = filter(Hd,data);
%s_fft(Filterd_Output,fs);
 
end


