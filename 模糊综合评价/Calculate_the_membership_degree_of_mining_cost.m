function Result = Calculate_the_membership_degree_of_mining_cost(x)
    % 计算采矿成本的隶属度，支持行向量输入
    % 输入：x - 行向量，代表采矿成本（元/吨）
    % 输出：Result - 与x同维度的行向量，代表对应的隶属度
    
    % 检查输入是否为行向量
    if ~isvector(x) || size(x, 1) > 1
        error('输入x必须是行向量');
    end
    
    % 确保输入为行向量（即使输入是列向量也转为行向量）
    x = x(:)';
    
    Low_Cost = 5.5;  % 低成本阈值
    High_Cost = 8.0; % 高成本阈值
    Result = zeros(size(x)); % 初始化结果向量
    
    % 处理非负输入
    non_negative = x >= 0;
    if ~all(non_negative)
        error('输入的采矿成本x不能为负数');
    end
    
    % 计算不同区间的隶属度
    Result(x <= Low_Cost) = 1;  % 低成本区间
    
    mid_range = (x > Low_Cost) & (x <= High_Cost);
    Result(mid_range) = (High_Cost - x(mid_range)) ./ (High_Cost - Low_Cost);  % 中间区间
    
    Result(x > High_Cost) = 0;  % 高成本区间
end
