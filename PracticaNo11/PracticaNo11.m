clc;
clear all;
close all;

% Cargar la imagen en escala de grises
img_gris = imread('ryquaza.png');
img_gris = rgb2gray(img_gris); % Convertir a escala de grises si es necesario

% Invertir la imagen
img_invertida = 255 - img_gris;

% Mostrar la imagen original y la invertida
figure;
subplot(1, 2, 1);
imshow(img_gris);
title('Imagen Original');

subplot(1, 2, 2);
imshow(img_invertida);
title('Imagen Invertida');
