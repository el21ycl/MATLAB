% Question 3: Boundary Detection and Skeletonisation using morphological operations
% DON'T CHANGE VARIABLE NAMES

% 1- Boundary Detection 
% Read image cameraman.tif
image1 = imread('cameraman.tif');

% Define the structural element 3x3 cross or '+'
% Add instruction(s) here:
s =  [0 1 0;1 1 1;0 1 0];

% Extract boundary of the image using suitable morphological operation and
% any additional mathematical operation. The output must be in 'bound'

% Add instruction(s) here:

bound = imfilter(image1,s);

% Plotting results
figure, subplot(2,2,1), imshow(image1), title('Original');
subplot(2,2,2), imshow(bound), title('Boundary');

% 2- Skeletonisation
% Read image spine.tif
image2 = imread('spine.tif');

% Find the skeleton of the image 'image2'. Put the result in 'skel'
% Add instruction(s) here:

skel = bwmorph(image2,'skel',Inf);

% Plotting results
subplot(2,2,3), imshow(image2), title('Original');
subplot(2,2,4), imshow(skel), title('Skeleton');
