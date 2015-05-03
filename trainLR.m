clear
close all
imgRGB = imread('image/hand.jpg');
siz = size(imgRGB);
im_pos = im2bw(imread('hand_hand.jpg'));
im_neg = im2bw(imread('hand_bg.jpg'));
im_pos_mask = zeros(siz);
im_neg_mask = zeros(siz);
center = siz/2;
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
A_dim = 5;
pos_dist = [(pos_x - center(1))/center(1), (pos_y - center(2))/center(2)];
pos_norm = sqrt(pos_dist(:,1).^2 + pos_dist(:,2).^2)*255;
neg_dist = [(neg_x - center(1))/center(1), (neg_y - center(2))/center(2)];
neg_norm = sqrt(neg_dist(:,1).^2 + neg_dist(:,2).^2)*255;
%A = [[pos_RGB, pos_norm];[neg_RGB, neg_norm]];
 A = [[pos_RGB, pos_x, pos_y];[neg_RGB, neg_x, neg_y]];
% A = [pos_RGB;neg_RGB];

b = ones(length(A), 1);
Y = [ones(length(pos),A_dim);-zeros(length(neg),A_dim)];
% Y = [ones(length(pos),1);-ones(length(neg),1)];

u_dim = length(pos_x);
v_dim = length(neg_x);
lambda = 0.1;
U = [ones(length(A), A_dim) u];

cvx_begin
    variables x(2,5)
    maximize(y'*U*x-sum(log_sum_exp([zeros(1,m); x'*U'])))
cvx_end
save('w.mat', 'w')