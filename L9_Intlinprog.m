
%   * @brief 专门用于求解混合整数线性规划问题（MILP）.支持整数变量、二进制变量和连续变量的混合建模
%               [x, fval, exitflag, output] = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)
% @param f	目标函数系数向量（长度为 n，n 是变量总数）
% @param intcon	整数变量的索引向量（如 [1,3] 表示第 1 和第 3 个变量必须为整数）
% @param A	不等式约束矩阵（m×n，每行对应一个不等式约束）
% @param b	不等式约束的右侧向量（长度为 m）
% @param Aeq	等式约束矩阵（p×n，每行对应一个等式约束）
% @param beq	等式约束的右侧向量（长度为 p）
% @param lb	变量下界向量（长度为 n，默认 -Inf）
% @param ub	变量上界向量（长度为 n，默认 Inf）
% @param options	优化选项（通过 optimoptions 设置，如最大迭代次数、显示信息等）



% @retval x	最优解向量（满足所有约束的整数 / 连续变量取值）
% @retval  fval	目标函数的最优值（f'*x 在最优解处的结果）
% @retval  exitflag	求解终止标志（正数表示成功，负数 / 0 表示失败或未收敛，具体见下表）
% @retval  output	求解过程信息（如迭代次数、求解时间、算法类型等）
% 
% exitflag 含义说明
% 1	找到最优解（满足整数约束和最优性条件）
% 0	达到最大迭代次数或时间限制，未找到最优解
% -2	无可行解（约束条件矛盾，没有满足所有约束的解）
% -3	目标函数无界（在满足约束的情况下，目标函数可以无限小）
% -4	数值计算问题（如矩阵奇异、精度不足等）

 %%
 %例1
f = [1; 2; 3];        % 目标函数系数
intcon = [1, 3];      % 第1和第3个变量为整数
A = [-1 1 3; 1 3 -1]; % 不等式约束矩阵
b = [20; 10];         % 不等式约束向量
lb = zeros(3,1);      % 变量下界
ub = [10; inf; 10];   % 变量上界

[x, fval, exitflag, output] = intlinprog(f, intcon, A, b, [], [], lb, ub);


%%
%例2
% 求解一个简单的混合整数线性规划问题：
% 目标函数：min f'*x = -3x1 -2x2 -5x3
% 约束条件：
% x1 + 2x2 + x3 ≤ 4（不等式约束）
% 2x1 + x2 + x3 ≤ 6（不等式约束）
% x1, x2 为非负整数，x3 为 0-1 变量（整数约束）


% 目标函数系数（最小化 -3x1 -2x2 -5x3）
f = [-3; -2; -5];

% 整数变量索引（x1=1, x2=2 为整数；x3=3 为二进制变量）
intcon = [1, 2, 3];

% 不等式约束 A*x ≤ b
A = [1 2 1;    % 第一个约束：x1 + 2x2 + x3 ≤ 4
     2 1 1];   % 第二个约束：2x1 + x2 + x3 ≤ 6
b = [4; 6];

% 变量边界（x1,x2≥0；x3为0-1变量）
lb = [0; 0; 0];   % 下界
ub = [Inf; Inf; 1]; % 上界（x3≤1）

% 求解
[x, fval, exitflag] = intlinprog(f, intcon, A, b, [], [], lb, ub);

% 输出结果
disp('最优解 x:');
disp(x);
disp('目标函数最优值:');
disp(fval);
disp('求解状态 exitflag:');
disp(exitflag);

%%
%例3
% 目标函数系数
f = [-5; -8];

% 整数变量索引（x1和x2均为整数）
intcon = [1, 2];

% 不等式约束 A*x ≤ b
A = [1 1;        % x1 + x2 ≤ 6
     5 9];       % 5x1 + 9x2 ≤ 45
b = [6; 45];

% 变量上下界（非负整数）
lb = [0; 0];
ub = [inf; inf];

% 求解
[x, fval, exitflag, output] = intlinprog(f, intcon, A, b, [], [], lb, ub);

% 输出结果
disp('最优解 x:');
disp(x);
disp('目标函数最优值 fval:');
disp(fval);
disp('求解状态 exitflag:');
disp(exitflag);
disp(' ');
disp('output 结构详细信息:');
disp(output);
