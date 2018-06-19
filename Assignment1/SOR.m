%% SOR: Successive Over Relaxation method
%% iterate only once with initial value
%% @return the solution of the matrix
%% @param A: a n * n matrix
%% @param b: a n dimensional vector
%% @param init_x: the initial value
function x = SOR(A, b, init_x)
	n = length(A);
	x = init_x;	% initial value
	w = 1.7;		% relaxation factor
	for i = 1 : n
		mySum = 0;
		for j = 1 : n
			mySum = mySum + A(i, j) * x(j);
		end 

		x(i) = x(i) + w * (b(i) - mySum) / A(i, i);
	end