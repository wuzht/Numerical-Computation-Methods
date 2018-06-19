```matlab
function processedMatrix = processData() {
    将'data/soc-Epinions1.txt'文件里的数据保存成一个0 1稀疏矩阵S;
    numOfNonZero = 矩阵S中每一列非零元素的个数;
    
    % 将矩阵S变成每列和都为1的矩阵
    value = ones(edgesNum, 1) / nodesNum; % processedMatrix(i,j)的值
    for it = 1 : edgesNum
        if 节点Id为it的该列非零元素个数 ~= 0
            value(it) = 1 / 节点Id为it的该列非零元素个数;
        end
    end
    
    返回利用value建立的processedMatrix;
}

function p = pagerank(最大迭代次数) {
    S = processData(); 
    p = ones(n, 1) / n;		% p的初值(不为零)
    former_p = zeros(n, 1);		% 上一个p
    
    count = 0;
    while (p - former_p)的绝对值最大值 > epsilon
    	count = count + 1;
    	if count > 最大迭代次数
    		break;
    	end
    	former_p = p;
    	p = S * p;	% 迭代
    end
}
```

