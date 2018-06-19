%% processData: process the text data
%% @return the processed sparse matrix
function output = processData()
	fileName = 'data/soc-Epinions1.txt';
	% fileName = 'data/dataSmall.txt';
	A = importdata(fileName);
	data = A.data;

	nodesNum = 75888;
	edgesNum = length(data);
	data = data + ones(edgesNum, 2);

	i = data(:, 2);		% toNodeId
	j = data(:, 1);		% fromNodeId
	s = ones(1, edgesNum);
	S = sparse(i, j, s, nodesNum, nodesNum);

	value = ones(edgesNum, 1) / nodesNum;
	
	for it = 1 : edgesNum
		numOfNonZero = nnz(S(:, j(it)));
		if numOfNonZero ~= 0
			value(it) = 1 / numOfNonZero;
		end
	end

	proS = sparse(i, j, value, nodesNum, nodesNum);

	output = proS;

    
