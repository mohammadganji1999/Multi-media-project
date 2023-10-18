im1=imread('C:\Users\Mohammad\Desktop\picture\Hi.tif');
im2 = imnoise(im1,'salt & pepper',0.02);
MSE_HW(im1,im2);

function  MSE_HW=  MSE_HW(image1, image2);
[M, N] = size(image1);
image1=double(image1);
image2=double(image2);
error = image1 - (image2);
mse = sum(sum(error .* error)) / (M * N);
disp(mse);
end

