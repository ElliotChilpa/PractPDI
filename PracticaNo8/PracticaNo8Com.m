clc;
clear all;
close all;

img_1 = imread('lapras.jpg');
img_2 = imread('planta.jpg');


result_imadd_1 = img_1;
result_imfuse_1 = img_1;
result_blend_1 = img_1;

result_imadd_2 = img_2;
result_imfuse_2 = img_2;
result_blend_2 = img_2;

% De 1 a 5 grados
for angulo = 1:5
    % Rotar la imagen
    img_rot_1 = imrotate(img_1, angulo, 'bilinear', 'crop');
    img_rot_2 = imrotate(img_2, angulo, 'bilinear', 'crop');
    
    % Suma usando imadd
    result_imadd_1 = imadd(result_imadd_1, img_rot_1);
    result_imadd_2 = imadd(result_imadd_2, img_rot_2);

    % Suma usando imfuse
    fused_img_1 = imfuse(result_imfuse_1, img_rot_1);
    result_imfuse_1 = fused_img_1;
    
    fused_img_2 = imfuse(result_imfuse_2, img_rot_2);
    result_imfuse_2 = fused_img_2;

    % Suma usando imfuse con blend
    fused_img_blend_1 = imfuse(result_blend_1, img_rot_1, 'blend');
    result_blend_1 = fused_img_blend_1;

    fused_img_blend_2 = imfuse(result_blend_2, img_rot_2, 'blend');
    result_blend_2 = fused_img_blend_2;
end

% Mostrar los resultados
figure;
subplot(1,3,1);
imshow(result_imadd_1);
title('Suma con imadd');

subplot(1,3,2);
imshow(result_imfuse_1);
title('Suma con imfuse (default)');

subplot(1,3,3);
imshow(result_blend_1);
title('Suma con imfuse (blend)');

% Mostrar los resultados
figure;
subplot(1,3,1);
imshow(result_imadd_2);
title('Suma con imadd');

subplot(1,3,2);
imshow(result_imfuse_2);
title('Suma con imfuse (default)');

subplot(1,3,3);
imshow(result_blend_2);
title('Suma con imfuse (blend)');
