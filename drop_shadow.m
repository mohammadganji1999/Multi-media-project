I = imread('C:\Users\Mohammad\Desktop\picture\Untitled-2.tif');

s = input('enter a number s: ');
d = input('enter a number d: ');
H4_Shadow(I,s,d);


function H4_Shadow=H4_Shadow(im,s,d);
figure
imshow(im)
title('orginal')


B=im;
[M, N,~] = size(im);
Z=N-s;
Y=M-s;
f=1;
for i=1:M
    for j=1:N
        if j > Z
            B(i,j-Z,:)=im(i,j,:);
        else
            B(i,j+s,:)=im(i,j,:);
        end
    end
end    

C=B;

for i=1:M
    for j=1:N
        if i > Y
            C(i-Y,j,:)=B(i,j,:);
        else
            C(i+s,j,:)=B(i,j,:);
        end
    end
end



figure
imshow(C)
title('transport')

shadow1 = imgaussfilt(C,d);


figure
imshow(shadow1)
title('shadow')

im3= uint8(.5 * double(im) + 0.5 * double(shadow1));

figure
imshow(im3)
title('shadow image')

end
