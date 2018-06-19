%% CGmethod: conjugate gradient method
%% iterate only once with initial value
%% @return x_plus_one and p_plus_one
%% @param A: a n * n matrix
%% @param b: a n dimensional vector
%% @param init_x: the initial value
%% @param init_p: the initial value
function output = CGmethod(A, b, init_x, init_p)
	init_r = b - A * init_x;
	if any(init_r) == 0
		output = [init_x init_p];
		return;
	end

	init_a = dot(init_r, init_r) / dot(init_p, A * init_p);
	x = init_x + init_a * init_p;
	r = init_r - init_a * A * init_p;
	myBeta = dot(r, r) / dot(init_r, init_r);
	p = r + myBeta * init_p;


	output = [x p];
