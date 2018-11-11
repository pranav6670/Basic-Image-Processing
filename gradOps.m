clc, close, clear all;
originalImage = imread('circuit.tif');
figure;imshow(originalImage);title('Original Image');

[r,c] = size(originalImage);%Get size of image
mask = [-1 -1 -1;0  0  0;1  1  1]; 
mask(:,:,2)=[-1 0 1;-1 0 1;-1 0 1]; 
mask(:,:,3)=[0 1 1;-1 0 1;-1 -1 0]; 
mask(:,:,4)=[-1 -1 0;-1 0 1;0 1 1];
mask(:,:,5)=[-1 -2 -1;0 0 0;1 2 1]; 
mask(:,:,6)=[-1 0 1;-2 0 2;-1 0 1];
mask(:,:,7)=[0 1 2;-1 0 1;-1 -2 0];
mask(:,:,8)=[-2 -1 0;-1 0 1;0 1 2];

[mskr , mskc] = size(mask(:,:,1));%Getting mask size
rowadd = (mskr - 1)/2;%Row padding
coladd = (mskc - 1)/2;%Column padding

paddedImage = padarray(originalImage,[rowadd,coladd]);%Image and  padding
% figure;imshow(uint8(paddedImage)); title('Padded Image');

%% Convolution
for i = 1 + rowadd : r + rowadd%Run uptil total rows
    for j = 1 + coladd : c + coladd%Run uptil total columns
        for p = 1:8
        subImage = paddedImage(i - rowadd : i + rowadd , j - coladd : j + coladd);
        convSum(p) = sum(sum(double(mask(:,:,p)).*double(subImage)));%2D sum
        result(i, j, p) = convSum(p);
        end
    end
end

%% Show the result
figure;
subplot(221);
imshow(uint8(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd,1)));
title('PH');impixelinfo;
subplot(222);
imshow(uint8(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd,2)));
title('PV');impixelinfo;
subplot(223);
imshow(uint8(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd,3)));
title('P45');impixelinfo;
subplot(224);
imshow(uint8(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd,4)));
title('P-45');impixelinfo;
figure;
subplot(221);
imshow(uint8(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd,5)));
title('SH');impixelinfo;
subplot(222);
imshow(uint8(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd,6)));
title('SV');impixelinfo;
subplot(223);
imshow(uint8(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd,7)));
title('S45');impixelinfo;
subplot(224);
imshow(uint8(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd,8)));
title('S-45');impixelinfo;
%% Get the total edges
figure;
imshow(edge(originalImage));title("total edges");


