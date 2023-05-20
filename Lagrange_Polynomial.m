% Lagrange Polynomial

clear all
clc

x_i = [0.8 1.5 3 5 6 7 8 9 10];
y_i = sin(x_i) + cos(x_i) + 1./x_i;

denominator = ones(1,size(x_i,2));
numerator = ones(1,size(x_i,2));
x = [2 4.1 5.8 7.1 8.9]
L = zeros(1,size(x,2));
for i = 1:4
	for j = 1:size(x_i,2)
		for k = 1:size(x_i,2)
            if j ~= k
				denominator(j) = denominator(j) * ( x_i(j) - x_i(k) );
            end
        end
        for m = 1:size(x_i,2)
            if j ~= m
                numerator(j) = numerator(j) * ( x(i) - x_i(m) );
            end
        end
    L(i) = (  ( numerator(j) * y_i(j) ) / denominator(j) ) + L(i); 
    denominator = ones(1,size(x_i,2));
    numerator = ones(1,size(x_i,2));
    
    end
end

plot(x_i,y_i,'g*-')
hold on
plot(x,L,'r*')