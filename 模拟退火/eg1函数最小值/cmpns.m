function y=cmpns(Ns,Ig,T)%compare Ns,Ig and use the Simulated Annealing Algorithm to complete the assignment.
Obj_fun1Ns=Obj_fun1(Ns);
Obj_fun1Ig=Obj_fun1(Ig);
%fprintf('原始解%f对应函数值为%f\n',Ig,Obj_fun1Ig);
%fprintf('新的解%f对应函数值为%f\n',Ns,Obj_fun1Ns);

    if Obj_fun1Ns>Obj_fun1Ig
%        disp('新解更大,新解作为比较值');
        y=Ns;
    else
 %       disp("原解更大");
        Pac=exp(-abs(Obj_fun1Ns-Obj_fun1Ig)/T);%probability of acceptance
  %      fprintf('有%f%%的几率接受新解,',100*Pac);
        p=rand();
        if p<Pac
  %          fprintf('p值为%f,新解作为比较值\n',p);
            y=Ns;
        else 
  %          fprintf('p值为%f,原解作为比较值\n',p);
            y=Ig;
        end
    end
 %   fprintf('\n*****************分隔*****************\n');
end