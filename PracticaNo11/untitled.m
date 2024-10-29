clc;
clear all;
close all;

% Parámetros
P = 0:0.1:10; % Potencia de señal (en W)
N0 = 1; % Densidad espectral de potencia del ruido (en W/Hz)
B1 = 10000; % Primer valor de ancho de banda del canal (en Hz)
B2 = 100000; % Segundo valor de ancho de banda para comparación

% Capacidad del canal (Fórmula de Shannon)
C1 = B1 * log2(1 + (P/N0));   % Capacidad con ancho de banda B1
C2 = B2 * log2(1 + (P/N0)); % Capacidad con ancho de banda B2

% Gráfica
figure;
plot(P, C1, 'LineWidth', 2);
hold on; % Permite superponer múltiples gráficas
plot(P, C2, 'LineWidth', 2);
xlabel('Potencia de Señal (W)');
ylabel('Capacidad del Canal (bits/s)');
title('Capacidad de Canal para un Canal AWGN');
legend('B = 10000 Hz', 'B = 100000 Hz');
grid on;
hold off;
