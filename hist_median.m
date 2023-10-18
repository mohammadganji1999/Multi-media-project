function hist_median(image,n)
image=double(image);
%because of ambiguity with size of image assign n to u
u=n;
[m,n]=size(image);
histo=zeros(1,256);

for i=1:m
    for j=1:n
        for k=0:255
            if image(i,j)==k
                histo(k+1)=histo(k+1)+1;
            end
        end
    end
end

T=zeros(1,(2^u)-1);
Com=0;

for i=1:256
    Com=Com+histo(i)    ;
   for j=1:2^u-1
       if (j*m*n/2^u-histo(i)<=Com)
           if (j*m*n/2^u+histo(i)>=Com)
               T(j)=i;
           end
       end     
   end

    
end


Final = uint8(zeros(m,n));
T(1,2:2^u)=T(1,1:2^u-1);
T(1,2^u+1)=256;
T(1,1)=0;

for i=1:m
    for j=1:n
        for k=1:2^u
           if image(i,j)<=T(k+1)
               if image(i,j)>=T(k)
                    Final(i,j)=(T(k+1)+T(k))/2;
               end
           end 
        end
        
    end
end


simple = uint8(image);
simple=simple/64;
simple=simple*64;
subplot(2,2,1),imshow(Final),title('median cut');
subplot(2,2,2),imshow(simple),title('/64*64');
subplot(2,2,3),histogram(Final),title('histogram median cut');
subplot(2,2,4),histogram(simple),title('histogram /64*64');


end