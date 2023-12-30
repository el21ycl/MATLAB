% Question 1: Image Noise Filtering
clear;
% Read image cameraman.tif
image = imread('cameraman.tif');

% Convert uint8 type to double type, otherwise the statistics cannot be calculated
im = im2double(image);

% 1 -Add 'Poisson' noise on the image 'image'  
im_np = imnoise(image,'poisson');

% Convert uint8 type to double type, otherwise the statistics cannot be calculated
d_np = im2double(im_np);

% 2 -Calculate the signal-to-noise ratio (SNR) of the noisy image in dB
% The signal-to-noise ratio (SNR) of the image is divided by the variance of the original image by the variance of the noise
% Image with only noise part
noise_im_np = imsubtract(d_np,im);

% Find the image mean
avg_im = mean2(im);

[m,n] = size(im);

% Find the sum of squares of all pixels and the mean
s_im = 0;
for x = 1:m
 for y = 1:n    
   s_im = s_im + (im(x,y)-avg_im)^2;
 end
end

% Find the variance of the original image
v_im = s_im/(m*n);

% Find the noise mean
avg_np = mean2(noise_im_np);

[m,n] = size(noise_im_np);

% Find the sum of squares of all pixels and the mean
s_np = 0;
for x = 1:m
 for y = 1:n    
   s_np = s_np + (noise_im_np(x,y)-avg_np)^2;
 end
end

% Find the variance of the noise
v_np = s_np/(m*n);

% Find the signal-to-noise ratio (SNR) of the noise image
SNR_np = 10*log10(double(v_im/v_np));

% 3 -Use Gaussian filtering to denoise the image
im_g = imgaussfilt(im_np);

% Convert uint8 type to double type, otherwise the statistics cannot be calculated
d_g = im2double(im_g);

% Image with only noise part
noise_im_g = imsubtract(d_g,im);

% Find the noise mean
avg_g = mean2(noise_im_g);

[m,n] = size(noise_im_g);

% Find the sum of squares of all pixels and the mean
s_g = 0;
for x = 1:m
 for y = 1:n    
   s_g = s_g + (noise_im_g(x,y)-avg_g)^2;
 end
end

% Find the variance of the noise
v_g = s_g/(m*n);

% Find the signal-to-noise ratio (SNR) of the noise image
SNR_g = 10*log10(double(v_im/v_g));

% 4 -Use Wiener filter to denoise the image
im_w = wiener2(im_np,[3,3]);

% Convert uint8 type to double type, otherwise the statistics cannot be calculated
d_w = im2double(im_w);

% Image with only noise part
noise_im_w = imsubtract(d_w,im);

% Find the noise mean
avg_w = mean2(noise_im_w);

[m,n] = size(noise_im_w);

% Find the sum of squares of all pixels and the mean
s_w = 0;
for x = 1:m
 for y = 1:n    
   s_w = s_w + (noise_im_w(x,y)-avg_w)^2;
 end
end

% Find the variance of the noise
v_w = s_w/(m*n);

% Find the signal-to-noise ratio (SNR) of the noise image
SNR_w = 10*log10(double(v_im/v_w));

% 5 -Plotting Results
figure, subplot(2,2,1), imshow(image); title('Original');
subplot(2,2,2), imshow(im_np); title(['Noisy, SNR = ',num2str(SNR_np,3),' dB']);
subplot(2,2,3), imshow(im_g); title(['Gaussian, SNR = ',num2str(SNR_g,3),' dB']);
subplot(2,2,4), imshow(im_w); title(['Wiener, SNR = ',num2str(SNR_w,3),' dB']);





