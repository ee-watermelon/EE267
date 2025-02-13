%load the image
image = imread('Lena.png');
%convert the image to gray scale
gray_image = rgb2gray(image);
%horizontal edges
cxMask = [-1 0 1; -2 0 2; -1 0 1];
%vertical edges
cyMask = [-1 -2 -1; 0 0 0; 1 2 1];
%horizontal convolution
cx_image = conv2(double(gray_image), cxMask, 'same');
%vertical convolution
cy_image = conv2(double(gray_image), cyMask, 'same');
%square root of the masked image
edge_mag = sqrt(cx_image.^2 + cy_image.^2);
%convert square rooted value to binary (0:black, 1:white)
magnitude = mat2gray(edge_mag);
%set threshold for detection
threshold = 0.2;
edges = magnitude > threshold;
%display original gray image
subplot(1,2,1);
imshow(gray_image);
title('gray image');
%display detection image
subplot(1,2,2);
imshow(edges);
title('Edge detection using conv2');