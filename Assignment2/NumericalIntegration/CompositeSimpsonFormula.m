%% CompositeSimpsonFormula: function description
function output = CompositeSimpsonFormula(n)
	a = 0;
	b = 1;
	h = (b - a) / n;

	mySum0 = 0;
	for k = 0 : n - 1
		xk = a + k * h;
		temp = xk + h / 2;
		mySum0 = mySum0 + f(temp);
	end

	mySum = 0;
	for k = 1 : n - 1
		xk = a + k * h;
		mySum = mySum + f(xk);
	end
	output = (h / 6) * (f(a) + 4 * mySum0 + 2 * mySum + f(b));

%% f: function description
function output = f(x)
	if x == 0
		output = 1;
	else
		output = sin(x) / x;
	end