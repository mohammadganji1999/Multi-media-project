image=imread('C:\Users\Mohammad\Desktop\picture\Hi.tif');

hw2_histeq(image);

function hw2_histeq=hw2_histeq(image);
image=double(image);
b=size(image);
hist1=zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if image(i,j)==k
                hist1(k+1)=hist1(k+1)+1;
            end
        end
    end
end

pdf =(1/(b(1)*b(2)))*hist1;
cdf =zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end
cdf=round(255*cdf);


ep=zeros(b);
for i=1:b(1)
    for j=1:b(2)
        t=(image(i,j)+1);
        ep(i,j)=cdf(t);
    end    
end

hist2=zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if ep(i,j)==k
                hist2(k+1)=hist2(k+1)+1;
            end
        end
    end
end

subplot(2,2,1);
imshow(uint8(image));
subplot(2,2,3);
imshow(uint8(ep));
subplot(2,2,2);
plot(hist1);
title('histogram')
subplot(2,2,4);
plot(hist2);
title('histogram equalization')
end
