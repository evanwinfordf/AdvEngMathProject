% Parameters
L = 0.1;            % Length of the fin (m)
k = 50;             % Thermal conductivity (W/m·K)
h = 25;             % Convective heat transfer coefficient (W/m²·K)
T_a = 300;          % Ambient temperature (K)
T_b = 400;          % Base temperature (K)
A = 1e-4;           % Cross-sectional area (m²)
P = 0.02;           % Perimeter of the fin cross-section (m)

% Compute constants
m = sqrt(h * P / (k * A)); % Characteristic parameter
C2 = 100 / (1 + exp(-20)); % Solve for C2
C1 = C2 * exp(-20);        % Solve for C1

% Define the temperature distribution function T(x)
T = @(x) T_a + C1 * exp(m * x) + C2 * exp(-m * x);

% Heat transfer rate calculation at the base
dTdx = @(x) m * (C1 * exp(m * x) - C2 * exp(-m * x)); % Derivative of T(x)
q = -k * A * dTdx(0); % Heat transfer rate at x = 0

% Display results
fprintf('The temperature distribution along the fin is:\n');
fprintf('T(x) = 300 + %.2e * exp(m * x) + %.2f * exp(-m * x)\n', C1, C2);
fprintf('The heat transfer rate at the base is q = %.2f W\n', q);

% Plot the temperature distribution
x = linspace(0, L, 100); % Discretize the fin length (start = 0, end = L, 100 points)
T_x = T(x); % Evaluate T(x) along the fin

figure;
plot(x, T_x, 'b-', 'LineWidth', 1.5); hold on;
yline(T_a, 'r--', 'LineWidth', 1.5); % Plot ambient temperature
xlabel('Length along the Fin (m)');
ylabel('Temperature (K)');
title('Temperature Distribution in the Fin');
legend('Temperature Distribution', 'Ambient Temperature');
grid on;