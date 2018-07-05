%% Sqrt115RunnerByTime: function description
function [] = Sqrt115RunnerByTime()
	% Bisection
	arg1 = BisectionMethod2();

	% Newton
	arg2 = NewtonMethod2();

	% SimplifiedNewton
	arg3 = SimplifiedNewtonMethod2();

	% SecantMethod
	arg4 = SecantMethod2();

	plot(arg1(1, :), arg1(2, :), arg2(1, :), arg2(2, :), arg3(1, :), arg3(2, :), arg4(1, :), arg4(2, :));
	title('Convergence Precision Curve by the Time');
    xlabel('time (s)');
    ylabel('Convergence Precision');
    legend('Bisection', 'Newton', 'SimplifiedNewton', 'Secant');

%% SecantMethod: function description
function output = SecantMethod2()
	tic;
	convergence = [];
	time = [];
	x0 = 10;
	x1 = 10.5;
	while true
		x = (x1 * x0 + 115) / (x1 + x0);
		time = [time toc];
		convergence = [convergence abs(x - sqrt(115))];
 		if (abs(x * x - 115) < 1e-6)
			break;
		end
		x0 = x1;
		x1 = x;
	end
	output = [time; convergence];


%% SimplifiedNewtonMethod: function description
function output = SimplifiedNewtonMethod2()
	tic;
	convergence = [];
	time = [];
	x = 10;
	while true
		x = x - (x * x - 115) / 20;
		time = [time toc];
		convergence = [convergence abs(x - sqrt(115))];
		if (abs(x * x - 115) < 1e-6)
			break;
		end
	end
	output = [time; convergence];

%% NewtonMetod: function description
function output = NewtonMethod2()
	tic;
	convergence = [];
	time = [];
	x = 10;
	while true
		x = (x + 115 / x) / 2;
		time = [time toc];
		convergence = [convergence abs(x - sqrt(115))];

		if (abs(x * x - 115) < 1e-6)
			break;
		end			
	end
	output = [time; convergence];

%% BisectionMethod: Bisection Method for computing sqrt(115)
function output = BisectionMethod2()
	tic;
	convergence = [];
	time = [];
	a = 10;
	b = 11;
	while true
		f_mid = Equation2((a + b) / 2);
		if (abs(f_mid) < 1e-6)
			break;
		elseif (f_mid * Equation2(a) < 0)
			b = (a + b) / 2;
		else
			a = (a + b) / 2;
		end		
		convergence = [convergence abs((a + b) / 2 - sqrt(115))];
		time = [time toc];
	end
	output = [time; convergence];


%% Equation: the Algebra Equation
function output = Equation2(x)
	output = x * x - 115;

