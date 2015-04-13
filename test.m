clear all
close all
imgRGB = imread('apple.jpg');
im_pos = imread('apple_red.jpg');
im_neg = imread('apple_bg.jpg');
pos = im_pos(im_pos==255);
neg = im_neg(im_neg==255);