close all
clear

img = double(imread('sneaker2.jpg'))/255;
figure;imshow(img);title('input');

gaussian_pyr = my_gaussian_pyramid(img,4);
laplacian_pyr = my_laplacian_pyramid(gaussian_pyr);
img_recons = collapse_laplacian_pyramid(laplacian_pyr);
figure;imshow(img_recons);title('reconstructed');

%max(max(max(abs(img_recons-img))))
imwrite(img_recons,"sneaker2_reconstructed.jpg")