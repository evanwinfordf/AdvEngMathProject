% Parameters
fs = 10000; % Sampling frequency (Hz)
T = 0.5; % Total signal duration (s)
t = 0:1/fs:T-1/fs; % Time vector
f1 = 50; % Fundamental frequency (Hz)
V_nom = 230; % RMS voltage (V)

% Pre-fault signal
v_a = sqrt(2)*V_nom*sin(2*pi*f1*t);
v_b = sqrt(2)*V_nom*sin(2*pi*f1*t - 2*pi/3);
v_c = sqrt(2)*V_nom*sin(2*pi*f1*t + 2*pi/3);

% Fault disturbance on phase a
t_fault = 0.1; % Fault start time (s)
fault_duration = 0.05; % Fault duration (s)
v_a_fault = 0.5*sqrt(2)*V_nom*sin(2*pi*f1*t) + ...
    100*sin(2*pi*300*t).*exp(-100*(t-t_fault));
v_a(t >= t_fault & t <= t_fault + fault_duration) = v_a_fault(t >= t_fault & t <= t_fault + fault_duration);

% Transient on all phases
t_transient = 0.15; % Transient start time (s)
v_transient = 50*sin(2*pi*1000*t).*exp(-200*(t-t_transient));
v_a(t >= t_transient) = v_a(t >= t_transient) + v_transient(t >= t_transient);
v_b(t >= t_transient) = v_b(t >= t_transient) + v_transient(t >= t_transient);
v_c(t >= t_transient) = v_c(t >= t_transient) + v_transient(t >= t_transient);