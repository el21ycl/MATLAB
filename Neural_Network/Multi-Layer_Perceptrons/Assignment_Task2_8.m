clear
clf
close all
setdemorandstream(1)

% 8) Evaluate a comprehensive data set Evaluate a comprehensive data set
N_data = 10000;
x=10*randn(2,N_data);
X = x(1,1:10000);
Y = x(2,1:10000);
C = sqrt(X.^2 + Y.^2);

figure(1)
hold on
% t is the target category of the 2x10000 matrix, divided into (0 to 20) and otherwise
for n =1:N_data
    a = X(:,n);
    b = Y(:,n);
    C = sqrt(a^2+b^2);
    if C > 5 && C < 20
        t(:,n)=[1;0];           
        plot(a, b, '.r');  
    else
        t(:,n)=[0;1];
        plot(a, b, '.b');
    end
end

% 9) Calculate the output of the neural network for the points in the dataset
N = 2;
net = patternnet(N);
view(net)

[net,tr] = train(net,x,t);
nntraintool 
y = net(x);

figure(2)
hold on
grid on
title('When N = 2')      % 10) When N=5, N=10 or N=20
for i =1:N_data
    if y(1,i) >  y(2,i)          
        plot(x(1,i), x(2,i), '.r');  
    else y(1,i) < y(2,i) 
        plot(x(1,i), x(2,i), '.b');
    end
end



