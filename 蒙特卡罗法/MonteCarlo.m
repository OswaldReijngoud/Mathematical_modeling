%%
%*************************************************
% Monte Carlo Method
% Solving Birthday Paradox Using Monte Carlo Method
% Oswald's practice : 25 Aug 2025
%*************************************************
%% Written by myself
clear;clc;
m=100;%人数
n=10000;
cnt=0;%生日重复次数
for k=1:n
    people=randi([1,365],1,m);%一个entry表示一个人的生日在某年的第几天
    for i=1:m
        for j=i+1:m
            if people(i)==people(j)
                flag=1;break;
            end
        end
        if flag==1
            flag=0;cnt=cnt+1;break;
        end

    end
end
disp("至少两人生日相同的概率为：")
disp(cnt/n);
%% Written by AI
% AI used "unique" function to avoide the operation of a two - level loop structure when determining whether at least two people have the same birthday.

n = 23;          % 人数
trials = 1e6;    % 模拟次数
count = 0;       % 记录出现至少至少两人同生日的次数

for i = 1:trials
    % 生成n个1-365的随机生日
    birthdays = randi(365, 1, n);
    % 检查是否有重复生日
    if length(unique(birthdays)) < n %比我好的地方
        count = count + 1;
    end
end

% 计算并显示概率
probability = count / trials;
fprintf('%d人时至少两人同生日的概率: %.4f\n', n, probability);

