% Question 4: Filtering Algorithm with Morphological Operation 
% Perform successive open-close filtering with a series 
% of SEs of increasing size. Three successive open-close will be used.
% DON'T CHANGE VARIABLE NAMES

% Read image rice.png
image4 = imread('rice.png');

% Take a copy of the image for further processing
f = image4;

% Create a 'for' loop with three steps to apply the algorithm.
% The SEs must be of disk shape. 
% The first SE is of 3x3 size, and it increases in the loop with each step 
% Loop with three steps (i.e. loop counter is from 1 to 3 inclusive)

% Start with f, which is 'image4' then update its value in the loop with 
% each step. Also, define the SE inside the loop 
% Add instruction(s) here:  
for k = 1:3
    SE = strel('disk',k);
    f = imopen(f,SE);
    f = imclose(f,SE);
end

% Plotting Results
figure, subplot(1,2,1), imshow(image4), title('Original');
subplot(1,2,2), imshow(f), title('Filtered');
