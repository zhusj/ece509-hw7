clear
% close all
imgRGB = imread('image/apple2.jpeg');
% load('w/new_w2_with_xy.mat')
load('w.mat')
siz = size(imgRGB);
center = siz/2;
[X,Y] = meshgrid(1:siz(1),1:siz(2));
Xv = X(:);
Yv = Y(:);
R = imgRGB(:,:,1);
G = imgRGB(:,:,2);
B = imgRGB(:,:,3);
R = R';
Rv = R(:);
G = G';
Gv = G(:);
B = B';
Bv = B(:);
dist = [(Xv - center(1))/center(1), (Yv - center(2))/center(2)];
norm = sqrt(dist(:,1).^2 + dist(:,2).^2)*255;
A = [Rv Gv Bv norm];
% A = [Rv Gv Bv Xv Yv];
% A = [Rv Gv Bv];
Yt = double(A)*w;
result = reshape(Yt, siz(2), siz(1));
result = result';
threshold = 0;
result(result>threshold) = 255;
result(result<=threshold) = 0;
% result(result>threshold) = 255;
figure
subplot(1,2,1)
imshow(imgRGB)
subplot(1,2,2)
imshow(uint8(result))
