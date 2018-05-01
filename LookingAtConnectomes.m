%% Testing
clear all
%cd '/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/TC002/DWI/Preproc1/TC002_diff1'
cd '/Users/guigub/Downloads/ConnectivityProject'


%imagesc(connMat)

%% Importing the data

cd '/Users/guigub/Downloads/ConnectivityProject/Aicha_with_DLPFC/CC_Group'
Aicha_DLPFC_CC_file='ALL_CC_run1_Aicha_with_DLPFC_spConn.xlsx';
[Aicha_DLPFC_CC_data, Aicha_DLPFC_CC_vars, Aicha_DLPFC_CC_raw]=xlsread(Aicha_DLPFC_CC_file);

cd '/Users/guigub/Downloads/ConnectivityProject/Aicha_with_DLPFC/HC_Group'
Aicha_DLPFC_HC_file='ALL_HC_run1_Aicha_with_DLPFC_spConn.xlsx';
[Aicha_DLPFC_HC_data, Aicha_DLPFC_HC_vars, Aicha_DLPFC_HC_raw]=xlsread(Aicha_DLPFC_HC_file);

cd '/Users/guigub/Downloads/ConnectivityProject/Brainnetome_with_DLPFC/CC_Group'
BN_DLPFC_CC_file='ALL_CC_run1_Brainnetome_with_DLPFC_spConn.xlsx';
[BN_DLPFC_CC_data, BN_DLPFC_CC_vars, BN_DLPFC_CC_raw]=xlsread(BN_DLPFC_CC_file);

cd '/Users/guigub/Downloads/ConnectivityProject/Brainnetome_with_DLPFC/HC_Group'
BN_DLPFC_HC_file='ALL_HC_run1_Brainnetome_with_DLPFC_spConn.xlsx';
[BN_DLPFC_HC_data, BN_DLPFC_HC_vars, BN_DLPFC_HC_raw]=xlsread(BN_DLPFC_HC_file);




cd '/Users/guigub/Downloads/ConnectivityProject/Aicha_1mm/CC_Group'
Aicha_DLPFC_split_CC_file='ALL_CC_run1_AICHA_1mm_spConn.xlsx';
[Aicha_DLPFC_split_CC_data, Aicha_DLPFC_split_CC_vars, Aicha_DLPFC_split_CC_raw]=xlsread(Aicha_DLPFC_split_CC_file);

cd '/Users/guigub/Downloads/ConnectivityProject/Aicha_1mm/HC_Group'
Aicha_DLPFC_split_HC_file='ALL_HC_run1_AICHA_1mm_spConn.xlsx';
[Aicha_DLPFC_split_HC_data, Aicha_DLPFC_split_HC_vars, Aicha_DLPFC_split_HC_raw]=xlsread(Aicha_DLPFC_split_HC_file);

cd '/Users/guigub/Downloads/ConnectivityProject/BN_Atlas_246_1mm/CC_Group'
BN_DLPFC_split_CC_file='ALL_CC_run1_BN_Atlas_246_1mm_spConn.xlsx';
[BN_DLPFC_split_CC_data, BN_DLPFC_split_CC_vars, BN_DLPFC_split_CC_raw]=xlsread(BN_DLPFC_split_CC_file);

cd '/Users/guigub/Downloads/ConnectivityProject/BN_Atlas_246_1mm/HC_Group'
BN_DLPFC_split_HC_file='ALL_HC_run1_BN_Atlas_246_1mm_spConn.xlsx';
[BN_DLPFC_split_HC_data, BN_DLPFC_split_HC_vars, BN_DLPFC_split_HC_raw]=xlsread(BN_DLPFC_split_HC_file);

e=[Aicha_DLPFC_CC_data(1,:)' Aicha_DLPFC_HC_data(1,:)']
d=[Aicha_DLPFC_split_CC_data(1,:)' Aicha_DLPFC_split_HC_data(1,:)']
q=[BN_DLPFC_CC_data(1,:)' BN_DLPFC_HC_data(1,:)']
a=[BN_DLPFC_split_CC_data(1,:)' BN_DLPFC_split_HC_data(1,:)']

%% Separating data

CC_subs=unique(Aicha_DLPFC_CC_vars);
HC_subs=unique(Aicha_DLPFC_HC_vars);
rDLPFCIdx=20;
lDLPFCIdx=21;

AICHA_rDLPFC_splitIdx=[20 22 24 26 28];
AICHA_lDLPFC_splitIdx=[19 21 23 25 27];
BN_rDLPFC_splitIdx=[16 20 22];
BN_lDLPFC_splitIdx=[15 19 21];

%AICHA_DLPFC
Aicha_CC_rDLPFC_conn=Aicha_DLPFC_CC_data(1,:);
for i=1:size(CC_subs,1);
    Aicha_CC_rDLPFC_conn=[Aicha_CC_rDLPFC_conn;Aicha_DLPFC_CC_data(find(strcmp(Aicha_DLPFC_CC_vars(:,1),CC_subs(i,1))==1 & Aicha_DLPFC_CC_data(:,1)==rDLPFCIdx),:)];
end

Aicha_CC_lDLPFC_conn=Aicha_DLPFC_CC_data(1,:);
for i=1:size(CC_subs,1);
    Aicha_CC_lDLPFC_conn=[Aicha_CC_lDLPFC_conn;Aicha_DLPFC_CC_data(find(strcmp(Aicha_DLPFC_CC_vars(:,1),CC_subs(i,1))==1 & Aicha_DLPFC_CC_data(:,1)==lDLPFCIdx),:)];
end

