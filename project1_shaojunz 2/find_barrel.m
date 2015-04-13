function [x,y,d] = find_barrel(ori_im,result_im)

close all
result_im = im2bw(result_im);
result_im= 1-result_im;
result_im_fill = imfill(result_im);
result_im_fill=logical(result_im_fill);
STATS = regionprops(result_im_fill, 'all');
area = cat(1, STATS.Area);
extent = cat(1, STATS.Extent);
solidity = cat(1, STATS.Solidity);
centroids = cat(1, STATS.Centroid);
eccentricity = cat(1,STATS.Eccentricity);
imshow(result_im_fill)
hold on
f = area>2000 & extent>0.4 & solidity > 0.5 & eccentricity<0.94;
ff = find(f==1);
[max_ff,fff] = max(solidity(ff));
x = centroids(ff(fff),1);
y = centroids(ff(fff),2);
plot(x, y, 'b*')
d = 600/sqrt(area(ff(fff))); 
