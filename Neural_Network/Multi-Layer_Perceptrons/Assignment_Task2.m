clear
clf
close all
setdemorandstream(1)
%Cancer dataset
% x is the feature vector of the 9x699 matrix
% t is the target category of the 2x699 matrix, divided into benign and malignant
[x,t] = cancer_dataset;

% 1) Perform the classification task
% Take only the first two feature vectors
CT_b = x(1,1:699).*t(1,1:699);    % The Clump thickness of the benign
CT_b(CT_b==0)=[];                 % Remove 0
CS_b = x(2,1:699).*t(1,1:699);    % The Uniformity of cell size of the benign
CS_b(CS_b==0)=[];
CT_m = x(1,1:699).*t(2,1:699);    % The Clump thickness of the malignant
CT_m(CT_m==0)=[];
CS_m = x(2,1:699).*t(2,1:699);    % The Uniformity of cell size of malignant
CS_m(CS_m==0)=[];

figure(1)
plot(CT_b, CS_b, 'or'); 
hold on
plot(CT_m, CS_m, 'xb'); 
xlabel('Clump thickness')
ylabel('Uniformity of cell size')
legend('Benign','Malignant')
title('The classification task');
grid on

% 2) How many data points are there in total, of which how many are benign and malignant
[r1,benign] = size(CT_b);               
[r2,malignant] = size(CT_m);
benign = r1*benign;                     %The number of the benign
malignant = r2*malignant;               %The number of the malignant
T_data = benign + malignant;            %The number of the total data point
display(benign)
display(malignant)
display(T_data)

% 4) Create and train a network with N=5
X = x(1:2,1:699);                   % X is the first two feature vectors of x
N = 5;
net = patternnet(N);
view(net)

% net.performFcn='mse';         % 5) & 6)Performance Functions
% 5) net.trainParam.max_fail=10000;

[net,tr] = train(net,X,t);
nntraintool

% View the amount of data used in the training set, the validation set and the test set
Train = numel(tr.trainInd);    
Validation = numel(tr.valInd);
Test = numel(tr.testInd);
% Percentage of data points in training set, validation set and test set
P_tr = Train / T_data;
P_va = Validation / T_data;
P_ts = Test / T_data;
display(P_tr)
display(P_va)
display(P_ts)

% 5) & 6) Use the mean square error as the cost function to train the network
figure(2)
plotperform(tr);

% 7) Plot the confusion matrices for the trained neural network
testX = X(:,tr.testInd);    % Extract data from the test set
testT = t(:,tr.testInd);

testY = net(testX);
testIndices = vec2ind(testY);
figure(3)
plotconfusion(testT,testY);
% The overall percentage of correct and incorrect classifications
[c,cm] = confusion(testT,testY)
fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);


