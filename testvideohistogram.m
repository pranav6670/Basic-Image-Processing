clc,clear,close all;
% Create the webcam object.
cam = webcam();
% Capture one frame to get its size.
videoFrame = snapshot(cam);
[row, col] = size(videoFrame);
x = 0;
while x<=100
    videoFrame = snapshot(cam);
    subplot(121);imshow(videoFrame);impixelinfo;title('Original');
    subplot(122);imhist(videoFrame);title('Histogram');
end
