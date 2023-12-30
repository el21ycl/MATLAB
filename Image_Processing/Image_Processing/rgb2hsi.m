function hsi = rgb2hsi(image)
% Extract R, G and B image components
 rgb = im2double(image); 
 r = rgb(:, :, 1); 
 g = rgb(:, :, 2); 
 b = rgb(:, :, 3); 

 % Convert equation according to HSI formula
 % Hue
 h = acos(0.5*(2*r - g - b)./sqrt((r - g).^2 + (r - b).*(g - b)));
 h(b > g) = 2*pi - h(b > g); 
 h = h/(2*pi); 
 
 % Saturation
 s = 1 - 3.*(min(min(r, g), b)./(r + g + b));
 
 % Intensity-light
 i = (r + g + b)/3; 
 
 % Finally, the 3 components are combined into an HSI image
 hsi = cat(3, h, s, i); 
end

