clc;
clear all;
close all;

% Cargar las imágenes y convertirlas a tipo double
img_0 = im2double(imread("bosque.jpg"));
img_1 = im2double(imread("nieve.png"));
img_2 = im2double(imread("CaminoMad.jpg"));
img_3 = im2double(imread("ciudad.jpg"));
img_4 = im2double(imread("Palmeras.jpg"));

% ----------------------------
% Transformación Cuadrática (.^2)
% ----------------------------
img_quadratic = img_0 .^ 2;

figure(); 
subplot(1, 2, 1);
imshow(img_0);
title('Imagen Original');

subplot(1, 2, 2);
imshow(img_quadratic);
title('Transformación Cuadrática (.^2)');

% ----------------------------
% Transformación Logarítmica
% ----------------------------
img_logarithmic = log(1 + img_2);  % Agregamos 1

figure(); 
subplot(1, 2, 1);
imshow(img_2);
title('Imagen Original');

subplot(1, 2, 2);
imshow(img_logarithmic);
title('Transformación Logarítmica');

% ----------------------------
% Transformación Cúbica (.^3)
% ----------------------------
img_cubic = img_1 .^ 3; 

figure(); 
subplot(1, 2, 1);
imshow(img_1);
title('Imagen Original');

subplot(1, 2, 2);
imshow(img_cubic);
title('Transformación Cúbica (.^3)');

% ----------------------------
% Transformación Inversa (1 - img)
% ----------------------------
img_inverse = 1 - img_3;  % Invertir la imagen

figure(); 
subplot(1, 2, 1);
imshow(img_3);
title('Imagen Original - Ciudad');

subplot(1, 2, 2);
imshow(img_inverse);
title('Transformación Inversa (1 - img)');

% ----------------------------
% Multiplicación para Ajuste de Brillo
% ----------------------------
factor_brillo = 0.7;  % para reducir la sobreexposición en la imagen
img_brightness_adjusted = img_4 .* factor_brillo;

figure(); 
subplot(1, 2, 1);
imshow(img_4);
title('Imagen Original');

subplot(1, 2, 2);
imshow(img_brightness_adjusted);
title(['Ajuste de Brillo (img .* ', num2str(factor_brillo), ')']);

% ----------------------------
% Transformación Gamma (gamma < 1 y gamma > 1)
% ----------------------------
% Gamma < 1 para aclarar la imagen
gamma_baja = 0.5;
img_gamma_low = img_0 .^ gamma_baja;

% Gamma > 1 para oscurecer la imagen
gamma_alta = 1.5;
img_gamma_high = img_0 .^ gamma_alta;

figure();
subplot(1, 3, 1);
imshow(img_0);
title('Imagen Original - Bosque');

subplot(1, 3, 2);
imshow(img_gamma_low);
title(['Transformación Gamma (gamma = ', num2str(gamma_baja), ')']);

subplot(1, 3, 3);
imshow(img_gamma_high);
title(['Transformación Gamma (gamma = ', num2str(gamma_alta), ')']);
