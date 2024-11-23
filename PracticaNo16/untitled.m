clc;
clear all;
close all;

img_1 = imread('MFdoom.jpg');
img_2 = imread('peru.jpg');

% ///////////////////////////////
% Agregar Ruido Gausiano
% ///////////////////////////////
img_1GN = imnoise(img_1, 'gaussian');
img_2GN = imnoise(img_2, 'gaussian');

% ///////////////////////////////
% Ruido Sal y Pimienta
% ///////////////////////////////
if size(img_1, 3) == 3
    img_1Gris = rgb2gray(img_1); % Convertir a escala de grises si es RGB
else
    img_1Gris = img_1;
end

if size(img_2, 3) == 3
    img_2Gris = rgb2gray(img_2); % Convertir a escala de grises si es RGB
else
    img_2Gris = img_2;
end

ruidoSP = 0.05; % Porcentaje de ruido (5%)
img_1SP = imnoise(img_1Gris, 'salt & pepper', ruidoSP);
img_2SP = imnoise(img_2Gris, 'salt & pepper', ruidoSP);

% ///////////////////////////////
% Filtro de la media (Conectividad 8)
% ///////////////////////////////
media_mask8 = [1 1 1;
               1 1 1;
               1 1 1] / 9; % Kernel de conectividad 8 normalizado

img_1filtM = imfilter(img_1GN, media_mask8, 'same');
img_1filtM_2 = imfilter(img_1SP, media_mask8, 'same');

img_2filtM = imfilter(img_2GN, media_mask8, 'same');
img_2filtM_2 = imfilter(img_2SP, media_mask8, 'same');

% ///////////////////////////////
% Filtro Gausiano (Conectividad 8)
% ///////////////////////////////
% Parámetros
sigma = 0.5;
kernel = 3;

% Coordenadas del kernel
half_size = floor(kernel / 2);
[x, y] = meshgrid(-half_size:half_size, -half_size:half_size);

% Cálculo del Kernel Gaussiano
kernel_GN = exp(-(x.^2 + y.^2) / (2 * sigma^2));
kernel_GN = kernel_GN / sum(kernel_GN(:)); % Normalizar para que la suma sea 1

% Aplicar el filtro Gaussiano
img_1FilG = imfilter(img_1GN, kernel_GN, 'same', 'symmetric');
img_1FilG_2 = imfilter(img_1SP, kernel_GN, 'same', 'symmetric');

img_2FilG = imfilter(img_2GN, kernel_GN, 'same', 'symmetric');
img_2FilG_2 = imfilter(img_2SP, kernel_GN, 'same', 'symmetric');

% ///////////////////////////////
% Imagen 1
% ///////////////////////////////
% Imagen Original
figure(1);
imshow(img_1);
title('Imagen Original');

% Imagen Comparada Gausiano
figure(2);
subplot(1, 3, 1);
imshow(img_1GN);
title('Imagen Ruido Gausiano');

subplot(1, 3, 2);
imshow(img_1filtM);
title('Imagen filtro Media 3x3 (Conectividad 8)');

subplot(1, 3, 3);
imshow(img_1FilG);
title('Filtro Gausiano 3x3');

% Imagen Comparada Sal y Pimienta
figure(3);
subplot(1, 3, 1);
imshow(img_1SP);
title('Ruido Sal y Pimienta');

subplot(1, 3, 2);
imshow(img_1filtM_2);
title('Imagen filtro Media 3x3 (Conectividad 8)');

subplot(1, 3, 3);
imshow(img_1FilG_2);
title('Filtro Gausiano 3x3');

% ///////////////////////////////
% Imagen 2
% ///////////////////////////////
% Imagen Original
figure(4);
imshow(img_2);
title('Imagen Original');

% Imagen Comparada Gausiano
figure(5);
subplot(1, 3, 1);
imshow(img_2GN);
title('Imagen Ruido Gausiano');

subplot(1, 3, 2);
imshow(img_2filtM);
title('Imagen filtro Media 3x3 (Conectividad 8)');

subplot(1, 3, 3);
imshow(img_2FilG);
title('Filtro Gausiano 3x3');

% Imagen Comparada Sal y Pimienta
figure();
subplot(1, 3, 1);
imshow(img_2SP);
title('Ruido Sal y Pimienta');

subplot(1, 3, 2);
imshow(img_2filtM_2);
title('Imagen filtro Media 3x3 (Conectividad 8)');

subplot(1, 3, 3);
imshow(img_2FilG_2);
title('Filtro Gausiano 3x3');
