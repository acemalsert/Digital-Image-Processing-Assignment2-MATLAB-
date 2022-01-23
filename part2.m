close all
clear

img = double(imread('cat2.jpg'))/255;
figure;imshow(img);title('input');

gaussian_pyr = my_gaussian_pyramid(img,4);
laplacian_pyr = my_laplacian_pyramid(gaussian_pyr);

for i = 1:length(gaussian_pyr)
    figure;imshow(abs(laplacian_pyr{i}));title(['laplacian level ' num2str(i)]);
end

 for i = 1:length(laplacian_pyr)
     imwrite(abs(laplacian_pyr{i}),['cat2_lp' num2str(i) '.png']);
 end

 save('cat2_laplacian_pyramid_4.mat','laplacian_pyr');
