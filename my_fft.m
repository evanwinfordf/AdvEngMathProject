% FFT of signals
N = length(t);
f = fs*(0:N/2-1)/N; % Frequency vector

% Compute FFT for each phase
V_a = fft(v_a);
V_b = fft(v_b);
V_c = fft(v_c);

% Compute magnitude spectrum
P_a = abs(V_a(1:N/2))/N;
P_b = abs(V_b(1:N/2))/N;
P_c = abs(V_c(1:N/2))/N;

% Plot frequency spectra
figure;
subplot(3, 1, 1);
stem(f, P_a, 'b');
title('Phase A Spectrum');
xlabel('Frequency (Hz)'); ylabel('Amplitude');

subplot(3, 1, 2);
stem(f, P_b, 'r');
title('Phase B Spectrum');
xlabel('Frequency (Hz)'); ylabel('Amplitude');

subplot(3, 1, 3);
stem(f, P_c, 'g');
title('Phase C Spectrum');
xlabel('Frequency (Hz)'); ylabel('Amplitude');