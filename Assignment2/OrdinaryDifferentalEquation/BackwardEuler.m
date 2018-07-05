%% BackwardEuler: function description
function output = BackwardEuler()
	y = 1;
	h = 0.1;
	a = 0;
	b = 1;
	k = 20;
	output = [];
	for x = a : h : b - h
		formerY = y;
		y = formerY + h * f(x, formerY);
		for i = 1 : k
			y = formerY + h * f(x + h, y);
		end
		output = [output; y];
	end

%% f: function description
function output = f(x, y)
	output = (y - 2 * x / y);
