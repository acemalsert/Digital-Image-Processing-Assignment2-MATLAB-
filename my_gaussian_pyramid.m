function gaussian_pyr = my_gaussian_pyramid(img,levels)

% your code comes here

for i=1:levels
    if i == 1
        gaussian_pyr{i} = impyramid(img,"reduce")
    else    
        gaussian_pyr{i} = impyramid(gaussian_pyr{i-1},"reduce")
    end
    
end