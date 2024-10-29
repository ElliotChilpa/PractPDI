clc;
clear all;
close all;

img_1 = imread('atardecer.jpg');
img_2 = imread('espacion.jpg');
img_3 = imread('paisaje.jpg');

scale = 0.7;  % Reducción de tamaño al 50%

img_1_rz = imresize(img_1, scale);
img_1_rzNA = imresize(img_1, scale,'Antialiasing',false);
img_1_nearest = imresize(img_1, scale, 'nearest');
img_1_bilinear = imresize(img_1, scale, 'bilinear');
img_1_bicubic = imresize(img_1, scale, 'bicubic');
img_1_lanczos3 = imresize(img_1, scale, 'lanczos3');

img_2_rz = imresize(img_2, scale);
img_2_rzNA = imresize(img_2, scale,'Antialiasing',false);
img_2_nearest = imresize(img_2, scale, 'nearest');
img_2_bilinear = imresize(img_2, scale, 'bilinear');
img_2_bicubic = imresize(img_2, scale, 'bicubic');
img_2_lanczos3 = imresize(img_2, scale, 'lanczos3');

img_3_rz = imresize(img_3, scale);
img_3_rzNA = imresize(img_3, scale,'Antialiasing',false);
img_3_nearest = imresize(img_3, scale, 'nearest');
img_3_bilinear = imresize(img_3, scale, 'bilinear');
img_3_bicubic = imresize(img_3, scale, 'bicubic');
img_3_lanczos3 = imresize(img_3, scale, 'lanczos3');

% ///////////////////////////////////////////////////////////////////////////////////////////
% ---------- Imprimir imagen Número 1
% ///////////////////////////////////////////////////////////////////////////////////////////

figure(1);
imshow(img_1);
title('Imagen Original');

figure(2);
subplot(1, 2, 1);
imshow(img_1_rz);
title('Imagen redimencionada 70%');

subplot(1, 2, 2);
imshow(img_1_rzNA);
title('Imagen RZ 70% sin Antialiasing');

figure(3);
subplot(1, 2, 1);
imshow(img_1_nearest);
title('Interpolación nearest');

%figure();
subplot(1, 2, 2);
imshow(img_1_bilinear);
title('Interpolación Bilineal');

figure(4);
subplot(1, 2, 1);
imshow(img_1_bicubic);
title('Interpolación Bicúbica');

%figure();
subplot(1, 2, 2);
imshow(img_1_lanczos3);
title('Interpolación Lanczos-3');

% ///////////////////////////////////////////////////////////////////////////////////////////
% ---------- Imprimir imagen Número 2
% ///////////////////////////////////////////////////////////////////////////////////////////

figure(5);
imshow(img_2);
title('Imagen Original');

figure(6);
subplot(1, 2, 1);
imshow(img_2_rz);
title('Imagen redimencionada 70%');

subplot(1, 2, 2);
imshow(img_2_rzNA);
title('Imagen RZ 70% sin Antialiasing');

figure(7);
subplot(1, 2, 1);
imshow(img_2_nearest);
title('Interpolación nearest');

%figure();
subplot(1, 2, 2);
imshow(img_2_bilinear);
title('Interpolación Bilineal');

figure(8);
subplot(1, 2, 1);
imshow(img_2_bicubic);
title('Interpolación Bicúbica');

%figure();
subplot(1, 2, 2);
imshow(img_2_lanczos3);
title('Interpolación Lanczos-3');

% ///////////////////////////////////////////////////////////////////////////////////////////
% ---------- Imprimir imagen Número 2
% ///////////////////////////////////////////////////////////////////////////////////////////

figure(9);
imshow(img_2);
title('Imagen Original');

figure(10);
subplot(1, 2, 1);
imshow(img_2_rz);
title('Imagen redimencionada 70%');

subplot(1, 2, 2);
imshow(img_2_rzNA);
title('Imagen RZ 70% sin Antialiasing');

figure(11);
subplot(1, 2, 1);
imshow(img_2_nearest);
title('Interpolación nearest');

%figure();
subplot(1, 2, 2);
imshow(img_2_bilinear);
title('Interpolación Bilineal');

figure(12);
subplot(1, 2, 1);
imshow(img_2_bicubic);
title('Interpolación Bicúbica');

%figure();
subplot(1, 2, 2);
imshow(img_2_lanczos3);
title('Interpolación Lanczos-3');