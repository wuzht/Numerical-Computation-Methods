%% pagerank: pagerank algorithm
%% @return the p
%% @param maxIterations: max Iterations time
function output = pagerank(maxIterations)
	tic;
 	S = processData();
   	n = length(S);

   	% dampingFactor = 0.85;
   	epsilon = 1e-5;
   	% e = ones(n, 1);

   	% A = dampingFactor * S + (1 - dampingFactor) / n * (e * e');
   	p = ones(n, 1) / n;
   	former_p = zeros(n, 1);

   	count = 0;
   	while max(abs(p - former_p)) > epsilon
   		count = count + 1;
   		if count > maxIterations
   			break;
   		end
   		former_p = p;
   		p = S * p;
   	end

	output = p;
	toc;
