% Parameters
L = 2e-6; % Inductance per unit length (H/m)
C = 8e-12; % Capacitance per unit length (F/m)
Z0 = sqrt(L / C); % Characteristic impedance (Ohms)
L_line = 100; % Length of the transmission line (m)
Nx = 100; % Number of spatial points
dx = L_line / (Nx - 1); % Spatial step (m)
c = 1 / sqrt(L * C); % Wave propagation speed (m/s)
dt = dx / c; % Time step (s) for stability
Nt = 500; % Number of time steps
f = 1e6; % Frequency of input signal (Hz)
Vin = @(t) 10 * sin(2 * pi * f * t); % Input voltage signal

% Initialize voltage and current matrices
V = zeros(Nx, Nt); % Voltage
I = zeros(Nx, Nt); % Current

% Set boundary conditions
ZL = 200; % Load impedance (Ohms)
V(1, :) = Vin((0:Nt-1) * dt); % Input voltage at the left end
I(end, :) = V(end, :) / ZL; % Current at the load (right end)

% Update voltage using FDM (Finite Difference Method)
for n = 2:Nt-1
    for i = 2:Nx-1
        % FDM update equation for voltage
        V(i, n+1) = 2 * V(i, n) - V(i, n-1) + ...
                    (c^2 * dt^2 / dx^2) * (V(i+1, n) - 2 * V(i, n) + V(i-1, n));
    end
end

% Spatial positions and time vector
x = linspace(0, L_line, Nx); % Spatial positions
t = (0:Nt-1) * dt; % Time vector

% Plot voltage distribution at a specific time step
time_index = 100; % Choose a time step for visualization

figure;
plot(x, V(:, time_index), 'b-', 'LineWidth', 1.5);
xlabel('Position along the line (m)');
ylabel('Voltage (V)');
title(['Voltage Distribution at t = ', num2str(time_index * dt), ' s']);
grid on;

% Corrected 3D wave propagation plot
figure;
[T, X] = meshgrid(t, x); % Create grids for time and position
% Corrected 3D wave propagation plot
figure;
[T, X] = meshgrid(t, x); % Create grids for time and position
mesh(T, X, V); % Voltage matrix remains unchanged
xlabel('Time (s)');
ylabel('Position along the line (m)');
zlabel('Voltage (V)');
title('Voltage Wave Propagation in Transmission Line');