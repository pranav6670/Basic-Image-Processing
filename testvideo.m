clc,clear,close all;

v = VideoReader('xylophone.mpg');
H = v.Height;
W = v.Width;

counter = 1;
frame = struct('cdata',zeros(H,W,'uint8'));
while hasFrame(v)
    frame(counter).cdata = readFrame(v);
    counter = counter + 1;
end

figure;imshow(frame(1).cdata);title("Frame no. 1");
figure;imshow(frame(100).cdata);title("Frame no. 100");

img1 = im2double(rgb2gray(frame(1).cdata));
img2= im2double(rgb2gray(frame(10).cdata));

hbm = vision.BlockMatcher('ReferenceFrameSource',...
        'Input port','BlockSize',[35 35]);
hbm.OutputValue = 'Horizontal and vertical components in complex form';
halphablend = vision.AlphaBlender;

motion = step(hbm,img1,img2);

img12 = step(halphablend,img2,img1);
figure;
[X, Y] = meshgrid(1:35:size(img1,2),1:35:size(img1,1));         
imshow(img12);title("Block matcher O/P");
hold on;
quiver(X(:),Y(:),real(motion(:)),imag(motion(:)),0); 
hold off;
