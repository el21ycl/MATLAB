% Question 1: Image Noise Filtering

% Read image bone.tif
image = imread('cameraman.tif');
colormap(gray);


subplot(2,3,1),
% Use display image with scaled colors command (not 'imshow'). Put title 'Original'
% Add instruction(s) here: 
imagesc(image);
title('Original');
% 1 - Image Thresholding Test
% Determine automatic threshold value 'thresh' by MATLAB itself, then use this threshold 
% value to get the threshold image 'thresh_image'

% Add instruction(s) here: 
thresh =  graythresh(image)  ;
thresh_image = im2bw(image,thresh) ;

subplot(2,3,2), 
% Use display image with scaled colors command (not 'imshow'). Put title 'Threshold'
% Add instruction(s) here: 
imagesc(thresh_image);
title('Threshold');
% 2 - Image Background Removal Test
% Remove image background by calculating image mean 'average_image' then  
% subtract it from the original image 'image' to get 'bgremove_image'
% Add instruction(s) here: 
average_image =   mean2(image)  ;
bgremove_image = imsubtract(image,average_image)   ;

subplot(2,3,3), 
% Use display image with scaled colors command (not 'imshow'). Put title 'Bg remove'
% Add instruction(s) here:
imagesc(bgremove_image);
title('Bg remove'); 
% 3 - Image Hilbert Transform Test
% Apply Hilbert transform on the image 'image' to get 'hilb_image'
% Note: Hilbert transform generates complex numbers outputs

% Add instruction(s) here:    
hilb_image =  hilbert(image)  ;

subplot(2,3,4), 
% Use display image with scaled colors command (not 'imshow'). Put title 'Hilbert'
% Add instruction(s) here:
imagesc(imag(hilb_image));     
title('Hilbert')    
% 4 - Image Natural Log Test
% Apply Natural Log function on the image 'image' to get 'ln_image' 
% Note: You need to use mat2gray to convert the format of the image first
% Also, change negative values to positive for display purposes
% Add instruction(s) here:        
ln_image = log(mat2gray(image)) ;

subplot(2,3,5), 
% Use display image with scaled colors command (not 'imshow'). Put title as 'Natural Log'
% Add instruction(s) here:
imagesc(ln_image);
title('Natural Log');
% 5 - Image standard deviation Test
% Apply standard deviation filter on the image 'image' to get 'std_image'
% Add instruction(s) here: 
std_image =  stdfilt(image)   ;

subplot(2,3,6), 
% Use display image with scaled colors command (not 'imshow'). Put title as 'Std Dev'
% Add instruction(s) here:
imagesc(std_image);
title('Std Dev');