for i=1:size(AICHA_rDLPFC_splitIdx,2);
    tmp1=[];
    for j=1:size(CC_subs,1);
        tmp1=[tmp1;Aicha_DLPFC_split_CC_data(find(strcmp(Aicha_DLPFC_split_CC_vars(:,1),CC_subs(j,1))==1 & ...
            Aicha_DLPFC_split_CC_data(:,1)==AICHA_rDLPFC_splitIdx(1,i)),:)];
    end
    eval(['Aicha_CC_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i))...
        '= [Aicha_DLPFC_split_CC_data(1,:);tmp1]']);
end

for i=1:size(AICHA_lDLPFC_splitIdx,2);
    tmp1=[];
    for j=1:size(CC_subs,1);
        tmp1=[tmp1;Aicha_DLPFC_split_CC_data(find(strcmp(Aicha_DLPFC_split_CC_vars(:,1),CC_subs(j,1))==1 & ...
            Aicha_DLPFC_split_CC_data(:,1)==AICHA_lDLPFC_splitIdx(1,i)),:)];
    end
    eval(['Aicha_CC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i))...
        '= [Aicha_DLPFC_split_CC_data(1,:);tmp1]']);
end



Aicha_HC_rDLPFC_conn=Aicha_DLPFC_HC_data(1,:);
for i=1:size(HC_subs,1);
    Aicha_HC_rDLPFC_conn=[Aicha_HC_rDLPFC_conn;Aicha_DLPFC_HC_data(find(strcmp(Aicha_DLPFC_HC_vars(:,1),HC_subs(i,1))==1 & Aicha_DLPFC_HC_data(:,1)==rDLPFCIdx),:)];
end

Aicha_HC_lDLPFC_conn=Aicha_DLPFC_HC_data(1,:);
for i=1:size(HC_subs,1);
    Aicha_HC_lDLPFC_conn=[Aicha_HC_lDLPFC_conn;Aicha_DLPFC_HC_data(find(strcmp(Aicha_DLPFC_HC_vars(:,1),HC_subs(i,1))==1 & Aicha_DLPFC_HC_data(:,1)==lDLPFCIdx),:)];
end



for i=1:size(AICHA_rDLPFC_splitIdx,2);
    tmp1=[];
    for j=1:size(HC_subs,1);
        tmp1=[tmp1;Aicha_DLPFC_split_HC_data(find(strcmp(Aicha_DLPFC_split_HC_vars(:,1),HC_subs(j,1))==1 & ...
            Aicha_DLPFC_split_HC_data(:,1)==AICHA_rDLPFC_splitIdx(1,i)),:)];
    end
    eval(['Aicha_HC_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i))...
        '= [Aicha_DLPFC_split_HC_data(1,:);tmp1]']);
end


for i=1:size(AICHA_lDLPFC_splitIdx,2);
    tmp1=[];
    for j=1:size(HC_subs,1);
        tmp1=[tmp1;Aicha_DLPFC_split_HC_data(find(strcmp(Aicha_DLPFC_split_HC_vars(:,1),HC_subs(j,1))==1 & ...
            Aicha_DLPFC_split_HC_data(:,1)==AICHA_lDLPFC_splitIdx(1,i)),:)];
    end
    eval(['Aicha_HC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i))...
        '= [Aicha_DLPFC_split_HC_data(1,:);tmp1]']);
end





HMat=[];%NOTE:H=1 means that null hypothesis can be rejected and the means are statistically different
PMat=[];
MDMat=[];
for i=2:size(Aicha_CC_rDLPFC_conn,2);
    [P,H]=ranksum(Aicha_CC_rDLPFC_conn(2:end,i),Aicha_HC_rDLPFC_conn(2:end,i));
    MDiff=nanmean(Aicha_CC_rDLPFC_conn(2:end,i))-nanmean(Aicha_HC_rDLPFC_conn(2:end,i));%Negative number means higher connectivity in HC than CC
    HMat=[HMat H];
    PMat=[PMat P];
    MDMat=[MDMat MDiff];
end

Aicha_rDLPFCResults=[Aicha_CC_rDLPFC_conn(1,2:end);HMat;PMat;MDMat];
Aicha_rDLPFCSigResults=Aicha_rDLPFCResults(:,find(Aicha_rDLPFCResults(2,:)==1));

