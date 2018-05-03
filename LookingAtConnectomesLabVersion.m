%% Importing the data

clear all

cd '/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/ConnectivityProject/Aicha_1mm/CC_Group'
Aicha_DLPFC_split_CC_file='ALL_CC_run1_AICHA_1mm_spConn.xlsx';
[Aicha_DLPFC_split_CC_data, Aicha_DLPFC_split_CC_vars, Aicha_DLPFC_split_CC_raw]=xlsread(Aicha_DLPFC_split_CC_file);

cd '/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/ConnectivityProject/Aicha_1mm/HC_Group'
Aicha_DLPFC_split_HC_file='ALL_HC_run1_AICHA_1mm_spConn.xlsx';
[Aicha_DLPFC_split_HC_data, Aicha_DLPFC_split_HC_vars, Aicha_DLPFC_split_HC_raw]=xlsread(Aicha_DLPFC_split_HC_file);

cd '/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/ConnectivityProject/BN_Atlas_246_1mm/CC_Group'
BN_DLPFC_split_CC_file='ALL_CC_run1_BN_Atlas_246_1mm_spConn.xlsx';
[BN_DLPFC_split_CC_data, BN_DLPFC_split_CC_vars, BN_DLPFC_split_CC_raw]=xlsread(BN_DLPFC_split_CC_file);

cd '/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/ConnectivityProject/BN_Atlas_246_1mm/HC_Group'
BN_DLPFC_split_HC_file='ALL_HC_run1_BN_Atlas_246_1mm_spConn.xlsx';
[BN_DLPFC_split_HC_data, BN_DLPFC_split_HC_vars, BN_DLPFC_split_HC_raw]=xlsread(BN_DLPFC_split_HC_file);


%% Separating data

CC_subs=unique(Aicha_DLPFC_split_CC_vars);
HC_subs=unique(Aicha_DLPFC_split_HC_vars);
% rDLPFCIdx=20;
% lDLPFCIdx=21;

AICHA_rDLPFC_splitIdx=[20 22 24 26 28];
AICHA_lDLPFC_splitIdx=[19 21 23 25 27];
BN_rDLPFC_splitIdx=[16 20 22];
BN_lDLPFC_splitIdx=[15 19 21];



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





%% Binarizing the connectivity matrices

binAicha_CC_rDLPFC_sc20=Aicha_CC_rDLPFC_sc20(2:end,2:end);
binAicha_CC_rDLPFC_sc20=logical(binAicha_CC_rDLPFC_sc20);
degAicha_CC_rDLPFC_sc20=nansum(binAicha_CC_rDLPFC_sc20,2);

binAicha_HC_rDLPFC_sc20=Aicha_HC_rDLPFC_sc20(2:end,2:end);
binAicha_HC_rDLPFC_sc20=logical(binAicha_HC_rDLPFC_sc20);
degAicha_HC_rDLPFC_sc20=nansum(binAicha_HC_rDLPFC_sc20,2);

binAicha_CC_rDLPFC_sc22=Aicha_CC_rDLPFC_sc22(2:end,2:end);
binAicha_CC_rDLPFC_sc22=logical(binAicha_CC_rDLPFC_sc22);
degAicha_CC_rDLPFC_sc22=nansum(binAicha_CC_rDLPFC_sc22,2);

binAicha_HC_rDLPFC_sc22=Aicha_HC_rDLPFC_sc22(2:end,2:end);
binAicha_HC_rDLPFC_sc22=logical(binAicha_HC_rDLPFC_sc22);
degAicha_HC_rDLPFC_sc22=nansum(binAicha_HC_rDLPFC_sc22,2);

binAicha_CC_rDLPFC_sc24=Aicha_CC_rDLPFC_sc24(2:end,2:end);
binAicha_CC_rDLPFC_sc24=logical(binAicha_CC_rDLPFC_sc24);
degAicha_CC_rDLPFC_sc24=nansum(binAicha_CC_rDLPFC_sc24,2);

binAicha_HC_rDLPFC_sc24=Aicha_HC_rDLPFC_sc24(2:end,2:end);
binAicha_HC_rDLPFC_sc24=logical(binAicha_HC_rDLPFC_sc24);
degAicha_HC_rDLPFC_sc24=nansum(binAicha_HC_rDLPFC_sc24,2);

