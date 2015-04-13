clear all
close all

img_dir = 'C:\Users\zsj\Desktop\2013 spring\ESE650\project1\project1\project1_data\train\';
save_dir = 'C:\Users\zsj\Desktop\2013 spring\ESE650\project1\project1\project1_data\train\test_result_rgb\';

load('model_calibrate_hsv.mat');
dirstruct = dir([img_dir,'*.png']);

for i = 1:length(dirstruct),
    % Current test image
    imgFileName = [img_dir dirstruct(i).name];    
    imgRGB=imread(imgFileName);
    imgHSV = colorspace( 'RGB->HSV',imgRGB);
    hsv_image = rgb2hsv(imgRGB);
%     imgLab = colorspace( 'RGB->Lab',imgRGB);
%     imgycbcr = rgb2ycbcr(imgRGB);
    % Your computations here!
    [x, y, d] = predict(imgHSV, model);
    % Display results:
    hf = figure(1);
    image(imgRGB);
    hold on;
    plot(x, y, 'g+');
    title(sprintf('Barrel distance: %.1f m', d));
    % You may also want to plot and display other
    % diagnostic information such as the outlines
    % of connected regions, etc.
    hold off;
    pause;
end