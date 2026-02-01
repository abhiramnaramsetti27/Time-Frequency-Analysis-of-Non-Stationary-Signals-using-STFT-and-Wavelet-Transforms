# Time–Frequency Analysis of Non-Stationary Signals using STFT and Wavelet Transform

## Overview
This project investigates the limitations of classical Fourier analysis for non-stationary signals and demonstrates how time–frequency techniques such as the Short-Time Fourier Transform (STFT) and Wavelet Transform overcome these limitations.

The work is grounded purely in signal processing theory and focuses on resolution tradeoffs, windowing effects, and multi-resolution analysis.

---

## Motivation
The Fourier Transform provides global frequency information and assumes signal stationarity. Real-world signals such as speech, biomedical, and vibration signals violate this assumption. This project addresses this issue using time–frequency representations.

---

## Methodology
1. Generation of synthetic non-stationary and chirp signals  
2. Frequency-domain analysis using FFT  
3. Time–frequency analysis using STFT with different window lengths  
4. Resolution tradeoff analysis (time vs frequency)  
5. Continuous Wavelet Transform (CWT) for multi-resolution analysis  
6. Comparative study of STFT and Wavelet Transform  

---

## Tools & Libraries
- MATLAB  
- Signal Processing Toolbox  
- Wavelet Toolbox  

---

## Key Concepts
- Non-stationary signals  
- Short-Time Fourier Transform (STFT)  
- Time–frequency resolution tradeoff  
- Heisenberg uncertainty principle  
- Wavelet Transform and multi-resolution analysis  

---

## Results
The results demonstrate:
- Failure of FFT in capturing time-varying frequency content  
- Dependence of STFT resolution on window length  
- Superior transient localization using wavelet transforms  

---

## How to Run
Run the following file in MATLAB:
```matlab
time_frequency_analysis_project.m
