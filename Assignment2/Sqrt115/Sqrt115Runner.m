%% Sqrt115Runner: function description
function [] = Sqrt115Runner()
	x0 = 10;
	x1 = 10.5;

	a = 10;
	b = 11;

	n = 7;
	myPlotX = 1:n;
	myPlotBisectionY = zeros(1, n);
	myPlotNewtonY = zeros(1, n);
	myPlotSimplifiedNewtonY = zeros(1, n);
	myPlotSecantY = zeros(1, n);

	BisectionOutput = 10;
	NewtonOutput = 10;
	SimplifiedNewtonOutput = 10;
	SecantOutput = 10;
	for i = 1 : n
		% Bisection
		f_mid = Equation1((a + b) / 2);
		if (f_mid * Equation1(a) < 0)
			b = (a + b) / 2;
		else
			a = (a + b) / 2;
		end	
		BisectionOutput = (a + b) / 2;
		myPlotBisectionY(i) = abs(BisectionOutput - sqrt(115));

		% Newton
		NewtonOutput = NewtonMethod1(NewtonOutput);
		myPlotNewtonY(i) = abs(NewtonOutput - sqrt(115));

		% SimplifiedNewton
		SimplifiedNewtonOutput = SimplifiedNewtonMethod1(SimplifiedNewtonOutput);
		myPlotSimplifiedNewtonY(i) = abs(SimplifiedNewtonOutput - sqrt(115));

		% SecantMethod
		SecantOutput = (x1 * x0 + 115) / (x1 + x0);
		x0 = x1;
		x1 = SecantOutput;
		myPlotSecantY(i) = abs(SecantOutput - sqrt(115));
	end
	plot(myPlotX, myPlotBisectionY, myPlotX, myPlotNewtonY, myPlotX, myPlotSimplifiedNewtonY, myPlotX, myPlotSecantY);
	set(gca,'XTick', 0:1:n);
	title('Convergence Precision Curve by the Number of Iterations');
    xlabel('Number of iterations');
    ylabel('Convergence Precision');
    legend('Bisection', 'Newton', 'SimplifiedNewton', 'Secant');


%% SimplifiedNewtonMethod: function description
function output = SimplifiedNewtonMethod1(x)
	output = x - (x * x - 115) / 20;


%% NewtonMetod: function description
function output = NewtonMethod1(x)
	output = (x + 115 / x) / 2;

%% Equation1: the Algebra Equation1
function output = Equation1(x)
	output = x * x - 115;
