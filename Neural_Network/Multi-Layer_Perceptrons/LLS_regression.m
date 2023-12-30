%LLS regression example

clear
rng(1) %Sets the seed of the random number generator


%Problem definition:
N=100;
x     = 10*rand(N,1);

ideal_a=-3;
ideal_b=12;

d     = ideal_a*x+ideal_b;             %an ideal function
s     = 4; %This is the standard deviation (variance is s^2)
noise =  s * randn(N,1);
d     = d + noise;

figure(1)
plot(x, d, '.r'), hold on

%We create matrix X and add a column with ones (representing the bias)
xo= ones(N,1);
X = [xo, x];

w= pinv(X) * d;

display('Fitting weights')
display(w)

error = (X*w-d)'*(X*w-d);
display('Fitting error:')
display(error)



%Best fit
a= [ -1, 11];
b= [ w(2)*a(1) + w(1), w(2)*a(2) + w(1) ];
plot(a, b, '--k', 'LineWidth', 2 );
xlabel('x')
ylabel('y')

%True curve
a= [ -1, 11];
b_true= [-ideal_a+ideal_b, ideal_a*11+ideal_b];
plot(a, b_true, '-.b', 'LineWidth', 1.5 );
legend('Data points','Trained model', 'Ideal model')
grid on


