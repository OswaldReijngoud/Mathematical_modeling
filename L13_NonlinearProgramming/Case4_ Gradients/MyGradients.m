%主程序
clc
clear
options=optimset('GradObj','on','GradConstr','on');%options 配置：
                                                   % 'GradObj','on' ：开启目标函数梯度（fun10 中 df ）的使用，让 fmincon 利用梯度信息优化迭代。
                                                   % 'GradConstr','on' ：开启约束条件梯度（fun11 中 dc ）的使用，加速约束满足过程。
[x,y]=fmincon(@fun10,rand(2,1),[],[],[],[],[],[],@fun11,options)
