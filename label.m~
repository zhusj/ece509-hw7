clear all
close all
im = imread('apple.jpg');

apple = roipoly(im);
bg = roipoly(im);
[image_dir, name, exd] = fileparts('apple.jpg');
red_save_name = [name '_red' exd];
yellow_save_name = [name '_yellow' exd];
imwrite(apple, red_save_name);  
imwrite(bg, yellow_save_name);      