binAicha_CC_rDLPFC_sc26=Aicha_CC_rDLPFC_sc26(2:end,2:end);
binAicha_CC_rDLPFC_sc26=logical(binAicha_CC_rDLPFC_sc26);
degAicha_CC_rDLPFC_sc26=nansum(binAicha_CC_rDLPFC_sc26,2);

binAicha_HC_rDLPFC_sc26=Aicha_HC_rDLPFC_sc26(2:end,2:end);
binAicha_HC_rDLPFC_sc26=logical(binAicha_HC_rDLPFC_sc26);
degAicha_HC_rDLPFC_sc26=nansum(binAicha_HC_rDLPFC_sc26,2);

binAicha_CC_rDLPFC_sc28=Aicha_CC_rDLPFC_sc28(2:end,2:end);
binAicha_CC_rDLPFC_sc28=logical(binAicha_CC_rDLPFC_sc28);
degAicha_CC_rDLPFC_sc28=nansum(binAicha_CC_rDLPFC_sc28,2);

binAicha_HC_rDLPFC_sc28=Aicha_HC_rDLPFC_sc28(2:end,2:end);
binAicha_HC_rDLPFC_sc28=logical(binAicha_HC_rDLPFC_sc28);
degAicha_HC_rDLPFC_sc28=nansum(binAicha_HC_rDLPFC_sc28,2);

binAicha_CC_lDLPFC_sc19=Aicha_CC_lDLPFC_sc19(2:end,2:end);
binAicha_CC_lDLPFC_sc19=logical(binAicha_CC_lDLPFC_sc19);
degAicha_CC_lDLPFC_sc19=nansum(binAicha_CC_lDLPFC_sc19,2);

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

test1=Aicha_CC_lDLPFC_sc27(2:end,2:end);
test1=test1(:,57)
test2=Aicha_HC_lDLPFC_sc27(2:end,2:end);
test2=test2(:,57)
kstest(test1)
ranksum(test1,test2)

binAicha_CC_lDLPFC_sc27=logical(binAicha_CC_lDLPFC_sc27);
degAicha_CC_lDLPFC_sc27=nansum(binAicha_CC_lDLPFC_sc27,2);

binAicha_HC_lDLPFC_sc27=Aicha_HC_lDLPFC_sc27(2:end,2:end);
binAicha_HC_lDLPFC_sc27=logical(binAicha_HC_lDLPFC_sc27);
degAicha_HC_lDLPFC_sc27=nansum(binAicha_HC_lDLPFC_sc27,2);


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


%% Compare nodal degrees

[H1,P1]=ttest2(degAicha_HC_rDLPFC_sc20,degAicha_CC_rDLPFC_sc20);
[H2,P2]=ttest2(degAicha_HC_rDLPFC_sc22,degAicha_CC_rDLPFC_sc22);
[H3,P3]=ttest2(degAicha_HC_rDLPFC_sc24,degAicha_CC_rDLPFC_sc24);%SIGNIFICANT
[H4,P4]=ttest2(degAicha_HC_rDLPFC_sc26,degAicha_CC_rDLPFC_sc26);
[H5,P5]=ttest2(degAicha_HC_rDLPFC_sc28,degAicha_CC_rDLPFC_sc28);
[H6,P6]=ttest2(degAicha_HC_lDLPFC_sc19,degAicha_CC_lDLPFC_sc19);
[H7,P7]=ttest2(degAicha_HC_lDLPFC_sc21,degAicha_CC_lDLPFC_sc21);
[H8,P8]=ttest2(degAicha_HC_lDLPFC_sc23,degAicha_CC_lDLPFC_sc23);
[H9,P9]=ttest2(degAicha_HC_lDLPFC_sc25,degAicha_CC_lDLPFC_sc25);
[H10,P10]=ttest2(degAicha_HC_lDLPFC_sc27,degAicha_CC_lDLPFC_sc27);
[H11,P11]=ttest2(degBN_HC_rDLPFC_sc16,degBN_CC_rDLPFC_sc16);
[H12,P12]=ttest2(degBN_HC_rDLPFC_sc20,degBN_CC_rDLPFC_sc20);
[H13,P13]=ttest2(degBN_HC_rDLPFC_sc22,degBN_CC_rDLPFC_sc22);
[H14,P14]=ttest2(degBN_HC_lDLPFC_sc15,degBN_CC_lDLPFC_sc15);
[H15,P15]=ttest2(degBN_HC_lDLPFC_sc19,degBN_CC_lDLPFC_sc19);
[H16,P16]=ttest2(degBN_HC_lDLPFC_sc21,degBN_CC_lDLPFC_sc21);

