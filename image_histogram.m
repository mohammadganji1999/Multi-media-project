image=imread('C:\Users\Mohammad\Desktop\picture\Hi.tif');
hist_cdf(image);

function hist_cdf=hist_cdf(image);
b=size(image);
image=double(image);

h=zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if image(i,j)==k
                h(k+1)=h(k+1)+1;
            end
        end
    end
end

pdf =(1/(b(1)*b(2)))*h;
cdf =zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end

subplot(2,1,1);
plot(h);
title('histogram')
subplot(2,1,2);
plot(cdf);
title('cdf')
end
