function Diff=indexing_Feature(A,B)
[~,k]=size(A);
% k=c-1; %%why c-1???
Ind=zeros(1,k);
for j=1:k
Ind(j)=j; 
end
Diff=setdiff(Ind,B);%%The operation must be between index,
end
%%A=[3,8,9,12,13,25,59];
%B=[2,3];%index zivamo 
%%Diff=1,4,5,6,7]  kuko 2,3 index zavuyemo