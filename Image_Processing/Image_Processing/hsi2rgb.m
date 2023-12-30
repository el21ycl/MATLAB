function rgb_h = hsi2rgb(h_hsi)
 % Extract the individual HSI component images.
 h_hsi = im2double(h_hsi);
 H = h_hsi(:, :, 1) * 2 * pi; 
 S = h_hsi(:, :, 2);
 I = h_hsi(:, :, 3); 
 
 % Define R.G.B array
 R = zeros(size(h_hsi,1),size(h_hsi,2));
 G = zeros(size(h_hsi,1),size(h_hsi,2));
 B = zeros(size(h_hsi,1),size(h_hsi,2));

 % Convert equation according to RGB formula
 % RG sector (0<=H<2*pi/3).
 idx=find((0<=H)&(H<2*pi/3));
 B(idx)=I(idx).*(1-S(idx));
 R(idx)=I(idx).*(1+S(idx).*cos(H(idx))./cos(pi/3-H(idx)));
 G(idx)=3*I(idx)-(R(idx)+B(idx));
 %BG sector (2*pi/3<=H<4*pi/3).
 idx=find((2*pi/3<=H)&(H<4*pi/3));
 R(idx)=I(idx).*(1-S(idx));
 G(idx)=I(idx).*(1+S(idx).*cos(H(idx)-2*pi/3)./cos(pi-H(idx)));
 B(idx)=3*I(idx)-(R(idx)+G(idx));
 %BR sector(4*pi/3<=H)&(H<=2*pi).
 idx=find((4*pi/3<=H)&(H<=2*pi));
 G(idx)=I(idx).*(1-S(idx));
 B(idx)=I(idx).*(1+S(idx).*cos(H(idx)-4*pi/3)./cos(5*pi/3-H(idx)));
 R(idx)=3*I(idx)-(G(idx)+B(idx));

 % Combine R, G and B components into an RGB image
 rgb_h=cat(3,R,G,B);
 rgb_h=max(min(rgb_h,1),0);
end