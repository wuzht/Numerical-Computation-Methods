%% MCPElimination: Elimination with Maximal Column Pivoting
%% @return the solution of the matrix
%% @param A: a n * n matrix
%% @param b: a n dimensional vector
function x = MCPElimination(A, b)
	n = length(A);
	a = [A, b];
	for k = 1 : n
		% find the pivot with maximal abs value
		pivot = a(k, k);
		pivotRowIndex = k;
		for i = k : n
			if abs(a(i, k)) > abs(pivot)
				pivot = a(i, k);
				pivotRowIndex = i;
				break;
			end
		end

		if pivot == 0
			disp('[Error] MCP == 0, stop!');
			return;
		end

		% exchange the rows
		if pivotRowIndex ~= k
			tempRow = a(k, :);
			a(k, :) = a(pivotRowIndex, :);
			a(pivotRowIndex, :) = tempRow;
		end

		% elimination
		for i = k + 1 : n
			mul = a(i, k) / a(k, k);
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

