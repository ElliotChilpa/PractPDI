clc;
clear all;
close all;

img_1 = imread("planta.jpg");
img_2 = imread("lapras.jpg");
img_3 = imread("fuego.jpg");
img_4 = imread("persona.jpg");

% Redimensionar las imágenes si es necesario
if size(img_1, 1) ~= size(img_2, 1) || size(img_1, 2) ~= size(img_2, 2)
    img_2 = imresize(img_2, [size(img_1, 1), size(img_1, 2)]);
end

if size(img_3, 1) ~= size(img_4, 1) || size(img_3, 2) ~= size(img_4, 2)
    img_4 = imresize(img_4, [size(img_3, 1), size(img_3, 2)]);
end

% Convertir las imágenes a tipo double
imgD_1 = double(img_1);
imgD_2 = double(img_2);
imgD_3 = double(img_3);
imgD_4 = double(img_4);

% Multiplicación
imgMult_1 = imgD_1 .* imgD_2;
imgMult_2 = imgD_3 .* imgD_4;

% Escalar las imágenes multiplicadas para que estén en el rango 0-255
imgMult_1 = imgMult_1 / max(imgMult_1(:)) * 255;
imgMult_2 = imgMult_2 / max(imgMult_2(:)) * 255;

% División (evitar división por cero con un pequeño valor epsilon)
imgDiv_1 = imgD_1 ./ (imgD_2 + eps);  % Evitar dividir por cero
imgDiv_2 = imgD_3 ./ (imgD_4 + eps);

% Escalar las imágenes divididas para que estén en el rango 0-255
imgDiv_1 = imgDiv_1 / max(imgDiv_1(:)) * 255;
imgDiv_2 = imgDiv_2 / max(imgDiv_2(:)) * 255;

% Suma
imgSum_1 = imgD_1 + imgD_2;
imgSum_2 = imgD_3 + imgD_4;

% Resta
imgRes_1 = imgD_1 - imgD_2;
imgRes_2 = imgD_3 - imgD_4;

% Escalar las imágenes resultantes de suma y resta para que estén en el rango 0-255
imgSum_1 = imgSum_1 / max(imgSum_1(:)) * 255;
imgSum_2 = imgSum_2 / max(imgSum_2(:)) * 255;

imgRes_1 = imgRes_1 / max(abs(imgRes_1(:))) * 255;
imgRes_2 = imgRes_2 / max(abs(imgRes_2(:))) * 255;

% Convertir de nuevo a uint8
imgUin_Mult_1 = uint8(imgMult_1);
imgUin_Mult_2 = uint8(imgMult_2);

imgUin_Div_1 = uint8(imgDiv_1);  
imgUin_Div_2 = uint8(imgDiv_2);

imgUin_Sum_1 = uint8(imgSum_1);
imgUin_Sum_2 = uint8(imgSum_2);

imgUin_Res_1 = uint8(imgRes_1);
imgUin_Res_2 = uint8(imgRes_2);

% ///////////////////////////////////////////////////////////////////////////////////////////
% ---------- Imprimir imagen Número 1
% ///////////////////////////////////////////////////////////////////////////////////////////
figure(1)
subplot(1, 3, 1)
imshow(img_1);
title('Imagen Original 1');

subplot(1, 3, 2)
imshow(img_2);
title('Imagen Original 2');

subplot(1, 3, 3)
imshow(imgUin_Mult_1);
title('Imagen Multiplicada');

figure(2)
subplot(1, 3, 1)
imshow(imgUin_Sum_1);
title('Imagen Suma');

subplot(1, 3, 2)
imshow(imgUin_Res_1);
title('Imagen Resta');

subplot(1, 3, 3)
imshow(imgUin_Div_1);
title('Imagen División');

% ///////////////////////////////////////////////////////////////////////////////////////////
% ---------- Imprimir imagen Número 2
% ///////////////////////////////////////////////////////////////////////////////////////////
figure(3)
subplot(1, 3, 1)
imshow(img_3);
title('Imagen Original 1');

subplot(1, 3, 2)
imshow(img_4);
title('Imagen Original 2 (Redimensionada)');

subplot(1, 3, 3)
imshow(imgUin_Mult_2);
title('Imagen Multiplicada');

figure(4)
subplot(1, 3, 1)
imshow(imgUin_Sum_2);
title('Imagen Suma');

subplot(1, 3, 2)
imshow(imgUin_Res_2);
title('Imagen Resta');

subplot(1, 3, 3)
imshow(imgUin_Div_2);
title('Imagen División');
