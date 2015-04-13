clear
close all
imgRGB = imread('apple.jpg');
load('w.mat')
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
result(result>0) = 255;
