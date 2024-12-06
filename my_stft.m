% Short-Time Fourier Transform (STFT)
figure;
spectrogram(v_a, hamming(256), 128, 512, fs, 'yaxis');
title('STFT of Phase A');