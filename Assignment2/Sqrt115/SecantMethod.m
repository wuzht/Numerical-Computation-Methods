%% SecantMethod: function description
function output = SecantMethod()
	x0 = 10;
	x1 = 10.5;
	while true
		x = (x1 * x0 + 115) / (x1 + x0);
 		if (abs(x * x - 115) < 1e-6)
			break;
		end
		x0 = x1;
		x1 = x;
	end
	output = x;