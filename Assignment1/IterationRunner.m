%% IterationRunner: Runner for the Iterations
%% @param n: the iterations number
function [] = IterationRunner(n)
	tic;
	dim = 500;
	OperationNum = 1;

	myPlotX = 1:n;
	myPlotJacobiY = zeros(1, n);
	myPlotGaussSeidelY = zeros(1, n);
	myPlotSORY = zeros(1, n);
	myPlotCGY = zeros(1, n);

	for j = 1 : OperationNum
		% generate A, x, b
		while true
			% generate the matrix A
			% which is a positive definite matrix
			% with eigenvalues uniformly distributed in [0, 1]
			V = diag(rand(1, dim));
			U = orth(rand(dim));
			A = U * V * U';
			x = randn(dim, 1);
			b = A * x;

			% see if the method can converge
			D = diag(diag(A));
			L = -(tril(A) - D);
			U = -(triu(A) - D);

			J = D \ (L + U);
			RhoJ = max(abs(eig(J)));	% spectral radius of J

			G = (D - L) \ U;
			RhoG = max(abs(eig(G)));	% spectral radius of G

			if (RhoJ < 1 && RhoG < 1)
				break;
			end
		end
	
		% initial values
		itJacobiX = zeros(dim, 1); 
		itGaussSeidelX = zeros(dim, 1);
		itSORX = zeros(dim, 1);

		itCGX = zeros(dim, 1);
		itCGP = b - A * itCGX;

		for i = 1 : n
			itJacobiX = Jacobi(A, b, itJacobiX);
			myPlotJacobiY(i) = myPlotJacobiY(i) + pdist([x'; itJacobiX'], 'euclidean');

			itGaussSeidelX = GaussSeidel(A, b, itGaussSeidelX);
			myPlotGaussSeidelY(i) = myPlotGaussSeidelY(i) + pdist([x'; itGaussSeidelX'], 'euclidean');

			itSORX = SOR(A, b, itSORX);
			myPlotSORY(i) = myPlotSORY(i) + pdist([x'; itSORX'], 'euclidean');

			output = CGmethod(A, b, itCGX, itCGP);
			itCGX = output(:, 1);
			itCGP = output(:, 2);
			if (i > dim)
				myPlotCGY(i) = myPlotCGY(i) + 0;
			else
				myPlotCGY(i) = myPlotCGY(i) + pdist([x'; itCGX'], 'euclidean');
			end
		end

	end

	% get the avg number
	for i = 1 : n
		myPlotJacobiY(i) = myPlotJacobiY(i) / OperationNum;
		myPlotGaussSeidelY(i) = myPlotGaussSeidelY(i) / OperationNum;
		myPlotSORY(i) = myPlotSORY(i) / OperationNum;
		myPlotCGY(i) = myPlotCGY(i) / OperationNum;
	end

	plot(myPlotX, myPlotJacobiY, myPlotX, myPlotGaussSeidelY, myPlotX, myPlotSORY, myPlotX, myPlotCGY);
	set(gca,'XTick', 0:round(n/5):n);
	title('Iteration Convergence Curve');
    xlabel('Number of iterations');
    ylabel('deviation');
    legend('Jacobi', 'GaussSeidel', 'SOR', 'CG');
    toc;