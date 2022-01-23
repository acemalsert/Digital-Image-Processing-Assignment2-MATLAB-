function img = collapse_laplacian_pyramid(laplacian_pyr)

% your code comes here
collapse = laplacian_pyr;
lap_length = length(laplacian_pyr);
for i = lap_length:-1:2
    expanded_image  = impyramid(collapse{i},"expand");
    expanded_size = size(expanded_image);
    collapsed = size(collapse{i-1});

    while~(expanded_size(1) == collapsed(1) && expanded_size(2) == collapsed(2))

        if expanded_size(1)<collapsed(1)
            last_row = expanded_image(end,:,1);
            expanded_image(end+1,:,1) = last_row;

        end

        if expanded_size(2)<collapsed(2)
            last_col = expanded_image(:,end,1);
            expanded_image(:,end+1,1) = last_col;   
        end

        expanded_size = size(expanded_image);
        collapsed = size(collapse{i-1});
    end
    collapse{i-1} = collapse{i-1}+expanded_image;

end
img = collapse{1};
end
