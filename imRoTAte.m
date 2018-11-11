clc,clear,close all;
image=imread('cameraman.tif');
figure;subplot(121);imshow(image);
%image padding
[Rows, Cols] = size(image); %Get the size of image
Diagonal = sqrt(Rows^2 + Cols^2); %To access diagonals
RowPad = ceil(Diagonal - Rows) + 2; %Padding rows
ColPad = ceil(Diagonal - Cols) + 2; %Padding columnss
imagepad = zeros(Rows+RowPad, Cols+ColPad);
imagepad(ceil(RowPad/2):(ceil(RowPad/2)+Rows-1),ceil(ColPad/2):(ceil(ColPad/2)+Cols-1)) = image;

degree=input('Enter the angle of rotation');

%midpoints
midx=ceil((size(imagepad,1)+1)/2); %Get midpoint x coordinate
midy=ceil((size(imagepad,2)+1)/2); %Get midpoint y coordinate

imagerot=zeros(size(imagepad)); %Create new image

%rotation
for i=1:size(imagepad,1)
    for j=1:size(imagepad,2)

         x=(i-midx)*cos(degree)-(j-midy)*sin(degree);
         y=(i-midx)*sin(degree)+(j-midy)*cos(degree);
         x=round(x)+midx;
         y=round(y)+midy;

         if (x>=1 && y>=1)
              imagerot(x,y)=imagepad(i,j); % k degrees rotated image         
         end

    end
end
subplot(122),imagesc(imagerot);
colormap(gray(256));%Colormap to preserve color