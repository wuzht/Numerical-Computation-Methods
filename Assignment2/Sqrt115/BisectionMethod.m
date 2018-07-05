%% BisectionMethod: Bisection Method for computing sqrt(115)
function output = BisectionMethod()
	tic;
	a = 10;
	b = 11;
	while true
		f_mid = Equation((a + b) / 2);

		if (abs(f_mid) < 1e-7)
			break;
		elseif (f_mid * Equation(a) < 0)
			b = (a + b) / 2;
		else
			a = (a + b) / 2;
		end	
	end
	output = (a + b) / 2;


%% Equation: the Algebra Equation
function output = Equation(x)
	output = x * x - 115;


