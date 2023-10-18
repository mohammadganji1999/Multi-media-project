image=imread('C:\Users\Mohammad\Desktop\picture\Hi.tif');
imshow(image)
title('main image');
Hw4_resize(image);

function  Hw4_resize=  Hw4_resize(image);
image_new1=imresize(image,0.8,'nearest');
image_new1=imresize(image_new1,[450,450]);
figure
imshow(image_new1)
title('nearest');

 MSE_HW(image, image_new1);
%fprintf('\n nearest=> The mean-squared error is %0.4f\n', err1);

image_new2=imresize(image,0.8,'bilinear');
image_new2=imresize(image_new2,[450,450]);
figure
imshow(image_new2)
title('bilinear');
 MSE_HW(image, image_new2);
%fprintf('\n bilinear=> The mean-squared error is %0.4f\n', err2);

image_new3=imresize(image,0.8,'bicubic');
image_new3=imresize(image_new3,[450,450]);
figure
imshow(image_new3)
title('bicubic');
 MSE_HW(image, image_new3);
%fprintf('\n bicubic=> The mean-squared error is %0.4f\n', err3);
end

function  MSE_HW=  MSE_HW(image1, image2);
[M, N] = size(image1);
image1=double(image1);
image2=double(image2);
error = image1 - (image2);
mse = sum(sum(error .* error)) / (M * N);
disp(mse);
end



