clc;
clear all;
close all;

imagen_1 = imread("Album_Jesse.jpg");
imagen_1_M = imagen_1;

R = imagen_1(:, :, 1);             % Extraer el plano rojo
G = imagen_1(:, :, 2);             % Extraer el plano verde
B = imagen_1(:, :, 3);             % Extraer el plano azul

% Mostrar los tres planos por separado
figure(1)
subplot(1,3,1)
imshow(R)
title('Plano Rojo');

subplot(1,3,2)
imshow(G) 
title('Plano Verde');

subplot(1,3,3)
imshow(B) 
title('Plano Azul');

disp('Seleccióna los píxeles a modificar del plano Azul');

[x, y, pixeles] = impixel(B);


% Recorremos los pixeles modificamos y los cambiamos de color
for i = 1:length(x)
    imagen_1_M(x(i), y(i), :) = [2, 62, 138];
end

%% Imprimir Imagen Original y la modificada en el plano azul
figure();
subplot(1,2,1)
imshow(imagen_1);
title("Imagen ORIGINAL");

subplot(1,2,2)
imshow(imagen_1_M);
title("Imagen MODIFICADA");