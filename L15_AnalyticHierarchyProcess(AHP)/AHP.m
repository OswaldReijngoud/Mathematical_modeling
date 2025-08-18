

%% 利用【和积法】求最大特征根及对应的特征向量
clc;clear;
B = [1,1/5,1/3; 5,1,3; 3,1/3,1]; %判断矩阵
B1 = B./repmat(sum(B),3,1); %列正规化 %将判断矩阵按行扩大3倍，按列扩大1倍
W0 = sum(B1,2); %列正规化后行相加
W = W0/sum(W0); %W0正规化后即为所求的特征向量
BW = B*W;
lada_max = sum(BW./W)/3; %最大特征值
disp(['和积法求得的最大特征值：',num2str(lada_max)]);
disp('和积法求得的最大特征值对应的特征向量：');
disp(W);

%% 利用【方根法】求最大特征根及对应的特征向量
clear;
B = [1,1/5,1/3; 5,1,3; 3,1/3,1]; %判断矩阵
B1 = prod(B,2).^(1/3); %判断矩阵按行相乘，所得乘积分别开n方
W = B1./sum(B1);
lada_max = sum(B*W./W)/3;
disp(['方根法求得的最大特征值：',num2str(lada_max)]);
disp('方根法求得的最大特征值对应的特征向量：');
disp(W);

%% 直接利用matlab自带的函数求解
clear;
B = [1,1/5,1/3; 5,1,3; 3,1/3,1]; %判断矩阵
[x,y] = eig(B); %求矩阵的特征值和特征向量，x为特征向量矩阵，y为特征值矩阵。
eigenvalue = diag(y); %求对角线向量
lamda_max = max(eigenvalue); %求最大特征值
for i=1:length(B) %求最大特征值对应的序数
    if lamda_max==eigenvalue(i)
        break;
    end
end
y_lamda = x(:,i); %求矩阵最大特征值对应的特征向量
disp(['MATLAB函数求得的最大特征值：',num2str(lamda_max)]);
disp('MATLAB函数求得的最大特征值对应的特征向量：');
disp(y_lamda);