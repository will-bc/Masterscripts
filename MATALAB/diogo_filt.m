function [Filterd_Output] = diogo_filt(data,fs)

%filter between 0.5 - 50 hz 

% lowpass < 50
d = designfilt('lowpassfir', ...
'PassbandFrequency',50,'StopbandFrequency',50.5, ...
'PassbandRipple',1,'StopbandAttenuation',20, ...
'SampleRate', fs,'DesignMethod','equiripple');
F1 = filtfilt(d,data);


% highpass > 0.5

d = designfilt('highpassfir', ...
'PassbandFrequency',0.5,'StopbandFrequency',0.15, ...
'PassbandRipple',1,'StopbandAttenuation',20, ...
'SampleRate', fs,'DesignMethod','equiripple');
Filterd_Output = filtfilt(d,F1);
%s_fft(Filterd_Output,fs);