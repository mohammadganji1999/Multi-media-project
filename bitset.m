image=imread('C:\Users\Mohammad\Desktop\picture\Hi.tif');
B=imread('C:\Users\Mohammad\Desktop\picture\iut.tif');
hw2_hide(image,B,6);

function [watermarked]= hw2_hide(image,logo,L);
[M,N]=size(image)
logo=imresize(logo,size(image));
K=dither(logo);
figure,imshow(K),title('logo');
for i=1:M
    for j=1:N
        watermarked(i,j)=bitset(image(i,j),L,K(i,j));
    end   
end
b= bitget(image,L);
figure,imshow(watermarked),title('watermarked image');
figure,imshow(b,[]),title('bit-slice L before embedding');
psnr(image,watermarked);
figure,imshow(image), title('orginal image');

MSE_HW(image,watermarked);

end

function  MSE_HW=  MSE_HW(image1, image2);
[M, N] = size(image1);
image1=double(image1);
image2=double(image2);
error = image1 - (image2);
mse = sum(sum(error .* error)) / (M * N);
disp(mse);
end
