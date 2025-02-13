%load the image
image=imread('Lena.png');
%convert the image to gray scale
gray_image=rgb2gray(image);
%load sobel processed image to sb_image
sb_image=edge(gray_image,"sobel");
%load prewitt processed image to pw_image
pw_image=edge(gray_image,"prewitt");
%set up and display gray image
subplot(3,1,1);
imshow(gray_image);
title('gray image');
%set up and display sobel processed image
subplot(3,1,2);
imshow(sb_image,[]);
title('sobel');
%set up and display prewitt processed image
subplot(3,1,3);
imshow(pw_image,[]);
title('prewitt');
%set up and display montage of sobel+prewitt image
