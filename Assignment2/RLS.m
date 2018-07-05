%% RLS: function description
function output = RLS()
	m = 10000;
	n = 10;
	A = randn(m, n);
	xAssert = randn(n, 1);
	b = A * xAssert;

	myPlotX = 1 : m - n;
	myPlotY = zeros(1, m - n);

	Am = A(1:10, :);
	bm = b(1:10);

	xm = (Am' * Am) \ (Am' * bm);

	for i = n + 1 : m
		Gm = Am' * Am;
		a_mplus1 = A(i, :)';
		M_mplus1 = 1 + a_mplus1' / Gm * a_mplus1;
		b_mplus1 = b(i);
		xm = xm + (Gm \ a_mplus1) / M_mplus1 * (b_mplus1 - a_mplus1' * xm);

		myPlotY(i - n) = pdist([xAssert'; xm'], 'euclidean');
	end

	plot(myPlotX, myPlotY);
	title('Iteration Convergence Curve');
    xlabel('Number of iterations');
    ylabel('deviation');
    legend('RLS');
	output = xm;

