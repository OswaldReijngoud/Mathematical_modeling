%%
%*************************************************
% Maximin Model and Monte Carlo Method
% Specific Problem: Location Problem
% Oswald's practice : 27 Aug 2025
%*************************************************
%% 1.use monte carlo method to find x(initial guess)
clear;clc;
n=1000000; %trail time
x= unifrnd(3,8,n,1);
y= unifrnd(4,10,n,1);

a=[1 4 3 5 9 12 6 20 17 8];
b=[2 10 8 18 1 4 5 10 8 9];
minmaxTdj=+inf;
for j=1:n
    Tdj=zeros(10,1);%The ten distances corresponding to the j - th location
    for i = 1:10
        Tdj(i) = abs(x(j)-a(i))+abs(y(j)-b(i));
    end
    if max(Tdj)<minmaxTdj
        minmaxTdj=max(Tdj);
        x0best=x(j);y0best=y(j);
    end
end
x0=[x0best,y0best];
disp('x0:');
disp(x0);
%% �����С��ģ��  :   min{max[f1,f2,������,fm]}
%fminimax(FUN,x,A,B,Aeq,Beq,LB,UB,NONLCON,options,varargin)
% x0 = [6, 6];      % ������ʼֵ
lb = [3, 4];  % ���߱������½�
ub = [8, 10];  % ���߱������Ͻ�
[x,feval] = fminimax(@Fun,x0,[],[],[],[],lb,ub)
disp('��С�������룺');
max(feval)
% x =
%    6.9632    9.5368
% feval =
%    13.5000    5.5000    5.5000   12.5000    8.5000    8.5000    5.5000   13.5000    9.5000    0.5000
% ���ۣ�
% ������Ϊ(6.9632,9.5368)��������Ӧ���Ŀ���ʹ�õ㵽����������������С����С��������Ϊ13.5��λ��