clear all
clc

x_i = [1 2 3.5 4 4.2 4.9 5.5];
y_i = x_i.^(2) + x_i.^(6);


R = ones(size(x_i, 2), size(x_i, 2));
for i = 1:size(x_i, 2)
	for j = 1:size(x_i, 2)-1
		R(i, j+1) = x_i(i)^(j);
	end
end
y_ = y_i.';
factor = zeros(1, size(x_i,2));
R_denominator = norm(R);
for k = 1:size(x_i, 2)
	R_numerator = R;
	R_numerator(:, k) = y_;
	factor(k) = norm(R_numerator)/R_denominator;
end

x_o = [1 2.3 3 3.9 4.1 4.8 5.1 5.4];
sum = zeros(1,size(x_o,2));
for l = 1:size(x_o,2)
	for m = 1:size(x_i,2)
		sum(l) = sum(l) + (factor(m) * x_o(l)^(m-1));
	end
end

x = 0.5:0.1:6;
y = x.^(2) + x.^(6);
plot(x,y)
hold on
plot(x_i,y_i,'r*')
plot(x_o,sum,'g.')
