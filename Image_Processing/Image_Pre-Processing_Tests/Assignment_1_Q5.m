% Question 5: Histogram Equalisation and Noise Filtering 
% DON'T CHANGE VARIABLE NAMES

% 1- Histogram Equalistion

% Read image coins.png
image5 = imread('coins.png');

% Get the histogram for the image 'image5' and store in the variable 'h1'
% Add instruction(s) here:  
h1= imhist(image5);

% Equalise image 'image5', put the result in 'im5_h'
% Add instruction(s) here:  
im5_h = histeq(image5)   ;

% Get the histogram for the equalised image and store it in 'h2'
h2 = imhist(im5_h);

% Plotting results
figure, subplot(2,2,1), imshow(image5); title('Original');
subplot(2,2,2), plot(h1); title('Hist-Original');
subplot(2,2,3), imshow(im5_h); title('Equalised'); 
subplot(2,2,4), plot(h2); title('Hist-Equalised');

% 2- Median Noise Filtering
% Read image cameraman.tif
image6 = imread('cameraman.tif');

% Add salt and pepper noise with 0.2 strength on the image 'image6' 
% Add instruction(s) here:  
im6_n1 = imnoise(image6,'salt & pepper',0.2); ;

% Add salt and pepper noise with 0.5 strength on the image 'image6'
% Add instruction(s) here: 
im6_n2 = imnoise(image6,'salt & pepper',0.5);  ;

% Use Median Filter with the default 3x3 neighborhood mask and 
% apply it on the two noisy versions of the image
% Add instruction(s) here:  
im6_filt1 = medfilt2(im6_n1);
im6_filt2 = medfilt2(im6_n2);

% Plotting Results
figure, subplot(2,2,1), imshow(im6_n1); title('Image with S-P Noise (0.2)');
subplot(2,2,2), imshow(im6_filt1); title('Median Filtered');
subplot(2,2,3), imshow(im6_n2); title('Image with S-P Noise (0.5)');
subplot(2,2,4), imshow(im6_filt2); title('Median Filtered');