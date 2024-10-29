clc;
clear all;
close all;

% Leer las imágenes
img_1 = imread("char.jpg");
img_2 = imread("ryquaza.png");
img_3 = imread("garchom.jpg");
img_4 = imread("snoopi.jpg");
img_5 = imread("disney.jpg")
%img_5 = rgb2gray(imread("disney.jpg")); 

% ------------------- Histograma de imágenes  -----------------------
figure;
% Imagen color 1
subplot(4, 3, 1);
imhist(img_1(:,:,1));
title('Histograma R (Color 1)');
subplot(4, 3, 2);
imhist(img_1(:,:,2));
title('Histograma G (Color 1)');
subplot(4, 3, 3);
imhist(img_1(:,:,3));
title('Histograma B (Color 1)');

% Imagen color 2
subplot(4, 3, 4);
imhist(img_2(:,:,1));
title('Histograma R (Color 2)');
subplot(4, 3, 5);
imhist(img_2(:,:,2));
title('Histograma G (Color 2)');
subplot(4, 3, 6);
imhist(img_2(:,:,3));
title('Histograma B (Color 2)');

% Imagen color 3
subplot(4, 3, 7);
imhist(img_3(:,:,1));
title('Histograma R (Color 3)');
subplot(4, 3, 8);
imhist(img_3(:,:,2));
title('Histograma G (Color 3)');
subplot(4, 3, 9);
imhist(img_3(:,:,3));
title('Histograma B (Color 3)');

% Imagen color 4
subplot(4, 3, 10);
imhist(img_4(:,:,1));
title('Histograma R (Color 4)');
subplot(4, 3, 11);
imhist(img_4(:,:,2));
title('Histograma G (Color 4)');
subplot(4, 3, 12);
imhist(img_4(:,:,3));
title('Histograma B (Color 4)');

% ------------------- Histograma de la imagen en blanco y negro -----------------------
figure;
imhist(img_5);
title('Histograma de la imagen en blanco y negro');
