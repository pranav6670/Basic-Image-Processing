clc,close,clear all;
 
im1=imread('cameraman.tif');
subplot(121);imshow(im1);title('Orignal Image');
[m,n]=size(im1);%Get image size
mask=[0 1 0;1 -4 1;0 1 0];%Define mask(Laplacian)
im2=double(padarray(im1,[1,1]));


for i=2:m
    for j=2:n
        out(i,j)=im2(i-1,j-1)*mask(1,1)+im2(i-1,j)...
        *mask(1,2)+im2(i-1,j+1)*mask(1,3)+im2(i,j-1)...
        *mask(2,1)+im2(i,j)*mask(2,2)+im2(i,j+1)...
        *mask(2,3)+im2(i+1,j-1)*mask(3,1)+im2(i+1,j)...
        *mask(3,2)+im2(i+1,j+1)*mask(3,3);
    end
end
subplot(122);imshow(uint8(out));title('Sharpened Image');