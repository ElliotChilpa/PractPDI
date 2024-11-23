clc;
clear all;
close all;

img_1 = imread('BrackingBad.jpg');
img_2 = imread('cactus.jpg');
img_3 = imread("Mariposas.jpg");

% ///////////////////////////////
% Agregar Ruido Gausiano simplemente con imnoise
% ///////////////////////////////
img_1GN = imnoise(img_1, 'gaussian');
img_2GN = imnoise(img_2, 'gaussian');
img_3GN = imnoise(img_3, 'gaussian');

% ///////////////////////////////
% Ruido Sal y Pimienta
% ///////////////////////////////
% Nota para el ruido sal y pimienta es necesario utilizar 1 solo plano a la
% vez si queremos ponerle ese ruido a nuestras imagenes.

% Imagen a blanco y negro
if size(img_1, 3) == 3
    img_1Gris = rgb2gray(img_1); % Convertir a escala de grises si es RGB
else
    img_1Gris = img_1;
end

if size(img_2, 3) == 3
    img_2Nor = rgb2gray(img_2); % Escala de grises para referencia si es necesario
else
    img_2Nor = img_2;
end

if size(img_3, 3) == 3
    img_3Gris = rgb2gray(img_3);
else
    img_3Gris = img_3;
end

ruidoSP = 0.05; % Porcentaje de ruido (5%)

% imagen 1
img_1SP = imnoise(img_1Gris, 'salt & pepper', ruidoSP);

% Ruido sal y pimienta para cada canal de color de img_2
    r_2 = img_2(:, :, 1);
    g_2 = img_2(:, :, 2);
    b_2 = img_2(:, :, 3);

    r_2SP = imnoise(r_2, 'salt & pepper', ruidoSP);
    g_2SP = imnoise(g_2, 'salt & pepper', ruidoSP);
    b_2SP = imnoise(b_2, 'salt & pepper', ruidoSP);

    % Reconstruir la imagen con ruido en cada canal
    img_2SP = cat(3, r_2SP, g_2SP, b_2SP);


% imagen 3
img_3SP = imnoise(img_3Gris, 'salt & pepper', ruidoSP);

% ///////////////////////////////
% Agregar Ruido Multiplicativo
% ///////////////////////////////

% Normalizar la imagen a rango [0, 1]
img_2Nor = im2double(img_2Nor);

% Generar ruido multiplicativo uniforme
a = 0.8; % Límite inferior (reduce brillo)
b = 1.2; % Límite superior (aumenta brillo)
ruido_multiplicativo = a + (b-a) * rand(size(img_2Nor));

% Aplicar el ruido multiplicativo
img_2MN = img_2Nor .* ruido_multiplicativo;


% ///////////////////////////////
% Filtro de la media con mi propio kernel
% ///////////////////////////////
media_mask = [0 1 0;
               1 4 1;
               0 1 0] / 8;

media_mask1 = [0 1 0;
               1 2 1;
               0 1 0] / 6;

% fspecial genera máscaras (o kernels) predefinidos para diversas operaciones de filtrado. 
% Average es el filtro de la media
h_media = fspecial('average', [3 3]);

img_1filtMGN = imfilter(img_1GN, media_mask, 'same', 'symmetric');
img_1filtMSP = imfilter(img_1SP, media_mask, 'same', 'symmetric');
img_1filtMSP8 = imfilter(img_1SP, h_media, 'same', 'symmetric');

% Utiliza conectividad 8, porque el filtro promedio (average) generado por esta función 
% incluye todos los píxeles en un vecindario 3×3
img_2filtMGN = imfilter(img_2GN, h_media, 'same', 'symmetric');
img_2filtMSP = imfilter(img_2SP, h_media, 'same', 'symmetric');
img_2filtMMN = imfilter(img_2MN, h_media, 'same', 'symmetric')

img_3filtMGN = imfilter(img_3GN, media_mask1, 'same', 'symmetric');
img_3filtMSP = imfilter(img_3SP, media_mask1, 'same', 'symmetric');
img_3fitlMFN = imfilter(img_3SP, media_mask, 'same', 'symmetric');

% ///////////////////////////////
% Imagen 1
% ///////////////////////////////
% Imagen Original
figure(1);
subplot(1, 3, 1);
imshow(img_1);
title('Imagen Original');

subplot(1, 3, 2);
imshow(img_1GN);
title('Ruido Gausiano');

subplot(1, 3, 3);
imshow(img_1SP);
title('Ruido Sal y Pimienta');

% Imagen comparada filtro M conectividad 4 y 8
figure(2);
subplot(1, 3, 1);
imshow(img_1filtMGN);
title('filtro Media GN (4)');

subplot(1, 3, 2);
imshow(img_1filtMSP);
title('Filtro Media SP (4)');

subplot(1, 3, 3);
imshow(img_1filtMSP8); % podríamos cambiar a sp
title('Filtro Media SP (8)');

% ///////////////////////////////
% Imagen 2
% ///////////////////////////////
% Imagen Original
figure(3);
%subplot(1, 3, 1);
imshow(img_2);
title('Imagen Original');

figure(4);
subplot(1, 3, 1);
imshow(img_2GN);
title('Ruido Gausiano');

subplot(1, 3, 2);
imshow(img_2SP);
title('Ruido Sal y Pimienta');

subplot(1, 3, 3);
imshow(img_2MN);
title('Ruido Multiplicativo');

% Imagen comparada filtro M conectividad 8
figure(5);
subplot(1, 3, 1);
imshow(img_2filtMGN);
title('filtro Media GN (8)');

subplot(1, 3, 2);
imshow(img_2filtMSP);
title('Filtro Media SP (8)');

subplot(1, 3, 3);
imshow(img_2filtMMN);
title('Filtro Media Mult (8)');

% ///////////////////////////////
% Imagen 3
% ///////////////////////////////
% Imagen Original
figure(6);
%subplot(1, 3, 1);
imshow(img_3);
title('Imagen Original');

figure(7);
subplot(1, 2, 1);
imshow(img_3GN);
title('Ruido Gausiano');

subplot(1, 2, 2);
imshow(img_3SP);
title('Ruido Sal y Pimienta');

% subplot(1, 3, 3);
% imshow(img_3FN);
% title('Ruido Frecuencial');

% Imagen comparada filtro M conectividad 8
figure(8);
subplot(1, 3, 1);
imshow(img_3filtMGN);
title('filtro Media GN (8) mk(2)');

subplot(1, 3, 2);
imshow(img_3filtMSP);
title('Filtro Media SP (8) mk(2)');

subplot(1, 3, 3);
imshow(img_3fitlMFN);
title('Filtro Media SP (8) mk(4)');