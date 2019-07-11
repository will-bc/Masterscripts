                S = t1;
                waveletFunction = 'db8';
                [C,L] = wavedec(S,8,waveletFunction);
                %% Calculation The Coificients Vectors
                cD1 = detcoef(C,L,1);                   %NOISY
                cD2 = detcoef(C,L,2);                   %NOISY
                cD3 = detcoef(C,L,3);                   %NOISY
                cD4 = detcoef(C,L,4);                   %NOISY
                cD5 = detcoef(C,L,5);                   %GAMA
                cD6 = detcoef(C,L,6);                   %BETA
                cD7 = detcoef(C,L,7);                   %ALPHA
                cD8 = detcoef(C,L,8);                   %THETA
                cA8 = appcoef(C,L,waveletFunction,8);   %DELTA

                %%%% Calculation the Details Vectors
                D1 = wrcoef('d',C,L,waveletFunction,1); %NOISY
                D2 = wrcoef('d',C,L,waveletFunction,2); %NOISY
                D3 = wrcoef('d',C,L,waveletFunction,3); %NOISY
                D4 = wrcoef('d',C,L,waveletFunction,4); %NOISY
                Gamma = wrcoef('d',C,L,waveletFunction,5); %GAMMA
                Beta  = wrcoef('d',C,L,waveletFunction,6); %BETA
                Alpha = wrcoef('d',C,L,waveletFunction,7); %ALPHA
                Theta = wrcoef('d',C,L,waveletFunction,8); %THETA
                Delta = wrcoef('a',C,L,waveletFunction,8); %DELTA