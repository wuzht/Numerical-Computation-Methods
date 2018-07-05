%% composite trapezoidal formula: function description
function output = CompositeTrapezoidalFormula(n)
	a = 0;
	b = 1;
	h = (b - a) / n;
	mySum = 0;
	for k = 1 : n - 1
		xk = a + k * h;
		mySum = mySum + f(xk);
	end
	output = (h / 2) * (f(a) + 2 * mySum + f(b));

%% f: function description
function output = f(x)
	if x == 0
		output = 1;
	else
		output = sin(x) / x;
	end

