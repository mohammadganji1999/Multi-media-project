A = imread('C:\Users\Mohammad\Desktop\picture\Hi.tif');
B=A-20;
figure
imshow(B)
title('low Image')
MSE_HW(A,B);

C=A;
[M, N,~] = size(A);
for i=1:M
    for j=1:N
        if j==N-1
            C(i,1,:)=A(i,j,:);
        elseif j==N
            C(i,2,:)=A(i,j,:);
        else
            C(i,j+2,:)=A(i,j,:);
        end
    end
end

D=A;
[M, N,~] = size(A);
for i=1:M
    for j=1:N
        if j==1
            D(i,N-1,:)=A(i,j,:);
        elseif j==2
            D(i,N,:)=A(i,j,:);
        else
            D(i,j-2,:)=A(i,j,:);
        end
    end
end

A=double(A);
C=double(C);
D=double(D);

mean_image=(A+C+D)/3;

MSE_HW(A,mean_image);


function  MSE_HW=  MSE_HW(image1, image2);
[M, N] = size(image1);
image1=double(image1);
image2=double(image2);
error = image1 - (image2);
mse = sum(sum(error .* error)) / (M * N);
disp(mse);
end