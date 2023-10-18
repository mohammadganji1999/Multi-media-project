
I = imread('C:\Users\Mohammad\Desktop\picture\Hi.tif');

k = input('enter a number K: ');
t = input('enter a number t: ');
hw3_DCT(I,k,t);


function hw3_DCT=hw3_DCT(I,k,t);
[x,y]=size(I);
for i=1:x
    if (i*k)>=x
        x2=i*k;
        break
    end
end

for i=1:y
    if (i*k)>=y
        y2=i*k;
        break
    end
end
r1=x2-x;
r2=y2-y;

J = imresize(I,[x+r1 y+r2]);
figure
imshow(J);
title('first image');
J1=J;
[m,n] = size(J);
Blocks = cell(m/k,n/k);
C=zeros(k,k);
count=0;
h=1;
counti = 0;
for i = 1:k:m-(k-1)
    counti = counti + 1;
    countj = 0;
    for j = 1:k:n-(k-1)
        countj = countj + 1;
        Blocks{counti,countj} = J(i:i+(k-1),j:j+(k-1));
        C=dct2(double(Blocks{counti,countj}));
        C(abs(C) < t)=0;
   
        D = idct2(C);
        Blocks{counti, countj} = D;
        h=h+1;
    end
end


ci=0;
for i = 1:k:m-(k-1)
    ci = ci + 1;
    cj = 0;
    for j = 1:k:n-(k-1)
        cj = cj + 1;
        J(i:i+(k-1),j:j+(k-1))=Blocks{ci,cj};
    end
end

J2=J;

figure
imshow(J2);
title('recunstruct image');


S_psnr = psnr(J1, J2);
disp(S_psnr);

diff = abs(J1 - J2);
figure
imshow(diff);
title('differnce of images');

for i = 1:k
    for j = 1:k
        if C(i,j)==0
            count=count+1;
        end    
    end
end

disp((count/(m*n))*100);
end

 


