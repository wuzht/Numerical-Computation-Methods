%% BackSubstitution: back substitution
%% @param a: upper triangular matrix
function x = BackSubstitution(a)
	n = length(a) - 1;
	b = a(:, n + 1);
	x = zeros(n, 1);
	x(n) = b(n) / a(n, n);
	for k = n - 1 : -1 : 1
		mySum = 0;
		for j = k + 1 : n
			mySum = mySum + a(k, j) * x(j);
		end
		x(k) = (b(k) - mySum) / a(k, k);
	end
