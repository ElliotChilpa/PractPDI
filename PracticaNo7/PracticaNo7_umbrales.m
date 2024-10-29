clc;
clear all;
close all;

img_1 = imread('patos.jpg');

% Convertir la imagen a escala de grises
img_1_gris = rgb2gray(img_1);

figure(1);
imshow(img_1_gris);
title('Imagen Original');

% Definir umbral
umbral = 100;

% Sumar 50 a los píxeles por encima del umbral
img_1_suma = img_1_gris;
img_1_suma(img_1_gris > umbral) = img_1_gris(img_1_gris > umbral) + 50;

% Restar 50 a los píxeles por debajo del umbral
img_1_resta = img_1_gris;
img_1_resta(img_1_gris < umbral) = img_1_gris(img_1_gris < umbral) - 50;

% Imprimir Resultados
figure;
subplot(1,2,1);
imshow(img_1_suma);
title('Suma a los valores > 100');

subplot(1,2,2);
imshow(img_1_resta);
title('Resta a los valores < 100');

%% Operaciones por zonas
% Definir una zona
zona = img_1_gris(1:100, 1:100); 

zona_multiplicada = zona * 2;

% Reemplazar la zona original con la zona modificada
img_1_zona_modificada = img_1_gris;
img_1_zona_modificada(1:100, 1:100) = zona_multiplicada;

% Mostrar el resultado
figure;
imshow(img_1_zona_modificada);
title('Multiplicación por 2 en la zona (100x100)');

%% Operaciones por planos de bits
% Extraer los planos de bits de la imagen
bit_planes = cell(1, 8);
for i = 1:8
    bit_planes{i} = bitget(img_1_gris, i); % Extrae cada plano de bits
end

% Mostrar los planos de bits
figure;
for i = 1:8
    subplot(2, 4, i);
    imshow(logical(bit_planes{i}));
    title(['Plano de bits ', num2str(i)]);
end

%% Modificar uno de los planos de bits (por ejemplo, el más significativo)
A_modificada_bits = img_1_gris;
A_modificada_bits = bitset(A_modificada_bits, 8, 0); % Poner en 0 el plano más significativo

% Mostrar la imagen modificada
figure;
imshow(A_modificada_bits);
title('Imagen con el plano de bits 8 en 0');

%% Operaciones por división
% Si la imagen tiene menos de 250 filas o columnas, ajustamos el rango
fila_inicio = 150;
fila_fin = min(250, rows); % El índice máximo de fila será el mínimo entre 250 y el número de filas de la imagen
col_inicio = 150;
col_fin = min(250, cols); % El índice máximo de columna será el mínimo entre 250 y el número de columnas de la imagen

% Ahora seleccionamos la zona
zona2 = img_1_gris(fila_inicio:fila_fin, col_inicio:col_fin);


% Dividir los valores de esa zona entre 2
zona_dividida = zona2 / 2;

% Reemplazar la zona original con la zona modificada
A_zona_dividida = img_1_gris;
A_zona_dividida(150:250, 150:250) = zona_dividida;

% Mostrar el resultado
figure;
imshow(A_zona_dividida);
title('División por 2 en la zona (150x250)');

