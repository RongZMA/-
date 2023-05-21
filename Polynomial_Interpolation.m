clear all
clc

x_i = 0.8:1.5:18;
y_i = x_i.^(1/2) + 10 * sin(x_i);


R = ones(size(x_i, 2), size(x_i, 2));
for i = 1:size(x_i, 2)
	for j = 1:size(x_i, 2)-1
		R(i, j+1) = x_i(i)^(j);
	end
end
y_ = y_i.';
factor = zeros(1, size(x_i,2));
R_denominator = det(R);
for k = 1:size(x_i, 2)
	R_numerator = R;
	R_numerator(:, k) = y_;
	factor(k) = det(R_numerator)/R_denominator;
end

x_o = 1:0.1:18;
sum = zeros(1,size(x_o,2));
for l = 1:size(x_o,2)
	for m = 1:size(x_i,2)
		sum(l) = sum(l) + (factor(m) * x_o(l)^(m-1));
	end
end

x = 0.5:0.1:20;
y = x.^(1/2) + 10 * sin(x);
plot(x,y,'y')
hold on
plot(x_i,y_i,'r*')
plot(x_o,sum,'g')
