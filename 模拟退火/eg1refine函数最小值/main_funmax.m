%*************************************************
%Simulated Annealing Algorithm
% Specific Problem: Max value of the function
% Oswald's practice : 27 Aug 2025
%*************************************************
%% 1.Draw the graph of the function.

%本行调试用
clear;clc;
x=linspace(-3,3,1000);
plot(x,Obj_fun1(x),'b','LineWidth',1);
xlabel('x');
ylabel('Obj_fun1');
grid on;
hold on;
%% 2.Generate the initial guess
T=100;%initial temperature
Ft=1;%Final temperature
alpha=0.8;%Coefficient of temperature drop;
Nil=10;%Number of inner loop iterations
Ig=6*rand()-3;% initial guess
%Ycurrent=zeros(1,ceil());%This vector restore the current value of the function
%fprintf('原始随机解：%f\n',Ig);

Obj_fun1Ig=Obj_fun1(Ig); 
pcp = scatter(Ig,Obj_fun1Ig,72,'b','+');% plot current point
pmp = scatter(Ig,Obj_fun1Ig,72,'r','*');% plot max point

Max=Obj_fun1Ig;%max value of the function
MaxPoint=Ig;     %the point where we get max value
%% 3.Simulated Annealing Algorithm
while 1

    % fprintf('温度：%f\n',T);


    for i=1:Nil
        % fprintf('i=%d',i);%本行调试用
        Ns=fans(Ig,T);%new solution

        % fprintf('生成新解%f\n',Ns);
        Ig=cmpns(Ns,Ig,T);%compare Ns,Ig and use the Simulated Annealing Algorithm to complete the assignment.

        pause(0.01);
        %pcp.XData = [];  pcp.YData = [];
        Obj_fun1Ig=Obj_fun1(Ig);
        pcp.XData =Ig; pcp.YData =Obj_fun1Ig;
        
        %pcp = scatter(Ig,Obj_fun1(Ig),72,'r','*');%draw the current point

        if Obj_fun1Ig>Max
            Max=Obj_fun1Ig;
            MaxPoint=Ig;
            % fprintf('更新最大值f(%f)=%f',MaxPoint,Max);
            pause(0.01);
            pmp.XData =MaxPoint;  pmp.YData =Max;
            %pmp = scatter(MaxPoint,Max,72,'m','+');%draw the max point
        end
    end


    T=alpha*T;%temperature decrease a time after searching for 10 times
    if T<Ft
        break;
    end

end
fprintf('寻找到的最大值为：f(%f)=%f',MaxPoint,Max);

%% 4.draw the function of time
