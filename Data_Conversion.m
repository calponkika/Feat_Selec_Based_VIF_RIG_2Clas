function  Num_Dataset =Data_Conversion(K)
NewDat=Grp_class(K); %%and it has big cladd 
% % % % Split M into numerical split and categorical splits
M1=NewDat(:,[1,5:41]); 
M2=NewDat(:,[2:4,42:43]); %%column 2,3,4, and 42,43 last columns, 42==5classes,43==2 classes 
Md= table2array(M1);
[r,c]=size(M2);
K1=zeros(r,c); %%Preallocation
%%%Unique arrange attack acording to alphabetic, for instance for
%%%column42,,normal has value 2  while on column 43//normal has 2 and
%%%attack has1
for i=1:c
[~,~,G]=unique(M2(:,i)); %%unique fxn tranform categorical into numericla
K1(:,i)=G; %%yo ibara ihereye kuri 1 kugeza kuri 4, while K(:4) and K1(:,5)is class label 
end
 %%Reoganise your data //Keep the initial label that was binded on dataset
  Num_Dataset=[Md(:,1) K1(:,1:3) Md(:,2:38) K1(:,4:5)]; 
end