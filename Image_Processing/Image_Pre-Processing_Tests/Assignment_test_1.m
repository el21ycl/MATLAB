im = [1 4 0 7 3 1 3;
      1 0 0 0 0 0 1 0 0 0 1 1 1 0;
      0 0 1 0 0 0 1 0 1 0 1 1 1 0;
      0 0 1 0 1 0 1 1 1 0 0 0 0 0;
      0 0 1 1 1 0 1 1 1 0 0 1 1 0;
      0 0 0 0 1 0 1 0 1 0 0 0 1 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0];
% Define the first structural element
% Add instruction(s) here:  
B1 = [1    ;
      1   1;
      1 1 1;
          1];

% Define The second structural element
% Add instruction(s) here:  
B2 = ~[1    ;
       1   1;
       1 1 1;
           1];
  
% Detect Upper case Letter T in the image. The output should be in 'Let_T' 
 
% Add instruction(s) here:  
let_T = bwhitmiss(im,B1,B2);