close all
clear

img1 = double(imread('cat1.jpg'))/255;
figure;imshow(img1);title('img1');

img2 = double(imread('cat2.jpg'))/255;
figure;imshow(img2);title('img2');

mask = ones(size(img1));
mask(:,250:end,:) = 0;
figure;imshow(mask);title('mask');

levels = 80;
comb_recons4 = combine_images(img1,img2,mask,levels);
figure;imshow(comb_recons4);title(['blending result with levels' num2str(levels)]);

imwrite(comb_recons4,'blend_cat_80.png');
