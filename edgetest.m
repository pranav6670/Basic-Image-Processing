clc, clear, close all;
A = imread('circuit.tif');figure;imshow(A);impixelinfo;title('Original image');
S = edge(A, 'Sobel');figure;imshow(S);impixelinfo;title('Edge by Sobel method');
P = edge(A, 'Prewitt');figure;imshow(P);impixelinfo;title('Edge by Prewitt method');
R = edge(A, 'Roberts');figure;imshow(R);impixelinfo;title('Edge by Roberts method');
l = edge(A, 'log');figure;imshow(l);impixelinfo;title('Edge by log method');
C = edge(A, 'Canny');figure;imshow(C);impixelinfo;title('Edge by Canny method');
c = edge(A, 'approxcanny');figure;imshow(c);impixelinfo;title('Edge by approxcanny method');


