function laplacian_pyr = my_laplacian_pyramid(gaussian_pyr)

gaus_length = length(gaussian_pyr);
for i=1:gaus_length-1
        
        expanded_img = impyramid(gaussian_pyr{i+1},"expand");

        expanded_size = size(expanded_img)
        gaussian_applied_size = size(gaussian_pyr{i})
        
        while~(expanded_size(1) == gaussian_applied_size(1) && expanded_size(2) == gaussian_applied_size(2))
            
            if expanded_size(1)<gaussian_applied_size(1)
                last_row = expanded_img(end,:,1);
                expanded_img(end+1,:,1) = last_row;
            end
            
            if expanded_size(2) < gaussian_applied_size(2)
                last_col  = expanded_img(:,end,1);
                expanded_img(:,end+1,1) = last_col;
            end

            expanded_size = size(expanded_img)
            gaussian_applied_size = size(gaussian_pyr{i})
        end
        laplacian_pyr{i} = gaussian_pyr{i} - expanded_img; % laplacian pyramid applied here
end 
laplacian_pyr{length(gaussian_pyr)} = gaussian_pyr{length(gaussian_pyr)}
end

   