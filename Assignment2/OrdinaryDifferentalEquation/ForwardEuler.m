%% ForwardEuler: function description
function output = ForwardEuler()
	y = 1;
	h = 0.1;
	a = 0;
	b = 1;
	output = [];
	for x = a : h : b - h
		y = y + h * f(x, y);
		output = [output; y];
	end

%% f: function description
function output = f(x, y)
	output = (y - 2 * x / y);