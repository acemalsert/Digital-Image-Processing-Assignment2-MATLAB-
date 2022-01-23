function lp_comb = combine_laplacian_pyramids(lp1,lp2,gp)

% your code comes here
for i=1:length(gp)
    lp_comb{i} = lp1{i} .* gp{i} + lp2{i} .* (1 - gp{i})
end

end