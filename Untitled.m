img1 = im2double(rgb2gray(imread('onion.png')));

hbm = vision.BlockMatcher('ReferenceFrameSource',...
        'Input port','BlockSize',[35 35]);
hbm.OutputValue = 'Horizontal and vertical components in complex form';
halphablend = vision.AlphaBlender;

img2 = imtranslate(img1,[15,15]);

motion = step(hbm,img1,img2);

img12 = step(halphablend,img2,img1);

[X Y] = meshgrid(1:35:size(img1,2),1:35:size(img1,1));         
imshow(img12); 
hold on;
quiver(X(:),Y(:),real(motion(:)),imag(motion(:)),0); 
hold off;