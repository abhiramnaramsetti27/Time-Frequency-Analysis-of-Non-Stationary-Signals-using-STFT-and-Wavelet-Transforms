%% TIME–FREQUENCY ANALYSIS OF NON-STATIONARY SIGNALS
% STFT vs Wavelet Transform
% Pure Signal Processing Project

clc; clear; close all;

%% ==============================
% 1. SIGNAL GENERATION
% ===============================

fs = 1000;                % Sampling frequency (Hz)
t = 0:1/fs:4-1/fs;        % Time vector (4 seconds)

% Non-stationary signal
x = sin(2*pi*5*t).*(t<2) + sin(2*pi*20*t).*(t>=2);

% Chirp signal
chirp_sig = chirp(t,5,4,50);

figure('Name','Time Domain Signals');
subplot(2,1,1)
plot(t,x), grid on
title('Non-Stationary Signal (5 Hz → 20 Hz)')
xlabel('Time (s)'), ylabel('Amplitude')

subplot(2,1,2)
plot(t,chirp_sig), grid on
title('Chirp Signal')
xlabel('Time (s)'), ylabel('Amplitude')

%% ==============================
% 2. FFT ANALYSIS (FAILURE CASE)
% ===============================

N = length(x);
X = abs(fft(x));
f = (0:N-1)*(fs/N);

figure('Name','FFT Analysis');
plot(f,X), grid on
xlim([0 50])
title('FFT of Non-Stationary Signal (No Time Information)')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')

%% ==============================
% 3. STFT ANALYSIS
% ===============================

window = hamming(256);
noverlap = 200;
nfft = 512;

figure('Name','STFT Spectrogram');
spectrogram(x,window,noverlap,nfft,fs,'yaxis')
title('STFT Spectrogram (Hamming Window)')

%% ==============================
% 4. TIME–FREQUENCY RESOLUTION TRADEOFF
% ===============================

figure('Name','STFT Resolution Tradeoff');

win_lengths = [64 256 512];

for i = 1:length(win_lengths)
    subplot(3,1,i)
    spectrogram(x,hamming(win_lengths(i)), ...
        round(0.8*win_lengths(i)),512,fs,'yaxis')
    title(['Window Length = ',num2str(win_lengths(i))])
end

%% ==============================
% 5. WAVELET TRANSFORM (CWT)
% ===============================

figure('Name','Wavelet Transform');
cwt(x,'amor',fs)
title('Wavelet Scalogram (Morlet Wavelet)')

%% ==============================
% 6. STFT vs WAVELET COMPARISON
% ===============================

figure('Name','STFT vs Wavelet');

subplot(2,1,1)
spectrogram(x,hamming(256),200,512,fs,'yaxis')
title('STFT Spectrogram')

subplot(2,1,2)
cwt(x,'amor',fs)
title('Wavelet Scalogram')

%% ==============================
% END OF SCRIPT
% ===============================
