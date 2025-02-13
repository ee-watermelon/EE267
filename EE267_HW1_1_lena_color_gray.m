%load Lena image 
im = imread("Lena.png");
%convert loaded lena image to gray color
im2 = rgb2gray(im);
%configure a frame to display first image
subplot(1,2,1); 
%display lena image(color) in frame1
imshow(im, []);
%configure a frame to display second image
subplot(1,2,2);
%display lena image(gray) in frame2
imshow(im2,[]);