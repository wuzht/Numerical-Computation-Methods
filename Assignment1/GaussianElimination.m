%% GaussianElimination: Gaussian Elimination
%% @return the solution of the matrix
%% @param A: a n * n matrix
%% @param b: a n dimensional vector
function x = GaussianElimination(A, b)
	n = length(A);
	a = [A, b];
	for k = 1 : n
		for i = k + 1 : n
			mul = a(i, k) / a(k, k);		% mul: The multiplier
			for j = k : n + 1
				a(i, j) = a(i, j) - mul * a(k, j);
			end
		end
	end
	if a(n, n) == 0
		disp('[Error] a(n, n) == 0, stop!');
		return;
	end
	x = BackSubstitution(a);
