function [varargout]= ts_integration(data,events,intervals, Fs)

%   Description times series (ts) integration (ts_integration):
%Split the time series in windows when events happened and build a
%time series with sequencial windows of respective event.
%
%% Input: 
%data : Raw data in vector columns
%
%events: Vector column (N,2) with the time when happened the event 
%and the type with boolean logic
%
%intervals: Row vector of intervals before and after the event happened
%to define the sample window.
%
%Fs: Sample frequency
%
%
%   Output:
%N time series respectives of the type of event,  0 for ts1 and 1 for ts2
%ts3 for 0, ts4 for 1 ... tsN. Then tsN  = event_number*regions_recorded

[E1,E2] = cutevent(events); % Divinding events  
n=1;



for i=1:size(data,2)
    
[d_ram] = integration_filterl(data(:,i),Fs); %filtering lowpass 100 hz

[d_ram] = integration_filterh(d_ram,Fs); %filtering highpass 0.1 hz

    
    
    
    %% E1
    ram_win= createdatamatc(d_ram,E1,Fs,intervals);
    ts=[];
    
    for ii=1:size(ram_win,2)
        
        r=0;
        
        for iii=1: size(ram_win(:,ii),1)
            
            if ram_win(iii,ii) > 0.5 | ram_win(iii,ii) < -0.5 %tem como melhorar
                
               r= 1;
                
            end
        
        
        end
        
        if r==0
            
            td= decimate(ram_win(:,ii),2); % 1000 hz  to 500 hz
            ts= [ts; td]; 
            
        end
        
        
    end
   
    varargout{n}= ts;
    n=n+1;
    
    
    %% E2
    
    ram_win= createdatamatc(d_ram,E2,Fs,intervals);
    ts=[];
    
    for ii=1:size(ram_win,2)
        
        r=0;
        
        for iii=1: size(ram_win(:,ii),1)
            
            if ram_win(iii,ii) > 0.5 | ram_win(iii,ii) < -0.5
                
               r= 1;
                
            end
        
        
        end
        
        if r==0
            
            td= decimate(ram_win(:,ii),2); % 1000 hz  to 500 hz
            ts= [ts; td];
            
        end  
        
    end
    
    varargout{n}= ts;
    n=n+1;
    
end