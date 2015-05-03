clear all
close all
im = imread('image/hand.jpg');
Ncol = size(im,2);
Nrow = size(im,1);
bg_num = 4;
apple = roipoly(im);
[image_dir, name, exd] = fileparts('hand.jpg');
red_save_name = [name '_hand' exd];
imwrite(apple, red_save_name); 
bg_t = zeros(Nrow, Ncol);
for i = 1:bg_num
    bg{i} = roipoly(im); 
    bg_t = bg_t + bg{i};
end

bg_save_name = [name '_bg' exd];
imwrite(bg_t, bg_save_name);  

 
 

