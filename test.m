clear
close all
imgRGB = imread('image/apple4.jpg');
load('w/w2.mat')
siz = size(imgRGB);
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
A = [Rv Gv Bv Xv Yv];
Yt = double(A)*w;
result = reshape(Yt, siz(2), siz(1));
result = result';
result(result<0) = 0;
result(result>1) = 255;
subplot(1,2,1)
imshow(imgRGB)
subplot(1,2,2)
imshow(uint8(result))
