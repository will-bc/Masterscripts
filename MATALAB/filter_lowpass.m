function [ts]= filter_lowpass(data,fs,fc)
%Filtro passa baixa
%
%[ts]= filter_lowpass(data,fs,fc)
%
%data= time series
%fs = frêquencia da amostra (f. sample)
%fc = frêquencia de corte  (f. cut)

nyq = fs/2;

[b,a] = butter(6,fc/nyq, 'low');
fvtool(b,a);
ts = filtfilt(b,a,data);


% por que usou ordem do filtro 1 ? 
% Para passa alta
%fc=0.1;% cut off frequency
%fn=25; %nyquivst frequency = sample frequency/2;
%order = 6; %6th order filter, high pass
%[b14 a14]=butter(order,(fc/fn),'high');