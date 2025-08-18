% 无约束问题的matlab求解
% 这段 MATLAB 代码用于求解二元函数的极值点，并判断其类型（极大值点、极小值点或非极值点）。

clc, clear
syms x y
f=x^3-y^3+3*x^2+3*y^2-9*x; % 【仅修改此行：替换为新函数】
df=jacobian(f);  %求一阶偏导数
d2f=jacobian(df); %求Hessian阵
[xx,yy]=solve(df)  %求驻点
xx=double(xx);yy=double(yy); 
for i=1:length(xx)
    a=subs(d2f,{x,y},{xx(i),yy(i)});  
    b=eig(a);  %求矩阵的特征值
    f=subs(f,{x,y},{xx(i),yy(i)});
    if all(b>0)
        fprintf('(%f,%f)是极小值点,对应的极小值为%f\n',xx(i),yy(i),f);
    elseif all(b<0)
        fprintf('(%f,%f)是极大值点,对应的极大值为%f\n',xx(i),yy(i),f);
    elseif any(b>0) & any(b<0)
        fprintf('(%f,%f)不是极值点\n',xx(i),yy(i));
    else
        fprintf('无法判断(%f,%f)是否是极值点\n',xx(i),yy(i));  
    end
end

