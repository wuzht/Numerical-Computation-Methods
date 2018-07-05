%% ImprovedEuler: function description
function output = ImprovedEuler()
	y = 1;
	h = 0.1;
	a = 0;
	b = 1;
	output = [];
	for x = a : h : b - h
		yp = y + h * f(x, y);
		yc = y + h * f(x + h, yp);
		y = (yp + yc) / 2;
		output = [output; y];
	end

%% f: function description
function output = f(x, y)
	output = (y - 2 * x / y);