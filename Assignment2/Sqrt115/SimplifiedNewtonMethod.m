%% SimplifiedNewtonMethod: function description
function output = SimplifiedNewtonMethod()
	x = 10;
	while true
		x = x - (x * x - 115) / 20;
		if (abs(x * x - 115) < 1e-6)
			break;
		end
	end
	output = x;