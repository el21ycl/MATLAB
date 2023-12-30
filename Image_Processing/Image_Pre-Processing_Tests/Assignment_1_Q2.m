% Question 2: Detect a letter in a text image
% DON'T CHANGE VARIABLE NAMES

% Read image text.png
im = imread('text.png');

% 1- It is required to detect upper case T in the text image (horizontal text only)
% Use suitable structural elements (B1 and B2) of size 5x5 to do that 

% Define the first structural element
% Add instruction(s) here:  
B1 =  [1 1 1 1 1 ;1 1 1 1 1;0 0 1 1 1;0 0 1 1 1;0 0 1 1 1];

% Define The second structural element
% Add instruction(s) here:  
B2 = ~[1 1 1 1 1 ;1 1 1 1 1;0 0 1 1 1;0 0 1 1 1;0 0 1 1 1];
  
% Detect Upper case Letter T in the image. The output should be in 'Let_T' 
 
% Add instruction(s) here:  
let_T = bwhitmiss(im,B1,B2);

% Demonstrating results
figure, subplot(2,2,1)
imshow(im); title('Image');
subplot(2,2,2);
imshow(B1); title('B1');
subplot(2,2,3)
imshow(B2); title('B2');
subplot(2,2,4)
imshow(let_T); title('Letter T');
% 2- It is required to detect lower case t in the text image (horizontal text only)
% Use suitable structural elements (B11, B22) of size 5x5 to do that 

% Define The first structural element
% Add instruction(s) here:  
B11 = [0 0 0 1 0;0 0 1 1 0;0 1 1 1 0;1 1 1 1 1;1 1 1 1 1]; 

% Define the second structural element
% Add instruction(s) here:  
B22 = ~[0 0 0 1 0;0 0 1 1 0;0 1 1 1 0;1 1 1 1 1;1 1 1 1 1]; 
  
% Detect lower case t in the text image 
% Note that you may still detect upper case T and also letters that 
% look like letter t (this is considered as noise or error)

% Add instruction(s) here:  
let_t = bwhitmiss(im,B11,B22);

% Demonstrating results
figure, subplot(2,2,1)
imshow(im); title('Image');
subplot(2,2,2);
imshow(B11); title('B1');
subplot(2,2,3)
imshow(B22); title('B2');
subplot(2,2,4)
imshow(let_t); title('Letter t');
