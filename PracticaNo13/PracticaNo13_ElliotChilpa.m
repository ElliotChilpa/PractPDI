clc;
clear all;
close all;

img_1 = imread("paisaje.jpg");
img_2 = imread("nieve.png");
img_3 = imread("tortuga.jpg");
img_4 = imread("montañas.jpg");

% ----------------------------------------------
% Imagen en escala de grises
% ----------------------------------------------
img_gray = rgb2gray(im2double(img_1));  % Convertir a escala de grises

figure;
subplot(1, 4, 1);
imshow(img_gray);
title('Imagen Original en Escala de Grises');

% Ajuste de histograma con gamma = 1 
img_adjust_gray_1 = imadjust(img_gray, [0 0.4], [0 1], 1);
subplot(1, 4, 2);
imshow(img_adjust_gray_1);
title('Ajuste Histograma (0-0.4) gamma = 1 ');

% Ajuste de histograma con gamma < 1 
img_adjust_gray_2 = imadjust(img_gray, [0 0.4], [0 1], 0.5);
subplot(1, 4, 3);
imshow(img_adjust_gray_2);
title('Ajuste Histograma (0-0.4) gamma < 1 ');

% Ajuste de histograma con gamma > 1 
img_adjust_gray_3 = imadjust(img_gray, [0 0.4], [0 1], 3);
subplot(1, 4, 4);
imshow(img_adjust_gray_3);
title('Ajuste Histograma (0-0.4) gamma > 1 ');

% ------------------- Histograma de imágenes  -----------------------
% Imagen color 1
figure;
subplot(2, 2, 1);
imhist(img_gray);
title('Histograma escala de grises Img Original');

% Imagen color 2
subplot(2, 2, 2);
imhist(img_adjust_gray_2);
title('Histograma gamma < 1');

% Imagen color 3
subplot(2, 2, 3);
imhist(img_adjust_gray_1);
title('Histograma gamma = 1');

% Imagen color 4
subplot(2, 2, 4);
imhist(img_adjust_gray_3);
title('Histograma gamma > 1');

% ----------------------------------------------
% Imagen en escala de color modificando rango
% ----------------------------------------------
img_color = im2double(img_2);

figure;
subplot(2, 2, 1);
imshow(img_color);
title('Imagen Original a Color');

% Ajuste de histograma valores de 0 a 0.5
img_adjust_color_1 = imadjust(img_color, [0 0.5], [0 1]);
subplot(2, 2, 2);
imshow(img_adjust_color_1);
title('Ajuste Histograma (0 - 0.5)');

% Ajuste de histograma para resaltar tonos claros en la imagen en color
img_adjust_color_2 = imadjust(img_color, [0.4 0.8], [0 1]);
subplot(2, 2, 3);
imshow(img_adjust_color_2);
title('Ajuste Histograma (0.4 - 0.8)');

% Ajuste de histograma con rango completo para expandir todo el contraste
img_adjust_color_3 = imadjust(img_color, [0.4 0.8], [0 1], 0.2);
subplot(2, 2, 4);
imshow(img_adjust_color_3);
title('Ajuste Histograma (0.4 - 0.8)');

% ----------------------------------------------
% Imagen en escala de color modificando rango
% ----------------------------------------------
img_color_2 = im2double(img_3);

% Ajuste para cada canal de color
img_color_adj = imadjust(img_color_2, [0.2 0.3 0.1; 0.8 0.9 0.7], [0 0 0; 1 1 1]);

% Ajuste para cada canal de color con Gamma < 1
img_color_adj_1 = imadjust(img_color_2, [0.2 0.3 0.1; 0.8 0.9 0.7], [0 0 0; 1 1 1], 0.2);

% Grafica Imagen Original
figure;
subplot(1, 3, 1);
imshow(img_3);
title('Imagen Original');

subplot(1, 3, 2);
imshow(img_color_adj);
title('Ajustae (R, G, B)');

subplot(1, 3, 3);
imshow(img_color_adj_1);
title('Ajustae (R, G, B) gamma < 1');

% ----------------------------------------------
% Imagen color, verde
% ----------------------------------------------
img_color_3 = im2double(img_4);

% Ajuste para cada canal de color
img_color_adj_2 = imadjust(img_color_3, [0.1 0.1 0.1; 0.4 0.4 0.4], [0 0 0; 1 1 1]);

% Ajuste para cada canal de color con Gamma específico para el canal verde
img_color_adj_3 = imadjust(img_color_3, [0.1 0.1 0.1; 0.4 0.4 0.4], [0 0 0; 1 1 1], 0.5); % Gamma en el canal verde

% Graficar Imagen Original y Ajustes
figure;
subplot(1, 3, 1);
imshow(img_4);
title('Imagen Original');

subplot(1, 3, 2);
imshow(img_color_adj_2);
title('Ajuste para Resaltar (R, G, B)');

subplot(1, 3, 3);
imshow(img_color_adj_3);
title('Ajuste con Gamma < 1');
