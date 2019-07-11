function [separate_event1, separate_event2] = cutevent(E)
%   Description: 
% The two types of events is slited in vectors homogeneous in respective 
%types.
%
%%   Input:
%Column vector (N,2). First column are the times of events and Second
%column the event 0 or 1. 
%
%   Output:
%Two column vectos (N,2) with same input pattern but homogeneous type of 
%event.
% Copyright (c) Willian B. C; November 21, 2017.

separate_event1=[];
separate_event2=[];

for i = 1: size(E,1)
    
    if E(i,2) == 0
       
        separate_event1= [separate_event1;[E(i,1),E(i,2)] ];
        
    end
    
     if E(i,2) == 1
       
        separate_event2= [separate_event2;[E(i,1),E(i,2)] ];
        
    end
    
end

end