clc;
clear all;
close all;

% Leer las imágenes
img_1 = imread('planta.jpg');
img_2 = imread('lapras.jpg');

% //////////////////////////////////////////////////////////
% Proceso para img_1
% //////////////////////////////////////////////////////////
img_original_1 = img_1;

% Sumar imagen rotada 1° consigo misma rotada 2°
img_rot_1 = imrotate(img_1, 1, 'bilinear', 'crop');
img_fuse_1 = imfuse(img_original_1, img_rot_1, 'blend');
img_original_1 = img_fuse_1;

figure(1)
subplot(1, 3, 1);
imshow(img_original_1);
title('Sumar imágenes rotadas de 0 a 1 grados');

% Sumar imagen rotada 2°
img_rot_1 = imrotate(img_1, 2, 'bilinear', 'crop');
img_fuse_1 = imfuse(img_original_1, img_rot_1, 'blend');
img_original_1 = img_fuse_1;

subplot(1, 3, 2);
imshow(img_original_1);
title('Sumar imágenes rotadas de 1 a 2 grados');

% Sumar imagen rotada 3°
img_rot_1 = imrotate(img_1, 3, 'bilinear', 'crop');
img_fuse_1 = imfuse(img_original_1, img_rot_1, 'blend');
img_original_1 = img_fuse_1;

subplot(1, 3, 3);
imshow(img_original_1);
title('Sumar imágenes rotadas de 2 a 3 grados');

% Sumar imagen rotada 4°
img_rot_1 = imrotate(img_1, 4, 'bilinear', 'crop');
img_fuse_1 = imfuse(img_original_1, img_rot_1, 'blend');
img_original_1 = img_fuse_1;

figure(2)
subplot(1, 3, 1);
imshow(img_1);
title('Imagen Original');

subplot(1, 3, 2);
imshow(img_original_1);
title('Sumar imágenes rotadas de 3 a 4 grados');

% Sumar imagen rotada 5°
img_rot_1 = imrotate(img_1, 5, 'bilinear', 'crop');
img_fuse_1 = imfuse(img_original_1, img_rot_1, 'blend');
img_original_1 = img_fuse_1;

subplot(1, 3, 3);
imshow(img_original_1);
title('Sumar imágenes rotadas de 4 a 5 grados');

% //////////////////////////////////////////////////////////
% Proceso para img_2
% //////////////////////////////////////////////////////////
img_original_2 = img_2;

% Sumar imagen rotada 1° consigo misma rotada 2°
img_rot_2 = imrotate(img_2, 1, 'bilinear', 'crop');
img_fuse_2 = imfuse(img_original_2, img_rot_2, 'blend');
img_original_2 = img_fuse_2;

figure(3)
subplot(1, 3, 1);
imshow(img_original_2);
title('Sumar imágenes rotadas de 0 a 1 grados');

% Sumar imagen rotada 2°
img_rot_2 = imrotate(img_2, 2, 'bilinear', 'crop');
img_fuse_2 = imfuse(img_original_2, img_rot_2, 'blend');
img_original_2 = img_fuse_2;

subplot(1, 3, 2);
imshow(img_original_2);
title('Sumar imágenes rotadas de 1 a 2 grados');

% Sumar imagen rotada 3°
img_rot_2 = imrotate(img_2, 3, 'bilinear', 'crop');
img_fuse_2 = imfuse(img_original_2, img_rot_2, 'blend');
img_original_2 = img_fuse_2;

subplot(1, 3, 3);
imshow(img_original_2);
title('Sumar imágenes rotadas de 2 a 3 grados');

% Sumar imagen rotada 4°
img_rot_2 = imrotate(img_2, 4, 'bilinear', 'crop');
img_fuse_2 = imfuse(img_original_2, img_rot_2, 'blend');
img_original_2 = img_fuse_2;

figure(4)
subplot(1, 3, 1);
imshow(img_2);
title('Imagen Original');

subplot(1, 3, 2);
imshow(img_original_2);
title('Sumar imágenes rotadas de 3 a 4 grados');

% Sumar imagen rotada 5°
img_rot_2 = imrotate(img_2, 5, 'bilinear', 'crop');
img_fuse_2 = imfuse(img_original_2, img_rot_2, 'blend');
img_original_2 = img_fuse_2;

subplot(1, 3, 3);
imshow(img_original_2);
title('Sumar imágenes rotadas de 4 a 5 grados');
