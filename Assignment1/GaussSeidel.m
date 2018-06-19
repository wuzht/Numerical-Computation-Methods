%% GaussSeidel: GaussSeidel iteration method
%% iterate only once with initial value
%% @return x_plus_one
%% @param A: a n * n matrix
%% @param b: a n dimensional vector
%% @param init_x: the initial value
function x = GaussSeidel(A, b, init_x)
	n = length(A);
	x = init_x;	% initial value

	for i = 1 : n
		mySum = 0;
		for j = 1 : n
			if j ~= i
				mySum = mySum + A(i, j) * x(j);
			end
		end 
		x(i) = (b(i) - mySum) / A(i, i);
	end