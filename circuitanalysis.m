% Parameters
R1 = 10; R2 = 20; R3 = 30; R4 = 40; R5 = 50; R6 = 60;
Vs1 = 60; Vs2 = 40; Is = 2;

% Nodal Analysis
G = [1/R1 + 1/R2, -1/R2, 0;
    -1/R2, 1/R2 + 1/R3 + 1/R4, -1/R4;
    0, -1/R4, 1/R4 + 1/R5 + 1/R6];
b_nodal = [0; -Is; 0];
V = G\b_nodal; % Node voltages
disp('Node Voltages (V1, V2, V3):');
disp(V);

% Mesh Analysis
R = [R1 + R2, -R2, 0;
    -R2, R3 + R4, -R4;
    0, -R4, R5 + R6];
b_mesh = [Vs1; 0; Vs2];
I = R\b_mesh; % Mesh currents
disp('Mesh Currents (I1, I2, I3):');
disp(I);

% Dependent source current
Ix = (V(3) - V(2)) / R4;
Vd = 2 * Ix;
disp('Dependent Voltage Source Value:');
disp(Vd);

% Power delivered by the dependent source
P_dep = Vd * Ix;
disp('Power Delivered by Dependent Source:');
disp(P_dep);