clear all
close all
im = imread('image/apple2.jpeg');

apple = roipoly(im);
bg = roipoly(im);
[image_dir, name, exd] = fileparts('apple2.jpg');
red_save_name = [name '_apple' exd];
yellow_save_name = [name '_bg' exd];
imwrite(apple, red_save_name);  
imwrite(bg, yellow_save_name);      

