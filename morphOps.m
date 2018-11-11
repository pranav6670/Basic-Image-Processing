clc,clear,close all;
I = imread('circles.png');
[R, C]=size(I);
%% Structing Element
se = [ 1 1 1 ;
       1 1 1 ;
       1 1 1 ];
   
[r, c]=size(se);   
radd = (r-1)/2;
cadd = (c-1)/2;
paddedImage = padarray(I, [radd,cadd], 0);
I = im2double(I);
%% Morphological Operations
for i = 1 + radd : R + radd %Run uptil total rows
    for j = 1 + cadd : C + cadd %Run uptil total columns
        subImage = paddedImage(i - radd : i + radd , j - cadd : j + cadd);
        %%Erosion
        res = bitand(subImage, se);
        if((res - se) == 0)
            eroImage(i - radd, j- cadd) = 1;
        else
            eroImage(i - radd, j- cadd) = 0;
        end
        %%Dilation
        if(sum(sum(res)) > 0)
            dilImage(i - radd, j- cadd) = 1;
        else
            dilImage(i - radd, j- cadd) = 0;
        end
        
    end
end
%% Display
figure;imshowpair(I,uint8(eroImage),'montage');impixelinfo;title("Eroded Image");
figure;imshowpair(I,uint8(dilImage),'montage');impixelinfo;title("Dilated Image");
figure;imshowpair(I,imopen(I,se),'montage');impixelinfo;title("Opened Image");
figure;imshowpair(I,imclose(I,se),'montage');impixelinfo;title("Closed Image");