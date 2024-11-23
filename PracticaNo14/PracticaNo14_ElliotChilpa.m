clear all;
close all;

% Cargar las imágenes
img_1 = imread("tortuga.jpg"); 
img_2 = imread("bosque.jpg");
img_3 = imread("venado.png");  % Imagen del venado
img_4 = imread("montañas.jpg");

% s = c .* log(1 + r)

% r es el valor de intensidad original del píxel
% s resultado del pixel despues de la transformación
% c es un factor de escala para ajustar la intensidad del efecto logarítmico.

% Convertir a double
img_1_d = im2double(img_1);
img_2_d = im2double(img_2);
img_3_d = im2double(img_3);
img_4_d = im2double(img_4);

% Parámetros de escala
c_1 = 3;
c_2 = 2;  
c_3 = 4; 
c_4 = 3;

% Transformación logarítmica para img_1
imagen_log_1 = zeros(size(img_1_d));
imagen_log_2 = zeros(size(img_2_d));
imagen_log_3 = zeros(size(img_3_d));
imagen_log_4 = zeros(size(img_4_d));

for k = 1:3
    imagen_log_1(:,:,k) = c_1 * log(1 + img_1_d(:,:,k));
    imagen_log_2(:,:,k) = c_2 * log(1 + img_2_d(:,:,k));
    imagen_log_3(:,:,k) = c_3 * log(1 + img_3_d(:,:,k));
end

for k = 1:2
    imagen_log_4(:,:,k) = c_4 * log(1 + img_4_d(:,:,k));
end

% Normalizar imagen
%imagen_log_3 = mat2gray(imagen_log_3);  % Normalizar entre 0 y 1

% Imprimir imagen original y transformada
figure();
subplot(1, 2, 1);
imshow(img_1_d);
title('Imagen Original');

subplot(1, 2, 2);
imshow(imagen_log_1);
title('Transformación Logarítmica');

% Imprimir imagen original y transformada
figure();
subplot(1, 2, 1);
imshow(img_2_d);
title('Imagen Original');

subplot(1, 2, 2);
imshow(imagen_log_2);
title('Transformación Logarítmica');

% Imprimir imagen original y transformada
figure();
subplot(1, 2, 1);
imshow(img_3_d);
title('Imagen Original');

subplot(1, 2, 2);
imshow(imagen_log_3);
title('Transformación Logarítmica');

% Imprimir imagen original y transformada
figure();
subplot(1, 2, 1);
imshow(img_4_d);
title('Imagen Original');

subplot(1, 2, 2);
imshow(imagen_log_4);
title('Transformación Logarítmica');