Mdiff1=nanmean(degAicha_HC_rDLPFC_sc20)-nanmean(degAicha_CC_rDLPFC_sc20);
Mdiff2=nanmean(degAicha_HC_rDLPFC_sc22)-nanmean(degAicha_CC_rDLPFC_sc22);
Mdiff3=nanmean(degAicha_HC_rDLPFC_sc24)-nanmean(degAicha_CC_rDLPFC_sc24);
Mdiff4=nanmean(degAicha_HC_rDLPFC_sc26)-nanmean(degAicha_CC_rDLPFC_sc26);
Mdiff5=nanmean(degAicha_HC_rDLPFC_sc28)-nanmean(degAicha_CC_rDLPFC_sc28);
Mdiff6=nanmean(degAicha_HC_lDLPFC_sc19)-nanmean(degAicha_CC_lDLPFC_sc19);
Mdiff7=nanmean(degAicha_HC_lDLPFC_sc21)-nanmean(degAicha_CC_lDLPFC_sc21);
Mdiff8=nanmean(degAicha_HC_lDLPFC_sc23)-nanmean(degAicha_CC_lDLPFC_sc23);
Mdiff9=nanmean(degAicha_HC_lDLPFC_sc25)-nanmean(degAicha_CC_lDLPFC_sc25);
Mdiff10=nanmean(degAicha_HC_lDLPFC_sc27)-nanmean(degAicha_CC_lDLPFC_sc27);
Mdiff11=nanmean(degBN_HC_rDLPFC_sc16)-nanmean(degBN_CC_rDLPFC_sc16);
Mdiff12=nanmean(degBN_HC_rDLPFC_sc20)-nanmean(degBN_CC_rDLPFC_sc20);
Mdiff13=nanmean(degBN_HC_rDLPFC_sc22)-nanmean(degBN_CC_rDLPFC_sc22);
Mdiff14=nanmean(degBN_HC_lDLPFC_sc15)-nanmean(degBN_CC_lDLPFC_sc15);
Mdiff15=nanmean(degBN_HC_lDLPFC_sc19)-nanmean(degBN_CC_lDLPFC_sc19);
Mdiff16=nanmean(degBN_HC_lDLPFC_sc21)-nanmean(degBN_CC_lDLPFC_sc21);


ConnResultsLvl1=[H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16;P1 P2 P3 P4 P5 P6 P7 P8 P9 P10 P11 P12 P13 P14 P15 P16;...
    Mdiff1 Mdiff2 Mdiff3 Mdiff4 Mdiff5 Mdiff6 Mdiff7 Mdiff8 Mdiff9 Mdiff10 Mdiff11 Mdiff12 Mdiff13 Mdiff14 Mdiff15 Mdiff16]


