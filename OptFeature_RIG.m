 function [AccIG] = OptFeature_RIG(OptInp_vifRIG,Targets)  
%%This will be used letter 
[~,c]=size(OptInp_vifRIG);
P=[40,50,60];
L=length(P);
N=zeros(1,L);
AccIG=zeros(3,L);
for i=1:L
n=round(length(P(i)*c)/100);
N(i)=n;
Inp=OptInp_vifRIG(:,N);
Acc_Prec_Fpr=NNW_Alg3Metr(Inp',Targets);
% Perfomance_All{i}= Acc_Prec_Fpr;
           AccIG(:,i)=Acc_Prec_Fpr;
          Acc1=AccIG(1,:);
          Precion=AccIG(2,:);
          FPRate=AccIG(3,:);
end
  fprintf('Sn0 |Accuracy |Precison |FPR rate|\n')
 fprintf('-----------------------------------\n')
for j=1:L
 fprintf('%2d |%3.2f     |%3.2f    |%3.3f     | \n',L(j),Acc1(j),Precion(j), FPRate(j))
 end

% fprintf('The VIF for the above feature is %3.2f\n',SVIF);

 end  
  
    
           
           
           
           
           
           
           
           
   