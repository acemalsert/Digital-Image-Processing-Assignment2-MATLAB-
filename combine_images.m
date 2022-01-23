function comb_recons = combine_images(img1,img2,mask,levels)

% your code comes here
gaussian_pyr1 = my_gaussian_pyramid(img1,levels);
gaussian_pyr2 = my_gaussian_pyramid(img2,levels);
lp1 = my_laplacian_pyramid(gaussian_pyr1);
lp2 = my_laplacian_pyramid(gaussian_pyr2);
gp = my_gaussian_pyramid(mask,levels);
resultimg = combine_laplacian_pyramids(lp1,lp2,gp);
comb_recons = collapse_laplacian_pyramid(resultimg);

end