%% Studying connectivity strength 
AICHA_rDLPFC_SCs_Pvals=ones(size(AICHA_rDLPFC_splitIdx,2),size(Aicha_CC_rDLPFC_sc28,2)-1)*999;%the variable for the size is chosen at random. All AICHA_SC mats have the same number of columns.
for i=1:size(AICHA_rDLPFC_splitIdx,2);
        tmp1=mean(eval(['binAicha_CC_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i))]));
        tmp2=mean(eval(['binAicha_HC_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i))]));
        tmpidx=find(tmp1==1 & tmp2==1);
    for j=1:size(tmpidx,2);
        [tmp1P,tmp1H]=ranksum(eval(['Aicha_CC_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i)) '(2:end,tmpidx(1,j)+1)']),...
            eval(['Aicha_HC_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i)) '(2:end,tmpidx(1,j)+1)']));
        AICHA_rDLPFC_SCs_Pvals(i,tmpidx(1,j))=tmp1P;
    end
end

AICHA_rDLPFC_SCs_Pvals(size(AICHA_rDLPFC_SCs_Pvals,1)+1,:)=Aicha_CC_rDLPFC_sc28(1,2:end);

test=reshape(AICHA_rDLPFC_SCs_Pvals(1:end-1,:),1,'')
test2=reshape(AICHA_rDLPFC_SCs_Pvals(end,:),1,'')
test=test(:,find(test(:,:)~=999))
FDR=mafdr(test)
find(FDR<=0.05)

for i=1:size(AICHA_rDLPFC_splitIdx,2);
        eval(['AICHA_rDLPFC_sc' num2str(AICHA_rDLPFC_splitIdx(1,i))...
        '= AICHA_rDLPFC_SCs_Pvals([size(AICHA_rDLPFC_SCs_Pvals,1) i],find(AICHA_rDLPFC_SCs_Pvals(i,:)~=999))']);
end
%Results: area 24 and 28 with each other, and area 28 with area 360.


AICHA_lDLPFC_SCs_Pvals=ones(size(AICHA_lDLPFC_splitIdx,2),size(Aicha_CC_rDLPFC_sc28,2)-1)*999;%the variable for the size is chosen at random. All AICHA_SC mats have the same number of columns.
for i=1:size(AICHA_lDLPFC_splitIdx,2);
        tmp1=mean(eval(['binAicha_CC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i))]));
        tmp2=mean(eval(['binAicha_HC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i))]));
        tmpidx=find(tmp1==1 & tmp2==1);
    for j=1:size(tmpidx,2);
        [tmp1P,tmp1H]=ranksum(eval(['Aicha_CC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i)) '(2:end,tmpidx(1,j)+1)']),...
            eval(['Aicha_HC_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i)) '(2:end,tmpidx(1,j)+1)']));
        AICHA_lDLPFC_SCs_Pvals(i,tmpidx(1,j))=tmp1P;
    end
end

AICHA_lDLPFC_SCs_Pvals(size(AICHA_lDLPFC_SCs_Pvals,1)+1,:)=Aicha_CC_rDLPFC_sc28(1,2:end);

test=reshape(AICHA_lDLPFC_SCs_Pvals(1:end-1,:),1,'')
test=test(:,find(test(:,:)~=999))
FDR=mafdr(test)
find(FDR<=0.05)


for i=1:size(AICHA_lDLPFC_splitIdx,2);
        eval(['AICHA_lDLPFC_sc' num2str(AICHA_lDLPFC_splitIdx(1,i))...
        '= AICHA_lDLPFC_SCs_Pvals([size(AICHA_lDLPFC_SCs_Pvals,1) i],find(AICHA_lDLPFC_SCs_Pvals(i,:)~=999))']);
end

%Results: area 27 with area 57.



BN_rDLPFC_SCs_Pvals=ones(size(BN_rDLPFC_splitIdx,2),size(BN_CC_rDLPFC_sc22,2)-1)*999;%the variable for the size is chosen at random. All AICHA_SC mats have the same number of columns.
for i=1:size(BN_rDLPFC_splitIdx,2);
        tmp1=mean(eval(['binBN_CC_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i))]));
        tmp2=mean(eval(['binBN_HC_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i))]));
        tmpidx=find(tmp1==1 & tmp2==1);
    for j=1:size(tmpidx,2);
        [tmp1P,tmp1H]=ranksum(eval(['BN_CC_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i)) '(2:end,tmpidx(1,j)+1)']),...
            eval(['BN_HC_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i)) '(2:end,tmpidx(1,j)+1)']));
        BN_rDLPFC_SCs_Pvals(i,tmpidx(1,j))=tmp1P;
    end
end

BN_rDLPFC_SCs_Pvals(size(BN_rDLPFC_SCs_Pvals,1)+1,:)=BN_CC_rDLPFC_sc22(1,2:end);

test=reshape(BN_rDLPFC_SCs_Pvals(1:end-1,:),1,'')
test=test(:,find(test(:,:)~=999))
FDR=mafdr(test)
find(FDR<=0.05)

for i=1:size(BN_rDLPFC_splitIdx,2);
        eval(['BN_rDLPFC_sc' num2str(BN_rDLPFC_splitIdx(1,i))...
        '= BN_rDLPFC_SCs_Pvals([size(BN_rDLPFC_SCs_Pvals,1) i],find(BN_rDLPFC_SCs_Pvals(i,:)~=999))']);
end

%Results: Area 22 with area 246.



BN_lDLPFC_SCs_Pvals=ones(size(BN_lDLPFC_splitIdx,2),size(BN_CC_rDLPFC_sc22,2)-1)*999;%the variable for the size is chosen at random. All AICHA_SC mats have the same number of columns.
for i=1:size(BN_lDLPFC_splitIdx,2);
        tmp1=mean(eval(['binBN_CC_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i))]));
        tmp2=mean(eval(['binBN_HC_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i))]));
        tmpidx=find(tmp1==1 & tmp2==1);
    for j=1:size(tmpidx,2);
        [tmp1P,tmp1H]=ranksum(eval(['BN_CC_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i)) '(2:end,tmpidx(1,j)+1)']),...
            eval(['BN_HC_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i)) '(2:end,tmpidx(1,j)+1)']));
        BN_lDLPFC_SCs_Pvals(i,tmpidx(1,j))=tmp1P;
    end
end

BN_lDLPFC_SCs_Pvals(size(BN_lDLPFC_SCs_Pvals,1)+1,:)=BN_CC_rDLPFC_sc22(1,2:end);

test=reshape(BN_lDLPFC_SCs_Pvals(1:end-1,:),1,'')
test=test(:,find(test(:,:)~=999))
FDR=mafdr(test)
find(FDR<=0.05)

for i=1:size(BN_lDLPFC_splitIdx,2);
        eval(['BN_lDLPFC_sc' num2str(BN_lDLPFC_splitIdx(1,i))...
        '= BN_lDLPFC_SCs_Pvals([size(BN_lDLPFC_SCs_Pvals,1) i],find(BN_lDLPFC_SCs_Pvals(i,:)~=999))']);
end

%Results: No significant differences.
%% Probing the differences
%This section needs to be run after a ProbingConnDiffs.sh script is run on
%command line.


%AICHA rDLPFC 24 with 28; 28 with 360
ROIs=[24 28 360];
Mdiffs1=[];
for i=1:size(ROIs,2);
    Mdiffs1=[Mdiffs1; ROIs(1,i) nanmean(Aicha_CC_rDLPFC_sc24(2:end,find(Aicha_CC_rDLPFC_sc24(1,:)==ROIs(1,i))))-nanmean(Aicha_HC_rDLPFC_sc24(2:end,find(Aicha_HC_rDLPFC_sc24(1,:)==ROIs(1,i)))) ...
        nanmean(Aicha_CC_rDLPFC_sc28(2:end,find(Aicha_CC_rDLPFC_sc28(1,:)==ROIs(1,i))))-nanmean(Aicha_HC_rDLPFC_sc28(2:end,find(Aicha_HC_rDLPFC_sc28(1,:)==ROIs(1,i))))];
end





%AICHA lDLPFC 27 with 57
ROIs=[27 57];
Mdiffs2=[];
for i=1:size(ROIs,2);
    Mdiffs2=[Mdiffs2; ROIs(1,i) nanmean(Aicha_CC_lDLPFC_sc27(2:end,find(Aicha_CC_lDLPFC_sc27(1,:)==ROIs(1,i))))-nanmean(Aicha_HC_lDLPFC_sc27(2:end,find(Aicha_HC_lDLPFC_sc27(1,:)==ROIs(1,i))))];
end



%BN rDLPFC 22 with 246
ROIs=[22 246];
Mdiffs3=[];
for i=1:size(ROIs,2);
    Mdiffs3=[Mdiffs3; ROIs(1,i) nanmean(BN_CC_rDLPFC_sc22(2:end,find(BN_CC_rDLPFC_sc22(1,:)==ROIs(1,i))))-nanmean(BN_HC_rDLPFC_sc22(2:end,find(BN_HC_rDLPFC_sc22(1,:)==ROIs(1,i))))];
end




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


