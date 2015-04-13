function [x, y, d] = predict(test_im, model)

%     test_im = rgb2ycbcr(test_im);
%     test_im = rgb2hsv(test_im);
Ncol = size(test_im,2);
Nrow = size(test_im,1);
X1 = reshape(test_im(:),Ncol*Nrow,[]);
X1 = double(X1');
[R] = estep(X1, model);
[result,index] = max(R,[],2);
%     saliencyMap = ComputeSalMap(index, Nrow, Ncol, patchWidth);
result_im = reshape(index,Nrow,Ncol);
result_im(result_im==1)=0;
[x,y,d] = find_barrel(test_im,result_im);

%     [image_dir, name, exd] = fileparts(imgFileName);
%     test_save_name = [save_dir name '_test' exd];
%     imwrite(result_im, test_save_name);  
