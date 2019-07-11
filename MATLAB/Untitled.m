function [ts]= filter_lowpass(data,fs,fc)
%Filtro passa baixa
%
%[ts]= filter_lowpass(data,fs,fc)
%
%data= time series
%fs = frêquencia da amostra (f. sample)
%fc = frêquencia de corte  (f. cut)

nyq = fs/2;

[b,a] = butter(1,fc/nyq, 'low');
ts = filtfilt(b,a,data);