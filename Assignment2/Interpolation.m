%% Interpolation: Linear, quadratic and cubic Interpolation
%% @return the value of sin(0.35)
%% @param n: Linear is 1, quadratic is 2, cubic is 3
function output = Interpolation(n)
	arg = 0.35;
	x = zeros(1, 4);
	y = zeros(1, 4);

	x(1) = 0.32;
	y(1) = 0.314567;
	x(2) = 0.34;
	y(2) = 0.333487;
	x(3) = 0.36;
	y(3) = 0.352274;
	x(4) = 0.38;
	y(4) = 0.370920;

	if n == 1
		x(1) = 0.34;
		y(1) = 0.333487;
		x(2) = 0.36;
		y(2) = 0.352274;
	end

	LagrangeFunction = 0;
	for k = 1 : n + 1
		numerator = 1;
		denominator = 1;
		for j = 1 : n + 1
			if j ~= k
				numerator = numerator * (arg - x(j));
				denominator = denominator * (x(k) - x(j));
			end
		end
		LagrangeFunction = LagrangeFunction + y(k) * numerator / denominator;
	end

	output = LagrangeFunction;
