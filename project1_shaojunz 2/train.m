clear all
close all
img_dir = 'C:\Users\zsj\Desktop\2013 spring\ESE650\project1\project1\project1_data\calibrate\';
save_dir = 'C:\Users\zsj\Desktop\2013 spring\ESE650\project1\project1\project1_data\calibrate\label_result\';

img_list = dir([img_dir,'*.png']);
X=double.empty(3,0);
Y=[];
patchWidth = 10; %%patch size

for cnt=1:size(img_list,1)
    imgFileName = [img_dir img_list(cnt).name];    
    imgRGB=imread(imgFileName);
%     imgHSV = colorspace( 'RGB->HSV',imgRGB);
%     imgLab = colorspace( 'RGB->Lab',imgRGB);
%     imgycbcr = rgb2ycbcr(imgRGB);
%     im = rgb2ycbcr(im);
%     im = colorspace( 'RGB->Lab',im);
    im = colorspace( 'RGB->HSV',imgRGB);
%     im = cat(3,imgRGB,imgHSV,imgLab,imgycbcr);
    Ncol = size(im,2);
    Nrow = size(im,1);
    X1 = reshape(im(:),Ncol*Nrow,[]);
    X1 = double(X1');
    X = [X,X1];
    [image_dir, name, exd] = fileparts(imgFileName);
    red_save_name = [save_dir name '_red' exd];
    l1=imread(red_save_name);
    k1 = double(l1);k1(k1==1)=1;
    Y1 = reshape(k1(:),Ncol*Nrow,[]);
    
    yellow_save_name = [save_dir name '_yellow' exd];
    l2=imread(yellow_save_name);
    k2 = double(l2);
    k2(k2==1)=2;
    Y2 = reshape(k2(:),Ncol*Nrow,[]);

    Yt = Y1+Y2;
    Yt = Yt';
    Yt (Yt==0)=3;
    Y = [Y,Yt];
end

[model] = mle(X, Y);