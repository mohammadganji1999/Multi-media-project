I=imread('C:\Users\Mohammad\Desktop\picture\plane.tif');
J=imread('C:\Users\Mohammad\Desktop\picture\bird.tif');

m = input('enter a number m: ');
n = input('enter a number n: ');
hybrid_H4(I,J,m,n);


function hybrid_H4=hybrid_H4(I,J,m,n);

A = imgaussfilt(I,m);
B = imgaussfilt(J,n);

C = J - B;

D = A + C;

figure
imshow(D)
title('image')

end