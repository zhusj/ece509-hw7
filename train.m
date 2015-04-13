clear
close all
imgRGB = imread('apple.jpg');
siz = size(imgRGB);
im_pos = im2bw(imread('apple_red.jpg'));
im_neg = im2bw(imread('apple_bg.jpg'));
im_pos_mask = zeros(siz);
im_neg_mask = zeros(siz);
for i =1:3
    im_pos_mask(:,:,i) = im_pos;
    im_neg_mask(:,:,i) = im_neg;
end
im_pos_RGB = double(imgRGB).*im_pos_mask;
im_neg_RGB = double(imgRGB).*im_neg_mask;
pos = find(im_pos==1);
neg = find(im_neg==1);
[pos_x, pos_y] = ind2sub(siz(1:2), pos);
[neg_x, neg_y] = ind2sub(siz(1:2), neg);
for i =1:3
    temp_pos = im_pos_RGB(:,:,i);
    temp_neg = im_neg_RGB(:,:,i);
    pos_RGB(:,i) = temp_pos(pos);
    neg_RGB(:,i) = temp_neg(neg);
end
A = [[pos_RGB, pos_x, pos_y];[neg_RGB, neg_x, neg_y]];
b = ones(length(A), 1);
Y = [ones(length(pos),5);-ones(length(neg),5)];

cvx_begin
    variable w(5)
    minimize norm(w)
    subject to
    (Y.*A)*w >= b;
cvx_end