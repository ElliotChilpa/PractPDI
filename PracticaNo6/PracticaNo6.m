clc;
clear all;
close all;

img_1 = imread("garchom.jpg");

img_1_rotada = imrotate(img_1, 45);

figure();
subplot(1, 2, 1);
imshow(img_1);
title("Imagen Original");

subplot(1, 2, 2);
imshow(img_1_rotada);
title("Imagen Rotada");

% Transformación Afín con imwarp
% Las transformaciones afines permiten realizar una rotación, además de otras operaciones como escalado y traslación. 
theta = 45; % Ángulo de rotación en grados

% Crear la matriz de transformación afín (rotación)
T = affine2d([cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1]);

% Una transformación afín es una operación geométrica que preserva las relaciones entre 
% líneas paralelas y consiste en una combinación de operaciones como rotación, escalado, 
% traslación (desplazamiento) y estiramiento. En el caso de una rotación, solo estamos girando 
% los puntos de una imagen alrededor de un punto de referencia, que por lo general es el centro de la imagen.

% Aplicar la transformación afín (rotación)
img_1_rotada_afin = imwarp(img_1, T);
figure(2);
imshow(img_1_rotada_afin); % Mostrar la imagen rotada