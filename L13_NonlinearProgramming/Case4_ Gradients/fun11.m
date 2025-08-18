function [c,ceq,dc,dceq]=fun11(x)
%函数fun11.m定义约束条件及约束条件的梯度函数
c=[x(1)*x(2)-x(1)-x(2)+1.5;-x(1)*x(2)-10];
dc=[x(2)-1,-x(2);x(1)-1,-x(1)];
ceq=[];dceq=[];

