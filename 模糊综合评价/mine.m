%一级模糊综合评价模型:露天煤矿五个边坡设计方案的练习
% written by jhn 8/17/25

%%1.记录原始数据
%原始信息矩阵
clear;clc;
disp('原始信息矩阵:');
Ori_Inf=[4700 6700 5900 8800 7600 %可采矿量/万吨
5000 5500 5300 6800 6000 %基建投资/万元 
 4.0 6.1 5.5 7.0 6.8 %采矿成本/（元/吨）
 30 50 40 200 160 %不稳定费用/万元
1500 700 1000 50 100]%净现值/万元
[m, n] = size(Ori_Inf);

%% 2.计算隶属度
Ori_Inf(1,:)=Ori_Inf(1,:)/8800;                                            %可采矿量的隶属度
Ori_Inf(2,:)=1-Ori_Inf(2,:)/8000;                                          %基建投资隶属度
Ori_Inf(3,:)= Calculate_the_membership_degree_of_mining_cost(Ori_Inf(3,:));%采矿成本隶属度
Ori_Inf(4,:)=1-Ori_Inf(4,:)/200;                                            %不稳定费用的隶属度
Temp1=min(Ori_Inf(5,:));Temp2=max(Ori_Inf(5,:));
for i=1:m
    Ori_Inf(5,i)=(Ori_Inf(5,i)-Temp1)/(Temp2-Temp1);   %净现值的隶属度
end

disp('隶属度矩阵:');
disp(Ori_Inf);

%% 3.综合评价

Weight= [0.25 , 0.20 , 0.20 , 0.10 , 0.25];%权重矩阵
Comprehensive_evaluation=Weight*Ori_Inf;
disp('每个方案最终得分:');
disp(Comprehensive_evaluation);
