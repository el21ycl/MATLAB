% Question 2: Image Enhancement with histogram equalisation
clear;
% 1 -Read image board.tif
image = imread('board.tif');

% 2 -Convert the image from RGB to a format that separates intensity values from color components
% Convert RGB image to yCbcr image
% Extract y, cb and cr image components
 ycc = rgb2ycbcr(image);
 y = ycc(:, :, 1);
 cb = ycc(:, :, 2); 
 cr = ycc(:, :, 3); 
 
% 3 -Histogram equalization of the converted image
% Perform histogram equalization on the intensity plane y
h_y = histeq(y);
% Combine h_y, cb and cr components into an RGB image
h_ycc = cat(3,h_y,cb,cr);

% 4 -Convert the generated image back to RGB
RGB = ycbcr2rgb(h_ycc);

% 5 -Plotting Results
figure, subplot(2,2,1), imshow(image); title('The Original image');
subplot(2,2,2), imshow(ycc); title('The converted image');
subplot(2,2,3), imshow(h_ycc); title('Histogram-equalised image');
subplot(2,2,4), imshow(RGB); title('The rsultant RGB image');