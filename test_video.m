clc,clear,close all;
% Create the webcam object.
cam = webcam();
% Capture one frame to get its size.
videoFrame = snapshot(cam);
frameSize = size(videoFrame);
x = 0;
while x<=100
    videoFrame = snapshot(cam);
    subplot(331);imshow(videoFrame);impixelinfo;title('Original');
    subplot(332);imshow(videoFrame(:,:,1));impixelinfo;title('R plane');
    subplot(333);imshow(videoFrame(:,:,2));impixelinfo;title('G plane');
    subplot(334);imshow(videoFrame(:,:,3));impixelinfo;title('B plane');
    %%Get RGB values
    R = double(videoFrame(:,:,1));
    B = double(videoFrame(:,:,2));
    G = double(videoFrame(:,:,3));
    %%Find YIQ values
    Y = 0.299 * R + 0.587 * G + 0.114 * B;subplot(335);imshow(uint8(Y));impixelinfo;title('Y plane');
    I = 0.596 * R - 0.274 * G - 0.322 * B;subplot(336);imshow(uint8(I));impixelinfo;title('I plane');
    Q = 0.211 * R - 0.523 * G + 0.312 * B;subplot(337);imshow(uint8(Q));impixelinfo;title('Q plane');
    %%Concatenate
    C = cat(3, Y, I, Q); subplot(338);imshow(uint8(C));impixelinfo;title('Concatenated YIQ image');
    %%Find RGB values
    r = double(1.000 * Y + 0.956 * I + 0.621 * Q);
    g = double(1.000 * Y - 0.272 * I - 0.647 * Q);
    b = double(1.000 * Y - 1.106 * I + 1.706 * Q);
    %%Concatenate
    c = cat(3, r, g, b); subplot(339);imshow(uint8(c));impixelinfo;title('Concatenated RGB image');
end