FDR=mafdr(PMat','BHFDR',true);
find(FDR<0.05)

AICHA_rDLPFC_SCs_Pvals=ones(size(AICHA_rDLPFC_splitIdx,2),size(Aicha_CC_rDLPFC_conn,2))*999;
for i=1:size(AICHA_rDLPFC_splitIdx,2);
    for j=2:size(Aicha_CC_rDLPFC_conn,2);
        [tmp1P,tmp1H]=ranksum(eval(['Aicha_CC_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i)) '(2:end,j)']),...
            eval(['Aicha_HC_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i)) '(2:end,j)']));
        AICHA_rDLPFC_SCs_Pvals(i,j)=tmp1P;
    end
end
AICHA_rDLPFC_SCs_Pvals=AICHA_rDLPFC_SCs_Pvals(:,2:end);



for i=1:size(AICHA_rDLPFC_SCs_Pvals,1);
    FDR=mafdr(AICHA_rDLPFC_SCs_Pvals(i,:)','BHFDR',true);
    Aicha_rDLPFC_sigs=find(FDR<0.05);
end




HMat=[];%NOTE:H=1 means that null hypothesis can be rejected and the means are statistically different
PMat=[];
MDMat=[];
for i=2:size(Aicha_CC_lDLPFC_conn,2);
    [P,H]=ranksum(Aicha_CC_lDLPFC_conn(2:end,i),Aicha_HC_lDLPFC_conn(2:end,i));
    MDiff=nanmean(Aicha_CC_lDLPFC_conn(2:end,i))-nanmean(Aicha_HC_lDLPFC_conn(2:end,i));%Negative number means higher connectivity in HC than CC
    HMat=[HMat H];
    PMat=[PMat P];
    MDMat=[MDMat MDiff];
end

Aicha_lDLPFCResults=[Aicha_CC_lDLPFC_conn(1,2:end);HMat;PMat;MDMat];
Aicha_lDLPFCSigResults=Aicha_lDLPFCResults(:,find(Aicha_lDLPFCResults(2,:)==1));

FDR=mafdr(PMat','BHFDR',true);
find(FDR<0.05)


AICHA_lDLPFC_SCs_Pvals=ones(size(AICHA_lDLPFC_splitIdx,2),size(Aicha_CC_lDLPFC_conn,2))*999;
for i=1:size(AICHA_lDLPFC_splitIdx,2);
    for j=2:size(Aicha_CC_lDLPFC_conn,2);
%         [tmp1P,tmp1H]=ranksum(eval(['Aicha_CC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i)) '(2:end,j)']),...
%             eval(['Aicha_HC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i)) '(2:end,j)']));
        [tmp1H,tmp1P]=ttest2(eval(['Aicha_CC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i)) '(2:end,j)']),...
            eval(['Aicha_HC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i)) '(2:end,j)']));
        AICHA_lDLPFC_SCs_Pvals(i,j)=tmp1P;
    end
end
AICHA_lDLPFC_SCs_Pvals=AICHA_lDLPFC_SCs_Pvals(:,2:end);


for i=1:size(AICHA_lDLPFC_SCs_Pvals,1);
    FDR=mafdr(AICHA_lDLPFC_SCs_Pvals(i,:)','BHFDR',true);
    Aicha_lDLPFC_sigs=find(FDR<0.05);
end




%BN_DLPFC
BN_CC_rDLPFC_conn=BN_DLPFC_CC_data(1,:);
for i=1:size(CC_subs,1);
    BN_CC_rDLPFC_conn=[BN_CC_rDLPFC_conn;BN_DLPFC_CC_data(find(strcmp(BN_DLPFC_CC_vars(:,1),CC_subs(i,1))==1 & BN_DLPFC_CC_data(:,1)==rDLPFCIdx),:)];
end

BN_CC_lDLPFC_conn=BN_DLPFC_CC_data(1,:);
for i=1:size(CC_subs,1);
    BN_CC_lDLPFC_conn=[BN_CC_lDLPFC_conn;BN_DLPFC_CC_data(find(strcmp(BN_DLPFC_CC_vars(:,1),CC_subs(i,1))==1 & BN_DLPFC_CC_data(:,1)==lDLPFCIdx),:)];
end

for i=1:size(BN_rDLPFC_splitIdx,2);
    tmp1=[];
    for j=1:size(CC_subs,1);
        tmp1=[tmp1;BN_DLPFC_split_CC_data(find(strcmp(BN_DLPFC_split_CC_vars(:,1),CC_subs(j,1))==1 & ...
            BN_DLPFC_split_CC_data(:,1)==BN_rDLPFC_splitIdx(1,i)),:)];
    end
    eval(['BN_CC_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i))...
        '= [BN_DLPFC_split_CC_data(1,:);tmp1]']);
end

for i=1:size(BN_lDLPFC_splitIdx,2);
    tmp1=[];
    for j=1:size(CC_subs,1);
        tmp1=[tmp1;BN_DLPFC_split_CC_data(find(strcmp(BN_DLPFC_split_CC_vars(:,1),CC_subs(j,1))==1 & ...
            BN_DLPFC_split_CC_data(:,1)==BN_lDLPFC_splitIdx(1,i)),:)];
    end
    eval(['BN_CC_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i))...
        '= [BN_DLPFC_split_CC_data(1,:);tmp1]']);
end


BN_HC_rDLPFC_conn=BN_DLPFC_HC_data(1,:);
for i=1:size(HC_subs,1);
    BN_HC_rDLPFC_conn=[BN_HC_rDLPFC_conn;BN_DLPFC_HC_data(find(strcmp(BN_DLPFC_HC_vars(:,1),HC_subs(i,1))==1 & BN_DLPFC_HC_data(:,1)==rDLPFCIdx),:)];
end

BN_HC_lDLPFC_conn=BN_DLPFC_HC_data(1,:);
for i=1:size(HC_subs,1);
    BN_HC_lDLPFC_conn=[BN_HC_lDLPFC_conn;BN_DLPFC_HC_data(find(strcmp(BN_DLPFC_HC_vars(:,1),HC_subs(i,1))==1 & BN_DLPFC_HC_data(:,1)==lDLPFCIdx),:)];
end


for i=1:size(BN_rDLPFC_splitIdx,2);
    tmp1=[];
    for j=1:size(HC_subs,1);
        tmp1=[tmp1;BN_DLPFC_split_HC_data(find(strcmp(BN_DLPFC_split_HC_vars(:,1),HC_subs(j,1))==1 & ...
            BN_DLPFC_split_HC_data(:,1)==BN_rDLPFC_splitIdx(1,i)),:)];
    end
    eval(['BN_HC_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i))...
        '= [BN_DLPFC_split_HC_data(1,:);tmp1]']);
end

for i=1:size(BN_lDLPFC_splitIdx,2);
    tmp1=[];
    for j=1:size(HC_subs,1);
        tmp1=[tmp1;BN_DLPFC_split_HC_data(find(strcmp(BN_DLPFC_split_HC_vars(:,1),HC_subs(j,1))==1 & ...
            BN_DLPFC_split_HC_data(:,1)==BN_lDLPFC_splitIdx(1,i)),:)];
    end
    eval(['BN_HC_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i))...
        '= [BN_DLPFC_split_HC_data(1,:);tmp1]']);
end




HMat=[];%NOTE:H=1 means that null hypothesis can be rejected and the means are statistically different
PMat=[];
MDMat=[];
for i=2:size(BN_CC_rDLPFC_conn,2);
    [P,H]=ranksum(BN_CC_rDLPFC_conn(2:end,i),BN_HC_rDLPFC_conn(2:end,i));
    MDiff=nanmean(BN_CC_rDLPFC_conn(2:end,i))-nanmean(BN_HC_rDLPFC_conn(2:end,i));%Negative number means higher connectivity in HC than CC
    HMat=[HMat H];
    PMat=[PMat P];
    MDMat=[MDMat MDiff];
end

BN_rDLPFCResults=[BN_CC_rDLPFC_conn(1,2:end);HMat;PMat;MDMat];
BN_rDLPFCSigReults=BN_rDLPFCResults(:,find(BN_rDLPFCResults(2,:)==1));



FDR=mafdr(PMat','BHFDR',true);
find(FDR<0.05)


BN_rDLPFC_SCs_Pvals=ones(size(BN_rDLPFC_splitIdx,2),size(BN_CC_rDLPFC_conn,2))*999;
for i=1:size(BN_rDLPFC_splitIdx,2);
    for j=2:size(BN_CC_rDLPFC_conn,2);
        [tmp1P,tmp1H]=ranksum(eval(['BN_CC_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i)) '(2:end,j)']),...
            eval(['BN_HC_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i)) '(2:end,j)']));
        BN_rDLPFC_SCs_Pvals(i,j)=tmp1P;
    end
end
BN_rDLPFC_SCs_Pvals=BN_rDLPFC_SCs_Pvals(:,2:end);


for i=1:size(BN_rDLPFC_SCs_Pvals,1);
    FDR=mafdr(BN_rDLPFC_SCs_Pvals(i,:)','BHFDR',true);
    BN_rDLPFC_sigs=find(FDR<0.05);
end





HMat=[];%NOTE:H=1 means that null hypothesis can be rejected and the means are statistically different
PMat=[];
MDMat=[];
for i=2:size(BN_CC_lDLPFC_conn,2);
    [P,H]=ranksum(BN_CC_lDLPFC_conn(2:end,i),BN_HC_lDLPFC_conn(2:end,i));
    MDiff=nanmean(BN_CC_lDLPFC_conn(2:end,i))-nanmean(BN_HC_lDLPFC_conn(2:end,i));%Negative number means higher connectivity in HC than CC
    HMat=[HMat H];
    PMat=[PMat P];
    MDMat=[MDMat MDiff];
end

BN_lDLPFCResults=[BN_CC_lDLPFC_conn(1,2:end);HMat;PMat;MDMat];
BN_lDLPFCSigReults=BN_lDLPFCResults(:,find(BN_lDLPFCResults(2,:)==1));


FDR=mafdr(PMat','BHFDR',true);
find(FDR<0.05)


BN_lDLPFC_SCs_Pvals=ones(size(BN_lDLPFC_splitIdx,2),size(BN_CC_lDLPFC_conn,2))*999;
for i=1:size(BN_lDLPFC_splitIdx,2);
    for j=2:size(BN_CC_lDLPFC_conn,2);
        [tmp1P,tmp1H]=ranksum(eval(['BN_CC_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i)) '(2:end,j)']),...
            eval(['BN_HC_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i)) '(2:end,j)']));
        BN_lDLPFC_SCs_Pvals(i,j)=tmp1P;
    end
end
BN_lDLPFC_SCs_Pvals=BN_lDLPFC_SCs_Pvals(:,2:end);


for i=1:size(BN_lDLPFC_SCs_Pvals,1);
    FDR=mafdr(BN_lDLPFC_SCs_Pvals(i,:)','BHFDR',true);
    BN_lDLPFC_sigs=find(FDR<0.05);
end


Aicha_rDLPFC_sigs
Aicha_lDLPFC_sigs
BN_rDLPFC_sigs
BN_lDLPFC_sigs

%% Labelling the results

cd '/Users/guigub/Downloads/ConnectivityProject'
Aicha_list_file='AICHA_vol1.xlsx';
[Aicha_list_data, Aicha_list_vars, Aicha_list_raw]=xlsread(Aicha_list_file);
Aicha_labels=Aicha_list_vars(2:end,1);

cd '/Users/guigub/Downloads/ConnectivityProject'
BN_list_file='Brainnetome.xlsx';
[BN_list_data, BN_list_vars, BN_list_raw]=xlsread(BN_list_file);
BN_labels=BN_list_vars(2:end,1);

Aicha_sig_rlabels=[];
for i=1:size(Aicha_rDLPFCSigResults,2)
    Aicha_sig_rlabels=[Aicha_sig_rlabels Aicha_labels(find(Aicha_list_data(:,1)==Aicha_rDLPFCSigResults(1,i)),1)];
end

Aicha_sig_llabels=[];
for i=1:size(Aicha_lDLPFCSigResults,2)
    Aicha_sig_llabels=[Aicha_sig_llabels Aicha_labels(find(Aicha_list_data(:,1)==Aicha_lDLPFCSigResults(1,i)),1)];
end


Aicha_rDLPFCSigResults(5,:)=Aicha_sig_labels;


Aicha_lDLPFCSigResults


%% Binarizing the connectivity matrices


binAicha_CC_rDLPFC_conn=Aicha_CC_rDLPFC_conn(2:end,2:end);
binAicha_CC_rDLPFC_conn=logical(binAicha_CC_rDLPFC_conn);
degAicha_CC_rDLPFC=nansum(binAicha_CC_rDLPFC_conn,2);

binAicha_HC_rDLPFC_conn=Aicha_HC_rDLPFC_conn(2:end,2:end);
binAicha_HC_rDLPFC_conn=logical(binAicha_HC_rDLPFC_conn);
degAicha_HC_rDLPFC=nansum(binAicha_HC_rDLPFC_conn,2);

binAicha_CC_lDLPFC_conn=Aicha_CC_lDLPFC_conn(2:end,2:end);
binAicha_CC_lDLPFC_conn=logical(binAicha_CC_lDLPFC_conn);
degAicha_CC_lDLPFC=nansum(binAicha_CC_lDLPFC_conn,2);

binAicha_HC_lDLPFC_conn=Aicha_HC_lDLPFC_conn(2:end,2:end);
binAicha_HC_lDLPFC_conn=logical(binAicha_HC_lDLPFC_conn);
degAicha_HC_lDLPFC=nansum(binAicha_HC_lDLPFC_conn,2);

binAicha_CC_rDLPFC_sc20=Aicha_CC_rDLPFC_sc20(2:end,2:end);
binAicha_CC_rDLPFC_sc20=logical(binAicha_CC_rDLPFC_sc20)
degAicha_CC_rDLPFC_sc20=nansum(binAicha_CC_rDLPFC_sc20,2)

binAicha_HC_rDLPFC_sc20=Aicha_HC_rDLPFC_sc20(2:end,2:end);
binAicha_HC_rDLPFC_sc20=logical(binAicha_HC_rDLPFC_sc20)
degAicha_HC_rDLPFC_sc20=nansum(binAicha_HC_rDLPFC_sc20,2)

binAicha_CC_rDLPFC_sc22=Aicha_CC_rDLPFC_sc22(2:end,2:end);
binAicha_CC_rDLPFC_sc22=logical(binAicha_CC_rDLPFC_sc22)
degAicha_CC_rDLPFC_sc22=nansum(binAicha_CC_rDLPFC_sc22,2)

binAicha_HC_rDLPFC_sc22=Aicha_HC_rDLPFC_sc22(2:end,2:end);
binAicha_HC_rDLPFC_sc22=logical(binAicha_HC_rDLPFC_sc22)
degAicha_HC_rDLPFC_sc22=nansum(binAicha_HC_rDLPFC_sc22,2)

binAicha_CC_rDLPFC_sc24=Aicha_CC_rDLPFC_sc24(2:end,2:end);
binAicha_CC_rDLPFC_sc24=logical(binAicha_CC_rDLPFC_sc24)
degAicha_CC_rDLPFC_sc24=nansum(binAicha_CC_rDLPFC_sc24,2)

binAicha_HC_rDLPFC_sc24=Aicha_HC_rDLPFC_sc24(2:end,2:end);
binAicha_HC_rDLPFC_sc24=logical(binAicha_HC_rDLPFC_sc24)
degAicha_HC_rDLPFC_sc24=nansum(binAicha_HC_rDLPFC_sc24,2)

binAicha_CC_rDLPFC_sc26=Aicha_CC_rDLPFC_sc26(2:end,2:end);
binAicha_CC_rDLPFC_sc26=logical(binAicha_CC_rDLPFC_sc26)
degAicha_CC_rDLPFC_sc26=nansum(binAicha_CC_rDLPFC_sc26,2)

binAicha_HC_rDLPFC_sc26=Aicha_HC_rDLPFC_sc26(2:end,2:end);
binAicha_HC_rDLPFC_sc26=logical(binAicha_HC_rDLPFC_sc26)
degAicha_HC_rDLPFC_sc26=nansum(binAicha_HC_rDLPFC_sc26,2)

binAicha_CC_rDLPFC_sc28=Aicha_CC_rDLPFC_sc28(2:end,2:end);
binAicha_CC_rDLPFC_sc28=logical(binAicha_CC_rDLPFC_sc28)
degAicha_CC_rDLPFC_sc28=nansum(binAicha_CC_rDLPFC_sc28,2)

binAicha_HC_rDLPFC_sc28=Aicha_HC_rDLPFC_sc28(2:end,2:end);
binAicha_HC_rDLPFC_sc28=logical(binAicha_HC_rDLPFC_sc28)
degAicha_HC_rDLPFC_sc28=nansum(binAicha_HC_rDLPFC_sc28,2)

binAicha_CC_lDLPFC_sc19=Aicha_CC_lDLPFC_sc21(2:end,2:end);
binAicha_CC_lDLPFC_sc19=logical(binAicha_CC_lDLPFC_sc21);
degAicha_CC_lDLPFC_sc19=nansum(binAicha_CC_lDLPFC_sc21,2);

binAicha_HC_lDLPFC_sc19=Aicha_HC_lDLPFC_sc19(2:end,2:end);
binAicha_HC_lDLPFC_sc19=logical(binAicha_HC_lDLPFC_sc19);
degAicha_HC_lDLPFC_sc19=nansum(binAicha_HC_lDLPFC_sc19,2);

binAicha_CC_lDLPFC_sc21=Aicha_CC_lDLPFC_sc21(2:end,2:end);
binAicha_CC_lDLPFC_sc21=logical(binAicha_CC_lDLPFC_sc21);
degAicha_CC_lDLPFC_sc21=nansum(binAicha_CC_lDLPFC_sc21,2);

binAicha_HC_lDLPFC_sc21=Aicha_HC_lDLPFC_sc21(2:end,2:end);
binAicha_HC_lDLPFC_sc21=logical(binAicha_HC_lDLPFC_sc21);
degAicha_HC_lDLPFC_sc21=nansum(binAicha_HC_lDLPFC_sc21,2);

binAicha_CC_lDLPFC_sc23=Aicha_CC_lDLPFC_sc23(2:end,2:end);
binAicha_CC_lDLPFC_sc23=logical(binAicha_CC_lDLPFC_sc23);
degAicha_CC_lDLPFC_sc23=nansum(binAicha_CC_lDLPFC_sc23,2);

binAicha_HC_lDLPFC_sc23=Aicha_HC_lDLPFC_sc23(2:end,2:end);
binAicha_HC_lDLPFC_sc23=logical(binAicha_HC_lDLPFC_sc23);
degAicha_HC_lDLPFC_sc23=nansum(binAicha_HC_lDLPFC_sc23,2);

binAicha_CC_lDLPFC_sc25=Aicha_CC_lDLPFC_sc25(2:end,2:end);
binAicha_CC_lDLPFC_sc25=logical(binAicha_CC_lDLPFC_sc25);
degAicha_CC_lDLPFC_sc25=nansum(binAicha_CC_lDLPFC_sc25,2);

binAicha_HC_lDLPFC_sc25=Aicha_HC_lDLPFC_sc25(2:end,2:end);
binAicha_HC_lDLPFC_sc25=logical(binAicha_HC_lDLPFC_sc25);
degAicha_HC_lDLPFC_sc25=nansum(binAicha_HC_lDLPFC_sc25,2);

binAicha_CC_lDLPFC_sc27=Aicha_CC_lDLPFC_sc27(2:end,2:end);
binAicha_CC_lDLPFC_sc27=logical(binAicha_CC_lDLPFC_sc27);
degAicha_CC_lDLPFC_sc27=nansum(binAicha_CC_lDLPFC_sc27,2);

binAicha_HC_lDLPFC_sc27=Aicha_HC_lDLPFC_sc27(2:end,2:end);
binAicha_HC_lDLPFC_sc27=logical(binAicha_HC_lDLPFC_sc27);
degAicha_HC_lDLPFC_sc27=nansum(binAicha_HC_lDLPFC_sc27,2);

binBN_CC_rDLPFC_conn=BN_CC_rDLPFC_conn(2:end,2:end);
binBN_CC_rDLPFC_conn=logical(binBN_CC_rDLPFC_conn);
degBN_CC_rDLPFC=nansum(binBN_CC_rDLPFC_conn,2);

binBN_HC_rDLPFC_conn=BN_HC_rDLPFC_conn(2:end,2:end);
binBN_HC_rDLPFC_conn=logical(binBN_HC_rDLPFC_conn);
degBN_HC_rDLPFC=nansum(binBN_HC_rDLPFC_conn,2);

binBN_CC_lDLPFC_conn=BN_CC_lDLPFC_conn(2:end,2:end);
binBN_CC_lDLPFC_conn=logical(binBN_CC_lDLPFC_conn);
degBN_CC_lDLPFC=nansum(binBN_CC_lDLPFC_conn,2);

binBN_HC_lDLPFC_conn=BN_HC_lDLPFC_conn(2:end,2:end);
binBN_HC_lDLPFC_conn=logical(binBN_HC_lDLPFC_conn);
degBN_HC_lDLPFC=nansum(binBN_HC_lDLPFC_conn,2);

binBN_CC_rDLPFC_sc16=BN_CC_rDLPFC_sc16(2:end,2:end);
binBN_CC_rDLPFC_sc16=logical(binBN_CC_rDLPFC_sc16);
degBN_CC_rDLPFC_sc16=nansum(binBN_CC_rDLPFC_sc16,2);

binBN_HC_rDLPFC_sc16=BN_HC_rDLPFC_sc16(2:end,2:end);
binBN_HC_rDLPFC_sc16=logical(binBN_HC_rDLPFC_sc16);
degBN_HC_rDLPFC_sc16=nansum(binBN_HC_rDLPFC_sc16,2);

binBN_CC_rDLPFC_sc20=BN_CC_rDLPFC_sc20(2:end,2:end);
binBN_CC_rDLPFC_sc20=logical(binBN_CC_rDLPFC_sc20);
degBN_CC_rDLPFC_sc20=nansum(binBN_CC_rDLPFC_sc20,2);

binBN_HC_rDLPFC_sc20=BN_HC_rDLPFC_sc20(2:end,2:end);
binBN_HC_rDLPFC_sc20=logical(binBN_HC_rDLPFC_sc20);
degBN_HC_rDLPFC_sc20=nansum(binBN_HC_rDLPFC_sc20,2);

binBN_CC_rDLPFC_sc22=BN_CC_rDLPFC_sc22(2:end,2:end);
binBN_CC_rDLPFC_sc22=logical(binBN_CC_rDLPFC_sc22);
degBN_CC_rDLPFC_sc22=nansum(binBN_CC_rDLPFC_sc22,2);

binBN_HC_rDLPFC_sc22=BN_HC_rDLPFC_sc22(2:end,2:end);
binBN_HC_rDLPFC_sc22=logical(binBN_HC_rDLPFC_sc22);
degBN_HC_rDLPFC_sc22=nansum(binBN_HC_rDLPFC_sc22,2);

binBN_CC_lDLPFC_sc15=BN_CC_lDLPFC_sc15(2:end,2:end);
binBN_CC_lDLPFC_sc15=logical(binBN_CC_lDLPFC_sc15);
degBN_CC_lDLPFC_sc15=nansum(binBN_CC_lDLPFC_sc15,2);

binBN_HC_lDLPFC_sc15=BN_HC_lDLPFC_sc15(2:end,2:end);
binBN_HC_lDLPFC_sc15=logical(binBN_HC_lDLPFC_sc15);
degBN_HC_lDLPFC_sc15=nansum(binBN_HC_lDLPFC_sc15,2);

binBN_CC_lDLPFC_sc19=BN_CC_lDLPFC_sc19(2:end,2:end);
binBN_CC_lDLPFC_sc19=logical(binBN_CC_lDLPFC_sc19);
degBN_CC_lDLPFC_sc19=nansum(binBN_CC_lDLPFC_sc19,2);

binBN_HC_lDLPFC_sc19=BN_HC_lDLPFC_sc19(2:end,2:end);
binBN_HC_lDLPFC_sc19=logical(binBN_HC_lDLPFC_sc19);
degBN_HC_lDLPFC_sc19=nansum(binBN_HC_lDLPFC_sc19,2);

binBN_CC_lDLPFC_sc21=BN_CC_lDLPFC_sc21(2:end,2:end);
binBN_CC_lDLPFC_sc21=logical(binBN_CC_lDLPFC_sc21);
degBN_CC_lDLPFC_sc21=nansum(binBN_CC_lDLPFC_sc21,2);

binBN_HC_lDLPFC_sc21=BN_HC_lDLPFC_sc21(2:end,2:end);
binBN_HC_lDLPFC_sc21=logical(binBN_HC_lDLPFC_sc21);
degBN_HC_lDLPFC_sc21=nansum(binBN_HC_lDLPFC_sc21,2);






%% Repository

% binAicha_CC_rDLPFC_conn=Aicha_CC_rDLPFC_conn(2:end,2:end);
% binAicha_CC_rDLPFC_conn=binAicha_CC_rDLPFC_conn*10^6
% for i=1:size(binAicha_CC_rDLPFC_conn,1);
%     for j=1:size(binAicha_CC_rDLPFC_conn,2);
%         if binAicha_CC_rDLPFC_conn(i,j)>0;
%             binAicha_CC_rDLPFC_conn(i,j)=1;
%         elseif binAicha_CC_rDLPFC_conn(i,j)==0;
%             binAicha_CC_rDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% degAicha_CC_rDLPFC=nansum(binAicha_CC_rDLPFC_conn,2)
% kstest(degAicha_CC_rDLPFC)
% 
% 
% 
% binAicha_CC_lDLPFC_conn=Aicha_CC_lDLPFC_conn(2:end,2:end);
% binAicha_CC_lDLPFC_conn=binAicha_CC_lDLPFC_conn*10^6
% for i=1:size(binAicha_CC_lDLPFC_conn,1);
%     for j=1:size(binAicha_CC_lDLPFC_conn,2);
%         if binAicha_CC_lDLPFC_conn(i,j)>0;
%             binAicha_CC_lDLPFC_conn(i,j)=1;
%         elseif binAicha_CC_lDLPFC_conn(i,j)==0;
%             binAicha_CC_lDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% degAicha_CC_lDLPFC=nansum(binAicha_CC_lDLPFC_conn,2)
% kstest(degAicha_CC_lDLPFC)
% 
% 
% binAicha_CC_rDLPFC_sc20=Aicha_CC_rDLPFC_sc20(2:end,2:end);
% binAicha_CC_rDLPFC_sc20=binAicha_CC_rDLPFC_sc20*10^6
% for i=1:size(binAicha_CC_rDLPFC_conn,1);
%     for j=1:size(binAicha_CC_rDLPFC_conn,2);
%         if binAicha_CC_rDLPFC_conn(i,j)>0;
%             binAicha_CC_rDLPFC_conn(i,j)=1;
%         elseif binAicha_CC_rDLPFC_conn(i,j)==0;
%             binAicha_CC_rDLPFC_conn(i,j)=0;
%         end
%     end
% end
% binAicha_CC_rDLPFC_sc20=logical(binAicha_CC_rDLPFC_sc20)
% degAicha_CC_rDLPFC_sc20=nansum(binAicha_CC_rDLPFC_sc20,2)
% kstest(degAicha_CC_rDLPFC_sc20)
% 
% 
% 
% binAicha_CC_lDLPFC_conn=Aicha_CC_lDLPFC_conn(2:end,2:end);
% binAicha_CC_lDLPFC_conn=binAicha_CC_lDLPFC_conn*10^6
% for i=1:size(binAicha_CC_lDLPFC_conn,1);
%     for j=1:size(binAicha_CC_lDLPFC_conn,2);
%         if binAicha_CC_lDLPFC_conn(i,j)>0;
%             binAicha_CC_lDLPFC_conn(i,j)=1;
%         elseif binAicha_CC_lDLPFC_conn(i,j)==0;
%             binAicha_CC_lDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% binBN_CC_rDLPFC_conn=BN_CC_rDLPFC_conn(2:end,2:end);
% binBN_CC_rDLPFC_conn=binBN_CC_rDLPFC_conn*10^6
% for i=1:size(binBN_CC_rDLPFC_conn,1);
%     for j=1:size(binBN_CC_rDLPFC_conn,2);
%         if binBN_CC_rDLPFC_conn(i,j)>0;
%             binBN_CC_rDLPFC_conn(i,j)=1;
%         elseif binBN_CC_rDLPFC_conn(i,j)==0;
%             binBN_CC_rDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% degBN_CC_rDLPFC=nansum(binBN_CC_rDLPFC_conn,2)
% kstest(degBN_CC_rDLPFC)
% 
% 
% binBN_CC_lDLPFC_conn=BN_CC_lDLPFC_conn(2:end,2:end);
% binBN_CC_lDLPFC_conn=binBN_CC_lDLPFC_conn*10^6
% for i=1:size(binBN_CC_lDLPFC_conn,1);
%     for j=1:size(binBN_CC_lDLPFC_conn,2);
%         if binBN_CC_lDLPFC_conn(i,j)>0;
%             binBN_CC_lDLPFC_conn(i,j)=1;
%         elseif binBN_CC_lDLPFC_conn(i,j)==0;
%             binBN_CC_lDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% degBN_CC_lDLPFC=nansum(binBN_CC_lDLPFC_conn,2)
% kstest(degBN_CC_lDLPFC)
% 
% 
% 
% 
% 
% binAicha_HC_rDLPFC_conn=Aicha_HC_rDLPFC_conn(2:end,2:end);
% binAicha_HC_rDLPFC_conn=binAicha_HC_rDLPFC_conn*10^6
% for i=1:size(binAicha_HC_rDLPFC_conn,1);
%     for j=1:size(binAicha_HC_rDLPFC_conn,2);
%         if binAicha_HC_rDLPFC_conn(i,j)>0;
%             binAicha_HC_rDLPFC_conn(i,j)=1;
%         elseif binAicha_HC_rDLPFC_conn(i,j)==0;
%             binAicha_HC_rDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% degAicha_HC_rDLPFC=nansum(binAicha_HC_rDLPFC_conn,2)
% kstest(degAicha_HC_rDLPFC)
% 
% 
% 
% binAicha_HC_lDLPFC_conn=Aicha_HC_lDLPFC_conn(2:end,2:end);
% binAicha_HC_lDLPFC_conn=binAicha_HC_lDLPFC_conn*10^6
% for i=1:size(binAicha_HC_lDLPFC_conn,1);
%     for j=1:size(binAicha_HC_lDLPFC_conn,2);
%         if binAicha_HC_lDLPFC_conn(i,j)>0;
%             binAicha_HC_lDLPFC_conn(i,j)=1;
%         elseif binAicha_HC_lDLPFC_conn(i,j)==0;
%             binAicha_HC_lDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% degAicha_HC_lDLPFC=nansum(binAicha_HC_lDLPFC_conn,2)
% kstest(degAicha_HC_lDLPFC)
% 
% 
% 
% 
% 
% binBN_HC_rDLPFC_conn=BN_HC_rDLPFC_conn(2:end,2:end);
% binBN_HC_rDLPFC_conn=binBN_HC_rDLPFC_conn*10^6
% for i=1:size(binBN_HC_rDLPFC_conn,1);
%     for j=1:size(binBN_HC_rDLPFC_conn,2);
%         if binBN_HC_rDLPFC_conn(i,j)>0;
%             binBN_HC_rDLPFC_conn(i,j)=1;
%         elseif binBN_HC_rDLPFC_conn(i,j)==0;
%             binBN_HC_rDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% degBN_HC_rDLPFC=nansum(binBN_HC_rDLPFC_conn,2)
% kstest(degBN_HC_rDLPFC)
% 
% 
% binBN_HC_lDLPFC_conn=BN_HC_lDLPFC_conn(2:end,2:end);
% binBN_HC_lDLPFC_conn=binBN_HC_lDLPFC_conn*10^6
% for i=1:size(binBN_HC_lDLPFC_conn,1);
%     for j=1:size(binBN_HC_lDLPFC_conn,2);
%         if binBN_HC_lDLPFC_conn(i,j)>0;
%             binBN_HC_lDLPFC_conn(i,j)=1;
%         elseif binBN_HC_lDLPFC_conn(i,j)==0;
%             binBN_HC_lDLPFC_conn(i,j)=0;
%         end
%     end
% end
% 
% degBN_HC_lDLPFC=nansum(binBN_HC_lDLPFC_conn,2)





%% Compare nodal degrees

[H,P]=ttest2(degAicha_HC_rDLPFC,degAicha_CC_rDLPFC)
[H,P]=ttest2(degAicha_HC_lDLPFC,degAicha_CC_lDLPFC)
[H,P]=ttest2(degBN_HC_rDLPFC,degBN_CC_rDLPFC)
[H,P]=ttest2(degBN_HC_lDLPFC,degBN_CC_lDLPFC)

[H,P]=ttest2(degAicha_HC_rDLPFC_sc20,degAicha_CC_rDLPFC_sc20)
[H,P]=ttest2(degAicha_HC_rDLPFC_sc22,degAicha_CC_rDLPFC_sc22)
[H,P]=ttest2(degAicha_HC_rDLPFC_sc24,degAicha_CC_rDLPFC_sc24)%SIGNIFICANT (doesn't survive Bonferroni but most likely survives FDR)
Mdiff=nanmean(degAicha_CC_rDLPFC_sc24)-nanmean(degAicha_HC_rDLPFC_sc24)%Less connected

[H,P]=ttest2(degAicha_HC_rDLPFC_sc26,degAicha_CC_rDLPFC_sc26)
[H,P]=ttest2(degAicha_HC_rDLPFC_sc28,degAicha_CC_rDLPFC_sc28)
[H,P]=ttest2(degAicha_HC_lDLPFC_sc19,degAicha_CC_lDLPFC_sc19)%HIGHLY SIGNIFICANT (survives Bonferroni)
MDiff=nanmean(degAicha_CC_lDLPFC_sc19)-nanmean(degAicha_HC_lDLPFC_sc19)%More connected


[H,P]=ttest2(degAicha_HC_lDLPFC_sc21,degAicha_CC_lDLPFC_sc21)
[H,P]=ttest2(degAicha_HC_lDLPFC_sc23,degAicha_CC_lDLPFC_sc23)
[H,P]=ttest2(degAicha_HC_lDLPFC_sc25,degAicha_CC_lDLPFC_sc25)
[H,P]=ttest2(degAicha_HC_lDLPFC_sc27,degAicha_CC_lDLPFC_sc27)

[H,P]=ttest2(degBN_HC_rDLPFC_sc16,degBN_CC_rDLPFC_sc16)
[H,P]=ttest2(degBN_HC_rDLPFC_sc20,degBN_CC_rDLPFC_sc20)
[H,P]=ttest2(degBN_HC_rDLPFC_sc22,degBN_CC_rDLPFC_sc22)
[H,P]=ttest2(degBN_HC_lDLPFC_sc15,degBN_CC_lDLPFC_sc15)
[H,P]=ttest2(degBN_HC_lDLPFC_sc19,degBN_CC_lDLPFC_sc19)
[H,P]=ttest2(degBN_HC_lDLPFC_sc21,degBN_CC_lDLPFC_sc21)