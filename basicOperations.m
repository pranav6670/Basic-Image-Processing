%%Acquiring images
clc, clear, close all;
A = imread('14.bmp');figure;imshow(A);impixelinfo;
B = imread('rice.png');figure;imshow(B);impixelinfo;
C = imadd(A, B);figure;imshow(C);impixelinfo;
D = imsubtract(A, B);figure;imshow(D);impixelinfo;
E = immultiply(A, B);figure;imshow(E);impixelinfo;
F = imdivide(B, A);figure;imshow(F);impixelinfo;
[r, c] = size(A);
M = zeros(r,c);
for i = 100 : 199
    for j = 100 : 199
        M(i,j) = 255;
    end
end
figure;imshow(uint8(M));impixelinfo;

and = bitand(double(A),double(B));figure;imshow(uint8(and));impixelinfo;
and1 = bitand(double(A),M);figure;imshow(uint8(and1));impixelinfo;
and2 = bitand(double(B),M);figure;imshow(uint8(and2));impixelinfo;

or = bitor(double(A),double(B));figure;imshow(uint8(or));impixelinfo;
or1 = bitor(double(A),M);figure;imshow(uint8(or1));impixelinfo;
or2 = bitor(double(B),M);figure;imshow(uint8(or2));impixelinfo;



