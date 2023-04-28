function [New_Inp]=Severe_VIF_Removal(Mn3) 
VIF_1=VIF(Mn3); 
Nk_idx=find(VIF_1<10); %%Not severe colinearIdx
NK=Nk_idx;
New_Inp=Mn3(:,NK);
end
