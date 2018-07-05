%% NewtonMetod: function description
function output = NewtonMethod()
	x = 10;
	while true
		x = (x + 115 / x) / 2;
		if (abs(x * x - 115) < 1e-6)
			break;
		end
	end
	output = x;