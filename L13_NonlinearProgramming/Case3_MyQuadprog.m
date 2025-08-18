%[X,fval,exitflag,output,lambda] = quadprog(H,f,A,B,Aeq,Beq,lb,ub,X0,options,varargin)

clc; clear;
h=[4,-4;-4,8];
f=[-6;-3];
a=[1,1;4,1];
b=[3;9];
[x,value]=quadprog(h,f,a,b,[],[],zeros(2,1))
