I = imread('C:\Users\Mohammad\Desktop\picture\aaaa.jpg');
rgbImage=im2double(I);
W = input('enter a number W: ');
R_new= input('enter a number R_new: ');
G_new= input('enter a number G_new: ');
B_new= input('enter a number B_new: ');
color_change(rgbImage,W,R_new,G_new,B_new);

function color_change=color_change(rgbImage,W,R_new,G_new,B_new);


imshow(rgbImage);
[column,row] = ginput(1);
column = round(column); 
row = round(row);
hold on;
plot(column,row,'xg','MarkerSize',20,'LineWidth',2);

r = rgbImage(:,:,1); 
r_dou = im2double(r)*255; 
Red   = r_dou(row, column);
g = rgbImage(:,:,2); 
g_dou = im2double(g)*255; 
Green = g_dou(row, column);
b = rgbImage(:,:,3);
b_dou = im2double(b)*255;
Blue  = b_dou(row, column);


r1=Red+W;
r2=Red-W;

g1=Green+W;
g2=Green-W;

b1=Blue+W;
b2=Blue-W;

r_dou( (r_dou < r1) & (r_dou > r2) ) = R_new;

g_dou( (g_dou < g1) & (g_dou > g2) ) = G_new;

b_dou( (b_dou < b1) & (b_dou > b2) ) = B_new;

r=r_dou/255;
g=g_dou/255;
b=b_dou/255;

img12(:,:,1) = uint8(r);
img12(:,:,2) = uint8(g);
img12(:,:,3) = uint8(b);



img15 = cat(3, r, g, b);
figure
imshow(img15);
end