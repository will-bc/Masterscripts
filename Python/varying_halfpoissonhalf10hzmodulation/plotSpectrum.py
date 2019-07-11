import numpy as np
from numpy import sin, linspace, pi
from pylab import plot, show, title, xlabel, ylabel, subplot
from scipy import fft, arange
import matplotlib.pyplot as plt
import scipy.fftpack


def plotSpectrum(y,Fs):
#Plots a Single-Sided Amplitude Spectrum of y(t)

    n = len(y) # length of the signal
    k = arange(n)
    T = n/Fs
    frq = k/T # two sides frequency range
    frq = frq[range(n//2)] # one side frequency range

    Y = fft(y)/n # fft computing and normalization
    Y = Y[range(n//2)]
    plot(frq[0:100],abs(Y)[0:100],'r') # plotting the spectrum

    
    plt.xticks(range(0, 100,10))


    xlabel('Freq (Hz)')
    ylabel('|Y(freq)|')
  
 
