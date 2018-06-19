%% Runner: GaussianElimination and MCPElimination Runner
%% @param n: the dimension
%% display their run time
function [] = EliminationRunner(n)
    dim = [10, 50, 100, 200];
    x = dim;
    y1 = zeros(1, 4);
    y2 = zeros(1, 4);
    for i = 1:4
        for j = 1:n
            A = randn(dim(i));
            b = randn(dim(i), 1);

            tic;
            GaussianElimination(A, b);
            y1(i) = y1(i) + toc;

            tic;
            MCPElimination(A, b);
            y2(i) = y2(i) + toc;
        end
        y1(i) = y1(i) / n;
        y2(i) = y2(i) / n;
    end

    plot(x, y1, x, y2);
    title('Average Elimination Time Curve (test case number: 500)');
    set(gca,'XTick', 0:10:200);
    xlabel('dimension');
    ylabel('time(s)');
    legend('Gaussian', 'MCP');
    grid on;
