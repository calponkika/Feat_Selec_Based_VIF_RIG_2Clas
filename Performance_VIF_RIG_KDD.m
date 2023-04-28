function   [OptSeqMeth]=Performance_VIF_RIG_KDD(~,~)  %OptSeqMeth,T %

 %load Sample_sizeKDDcup1
 % M=Selectedsample2; 
  load SampleKDDCUP18M
  M=Selectedsample18M;   %%CHEK THRESHOLD VIF [[DECISON, OPTMAL, DECISION}}
  
   Num_Dataset=Data_Conversion(M);%  K={Num_Dataset}; to pick the matrix 
  Num_Dataset1=[Num_Dataset(:,1:41) Num_Dataset(:,43)];  
 [K,PreFS]=Zero_SdtRemvl_Modified(Num_Dataset1);  %%K useless, press will be a new matrix after removing useless include class label 

 [Inputs,Targets]=DataMorph_NNW(PreFS);

%  Q={Inputs',Targets};
 Y=PreFS(:,end); %%It will be used for information gain 
%PREPROCESSING  //it is mandatory betcause NNW is sensitive to unscale data
B=OutlierRemovalFxn.IsOutlier_3p5_Median(Inputs);
Bscaled=MinMaxScaling(B); %%PER 99.62
%  B=OutlierRemovalFxn.IsOutlier_3p1_Mean(Inputs); %%
 %Bscaled=zscore(B);
%  Bscaled=MinMaxScaling(B);
   fprintf('===================================================\n')
    InpAcc=Bscaled'; %%We need olny one sample
    %%%Multicollinearity detection by using VIF
    %%%This must be crutial,because 
    %%% No1:collinear ,redudant and dependent features, ziza muri gain values or in %%correlated value iyo zitavanwemo//it means will be among selected by filter/wraper
    %%No2: The accuracy izaha hejuru overfitting,,Imagine using 4 all% dependent features [zaguha accuracy iri hejuru , nyamara zose zihagarirwa n'imwe///
    %%No3: rushuffling order of features in NWW AFFECT THE PERFROMANCE!! NIYO MPAMVU TUTEMEREWE GUKORA BACKPROPAGEATION KURI FULL FEATURES, HATABAYEHO FEATURE SCALING
   % % No 4 UKO SCALING PERFROM ON SPECIFIC DATA, THE SAME  NO FEATURE SCALING MEHTOD IS GOOD.//
   % % nO 5: WHATEVER YOU DO [1.FEATURE SCALING, REMOVE DEPENDENT, COLLINEAR , FEATURE SELECTION TO AVOID RANKING COLLINEAR OR DEPENDENT FEATURE)[ 
   % %  No 6 : then respect [ZODFS-VIF-IG]] OR [ZODFS-VIF-RIG]
    
    %Inpt_N_VIF=Severe_VIF_Removal(M,K,InpAcc');  
    Inpt_N_VIF=Severe_VIF_Removal(InpAcc'); 
  
    fprintf('=====================================\n')
    fprintf('Apply VIF  on your Sample\n')
       fprintf('Same features could have # ans after changing due to wights initialization\n')
    fprintf('=====================================\n')
     Decison_VIF(M,K,InpAcc');
     fprintf('=====================================\n')
     Accuracy_VIF_Removal=NNW_Alg3Metr(Inpt_N_VIF',Targets); 
   fprintf('The Accuracy is %3.2f, the precision is %3.2f and FPR is %3.3f\n',   Accuracy_VIF_Removal(1),  Accuracy_VIF_Removal(2),   Accuracy_VIF_Removal(3))
  
   Acc_IGVIF=OptFeat_IG_VIF(M,K,InpAcc',Y,Targets);   %%InpAcc' Irakoreshwa muri recalcul of vif 
%     % =================================
  
 fprintf('The output of this project is listed below\n')
 fprintf('Ans=[Reults,Optimal performance, optimal input, optimal selected feature]\n')
%OptSeqMeth={Acc_Transf,Acc_TIG,Acc_RIG,Accuracy_VIF_Removal,Acc_IGVIF};
OptSeqMeth={Accuracy_VIF_Removal, Acc_IGVIF};
 save   Acc_kddcBinOk1
 %%We need 
end






