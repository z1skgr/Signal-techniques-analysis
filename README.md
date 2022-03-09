# Signal techniques
> Techniques for processing signals using matlab desing processes
 
  ## Table of contents
* [Labs](#labs)
   * [1](#1)
   * [2](#2)
   * [3](#3)
   * [4](#4)
* [Prerequisites](#prerequisites)
* [How to run](#how-to-run)
* [Acknowledgments](#acknowledgments)

<br>

### 1
1. Discrete Fourier Transformation.
2. Convolution.
3. Sampling. 
4. Reconstruction. 

<br><br><br>


1. Linear convolution of two discrete sequences
   * H(F<sub>1</sub>)H(F<sub>2</sub>)=h(f<sub>1</sub>)*h(f<sub>2</sub>)
2. Multiple samplings
   * Find Nyquist frequency
3. Sampling
   * Aliasing restore
4. Spectrum with frequency change

<br>

### 2
1. Z transformation. 
2. Difference equations. 
3. Stability & Casual systems.
4. Inverse Z transform.

<br><br><br>
1.



* Transfer function
* Pole/Zero diagram
   * tf
   * zplane
* Frequency response
   * freqz
* New Frequency response 
   *   z=1

<br>

2. 
* Transfer function (simple fractions)   
   * residuez
   * syms
   * pretty
* Inverse transformation Z
   * iztrans
<br>

### 3
1. Design IIR Filter.
   * Butterworth. 
   * Chebyshev. 

<br><br><br>

1. Butterworth lowpass filter
   * buttord
   * buttap
   * zp2tf
   * lp2lp
   * freqs
   * bilinear

2. Chebyshev highpass filter
   * cheby1

3. Construction Cosine signal
   * Filtering (Butterworth and Chebyshev)
   * High Frequency maintance
  
<br>

### 4 
1. Windowing. 
2. Gibbs phenomenon. 
3. Other windows. 
    * Rectangular. 
    * Hamming. 
    * Hanning. 
    * Blackman. 

<br><br><br>

1. Frequency response on low pass filter with Rec and Hamm windowing
    * rect
    * hamm
    * fir1

2. Frequency response on FIR filter
    * Hamming
    * Hanning

3. Spectrum display on System with filtering from 2







## Prerequisites
MATLAB environment (or any software using language that is mostly compatible with MATLAB, see [GNU Octave](https://www.gnu.org/software/octave/index)

## How to run
* Navigate path of the script you want to execute
* run(scriptname)

or 
* Execute Run as script


Signals have been used in for the project purposes[^1]:


## Acknowledgments
Projects were created for the requirements of the lesson Digital Signal Processing

[^1]: Chosen from pdf




