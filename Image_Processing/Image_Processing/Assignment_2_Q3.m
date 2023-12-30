% Question 3: Image segmentation, edge detection and edge enhancement
clear;
% 1 -Read image building.tif
image = imread('building.tif');
im = image;
% Use Gaussian filtering to the image
im_g = imgaussfilt(image);

% 2 -Detect (segment) straight edges in images
% Canny method extracts the image boundary and returns a binary image (boundary 1, otherwise 0)
% Keep all edges within the edge intensity threshold
thresh = [0.04,0.10];
% Standard deviation of the filter
sigma = 1.49;
im_e = edge(double(im_g),'canny',thresh,sigma);

% Calculate the standard Hough transform of a binary image
% H is the Hough transform matrix, I and R are the angle and radius values for calculating the Hough transform
[H,T,R] = hough(im_e);

% Find the peak of the Hough transform
P = houghpeaks(H,50);
x = T(P(:,2)); 
y = R(P(:,1));

% Extract line segment
lines=houghlines(im_e,T,R,P);

% 3 -Plotting Results
figure, subplot(1,2,1), imshow(image);
title('The Original image');
subplot(1,2,2), imshow(im),hold on;
for k=1:length(lines) 
    xy=[lines(k).point1;lines(k).point2];
plot(xy(:,1),xy(:,2),'Color','red');
end
title('The resulting segmented image');

