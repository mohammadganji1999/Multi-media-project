image=imread('C:\Users\Mohammad\Desktop\picture\Hi.tif');
figure
imshow(image)
title('main image');
Que1(image);

function  Que1=Que1(image);

%%%%%%%%% horizontal_flip
[x, y, z] =size(image);
B=image;  
for plane = 1: z
    for i = 1 : x
        len = y; 
        for j = 1 : y
    
      
            if j < y/2 
                temp = B(i, j, plane);
                B(i, j, plane) = B(i, len, plane);
                B(i, len, plane) = temp;
                len = len - 1;
            end
        end
    end
end

figure
imshow(B);
title('horizontal flip');
%%%%%%%%%% transpose
B=image;
[M,N,~] = size(image);
for i=1:M
    for j=1:N
        B(i,j,:)=image(j,i,:);
    end
end

figure
imshow(B)
title('transpose  Image')
%%%%%%%%%%crop
[M, N,~] = size(image);
B=image(1+0.25*M:M-0.25*M,1+0.25*N:N-0.25*N);
figure
imshow(B)
title('crop Image')
%%%%%%%%%% right shift image
B=image;
[M, N,~] = size(image);
for i=1:M
    for j=1:N
        if j==N-1
            B(i,1,:)=image(i,j,:);
        elseif j==N
            B(i,2,:)=image(i,j,:);
        else
            B(i,j+2,:)=image(i,j,:);
        end
    end
end

figure
imshow(B)
title('right shift Image')

%%%%%%%%%% left shift image
B=image;
[M, N,~] = size(image);
for i=1:M
    for j=1:N
        if j==1
            B(i,N-1,:)=image(i,j,:);
        elseif j==2
            B(i,N,:)=image(i,j,:);
        else
            B(i,j-2,:)=image(i,j,:);
        end
    end
end

figure
imshow(B)
title('left shift Image')

%%%%%%%%%%% UP shift image
B=image;
[M, N,~] = size(image);
for i=1:M
    for j=1:N
        if i==1
            B(N-1,j,:)=image(i,j,:);
        elseif i==2
            B(N,j,:)=image(i,j,:);
        else
            B(i-2,j,:)=image(i,j,:);
        end
    end
end

figure
imshow(B)
title('UP shift Image')
%%%%%%%%%%% Down shift image
B=image;
[M, N,~] = size(image);
for i=1:M
    for j=1:N
        if i==N-1
            B(1,j,:)=image(i,j,:);
        elseif i==N
            B(2,j,:)=image(i,j,:);
        else
            B(i+2,j,:)=image(i,j,:);
        end
    end
end

figure
imshow(B)
title('Down shift Image')

%%%%%%%%%%%%diagonal up right image
B=image;
[M, N,~] = size(image);
for i=1:M
    for j=1:N
        if j==N-1
            B(i,1,:)=image(i,j,:);
        elseif j==N
            B(i,2,:)=image(i,j,:);
        else
            B(i,j+2,:)=image(i,j,:);
        end
        
    end
end

C=B;

for i=1:M
    for j=1:N
        if i==1
            C(N-1,j,:)=B(i,j,:);
        elseif i==2
            C(N,j,:)=B(i,j,:);
        else
            C(i-2,j,:)=B(i,j,:);
        end
    end
end

figure
imshow(C)
title('Up right shift Image')


%%%%%%%%%%%% diagonal up left image
B=image;
[M, N,~] = size(image);
for i=1:M
    for j=1:N
        if j==1
            B(i,N-1,:)=image(i,j,:);
        elseif j==2
            B(i,N,:)=image(i,j,:);
        else
            B(i,j-2,:)=image(i,j,:);
        end
    end
end

C=B;

for i=1:M
    for j=1:N
        if i==1
            C(N-1,j,:)=B(i,j,:);
        elseif i==2
            C(N,j,:)=B(i,j,:);
        else
            C(i-2,j,:)=B(i,j,:);
        end
    end
end

figure
imshow(C)
title('Up left shift Image')
%%%%%%%%%%%% diagonal down rihgt image
B=image;
[M, N,~] = size(image);
for i=1:M
    for j=1:N
        if j==N-1
            B(i,1,:)=image(i,j,:);
        elseif j==N
            B(i,2,:)=image(i,j,:);
        else
            B(i,j+2,:)=image(i,j,:);
        end
        
    end
end

C=B;

for i=1:M
    for j=1:N
        if i==N-1
            C(1,j,:)=B(i,j,:);
        elseif i==N
            C(2,j,:)=B(i,j,:);
        else
            C(i+2,j,:)=B(i,j,:);
        end
    end
end

figure
imshow(C)
title('down right shift Image')
%%%%%%%%%%%% diagonal down left image
B=image;
[M, N,~] = size(image);
for i=1:M
    for j=1:N
        if j==1
            B(i,N-1,:)=image(i,j,:);
        elseif j==2
            B(i,N,:)=image(i,j,:);
        else
            B(i,j-2,:)=image(i,j,:);
        end
    end
end

C=B;

for i=1:M
    for j=1:N
        if i==N-1
            C(1,j,:)=B(i,j,:);
        elseif i==N
            C(2,j,:)=B(i,j,:);
        else
            C(i+2,j,:)=B(i,j,:);
        end
    end
end

figure
imshow(C)
title('down left shift Image')


end