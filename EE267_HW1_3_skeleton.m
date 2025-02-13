%step a__read and convert image to grayscale
image = imread('skeleton.jpg');
image_a_u8 = rgb2gray(image);
image_a_dbl = double(image_a_u8);         

%step b__laplacian
laplacian_mask = [0 -1 0; -1 4 -1; 0 -1 0];
image_b_dbl = imfilter(image_a_dbl, laplacian_mask, 'conv');
image_b_u8 = uint8(image_b_dbl);

%step c__gray image from step a + laplacian from step b
image_c_dbl = image_a_dbl + image_b_dbl;
image_c_u8 = uint8(image_c_dbl);

%step d__sobel 
image_d =edge(image_a_u8,"sobel");

%step e__5x5 averaging mask
avg_mask = ones(5,5)/25;                           %create a 5x5 mask
image_e_dbl = conv2(image_d, avg_mask, 'same');

%step f__(image from step c) x (image from step e)
image_f_dbl = image_c_dbl.*image_e_dbl;            %element-wise vector multiplication

%step g__(image from step a) + (image from step f)
image_g_dbl = image_a_dbl + image_f_dbl;

%step h__power-law transformation
gamma = 0.5;
image_h_dbl = real(255*(image_g_dbl/255).^gamma);  %element-wise vector power

%step c__display the original and filtered images
subplot(2, 4, 1); imshow(image_a_dbl, []); title('a. original image');
subplot(2, 4, 2); imshow(image_b_dbl, []); title('b. laplacian');
subplot(2, 4, 3); imshow(image_c_dbl, []); title('c. original + laplacian');
subplot(2, 4, 4); imshow(image_d, []); title('d. sobel');
subplot(2, 4, 5); imshow(image_e_dbl, []); title('e. averging');
subplot(2, 4, 6); imshow(image_f_dbl, []); title('f. image c x image e');
subplot(2, 4, 7); imshow(image_g_dbl, []); title('g. image a + image f');
subplot(2, 4, 8); imshow(image_h_dbl, []); title('h. power-law');