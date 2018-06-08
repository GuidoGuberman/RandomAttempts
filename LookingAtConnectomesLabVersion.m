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


%%%%%Mean diffs in streamline count%%%%%
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

%% Probing the differences
%This section needs to be run after a ProbingConnDiffs.sh script is run on
%command line.


%%%%%%%%%%%%%%%%%%%%%%%%Extracting the data%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%UNNECESSARY IN LAB COMPUTER%%%
cd '/Users/guigub/Downloads/ConnectivityProject/AICHA_1mm/CC_Group'%THIS PART WILL BE UNNECESSARY WHEN RUNNING ON LAB COMP
Aicha_DLPFC_split_CC_file='ALL_CC_run1_AICHA_1mm_spConn.xlsx';
[Aicha_DLPFC_split_CC_data, Aicha_DLPFC_split_CC_vars, Aicha_DLPFC_split_CC_raw]=xlsread(Aicha_DLPFC_split_CC_file);
cd '/Users/guigub/Downloads/ConnectivityProject/AICHA_1mm/HC_Group'%THIS PART WILL BE UNNECESSARY WHEN RUNNING ON LAB COMP
Aicha_DLPFC_split_HC_file='ALL_HC_run1_AICHA_1mm_spConn.xlsx';
[Aicha_DLPFC_split_HC_data, Aicha_DLPFC_split_HC_vars, Aicha_DLPFC_split_HC_raw]=xlsread(Aicha_DLPFC_split_HC_file);
CC_subs=unique(Aicha_DLPFC_split_CC_vars);
HC_subs=unique(Aicha_DLPFC_split_HC_vars);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/guigub/Documents/Research/PhD/Project2/DLPFCConnectivityProject' %CHANGE ON LAB COMPUTER
% cd CC_subs(1,1)]
%%%%%%%%%%%%%%%%%%%%%%%%

cd '/Users/guigub/Downloads/ConnectivityProject/Aicha_1mm/CC_Group'
Aicha_1mm_CC_AFD_file='All_CC_run1_AICHA_1mm_meanAFD.xlsx';
[Aicha_1mm_CC_AFD_data, Aicha_1mm_CC_AFD_vars, Aicha_1mm_CC_AFD_raw]=xlsread(Aicha_1mm_CC_AFD_file);

Aicha_1mm_CC_vol_file='All_CC_run1_AICHA_1mm_tractVolumes.xlsx';
[Aicha_1mm_CC_vol_data, Aicha_1mm_CC_vol_vars, Aicha_1mm_CC_vol_raw]=xlsread(Aicha_1mm_CC_vol_file);

Aicha_1mm_CC_FA_file='All_CC_run1_AICHA_1mm_FA.xlsx';
[Aicha_1mm_CC_FA_data, Aicha_1mm_CC_FA_vars, Aicha_1mm_CC_FA_raw]=xlsread(Aicha_1mm_CC_FA_file);

Aicha_1mm_CC_MD_file='All_CC_run1_AICHA_1mm_MD.xlsx';
[Aicha_1mm_CC_MD_data, Aicha_1mm_CC_MD_vars, Aicha_1mm_CC_MD_raw]=xlsread(Aicha_1mm_CC_MD_file);

Aicha_1mm_CC_RD_file='All_CC_run1_AICHA_1mm_RD.xlsx';
[Aicha_1mm_CC_RD_data, Aicha_1mm_CC_RD_vars, Aicha_1mm_CC_RD_raw]=xlsread(Aicha_1mm_CC_RD_file);

Aicha_1mm_CC_AD_file='All_CC_run1_AICHA_1mm_AD.xlsx';
[Aicha_1mm_CC_AD_data, Aicha_1mm_CC_AD_vars, Aicha_1mm_CC_AD_raw]=xlsread(Aicha_1mm_CC_AD_file);


cd '/Users/guigub/Downloads/ConnectivityProject/Aicha_1mm/HC_Group'
Aicha_1mm_HC_AFD_file='All_HC_run1_AICHA_1mm_meanAFD.xlsx';
[Aicha_1mm_HC_AFD_data, Aicha_1mm_HC_AFD_vars, Aicha_1mm_HC_AFD_raw]=xlsread(Aicha_1mm_HC_AFD_file);

Aicha_1mm_HC_vol_file='All_HC_run1_AICHA_1mm_tractVolumes.xlsx';
[Aicha_1mm_HC_vol_data, Aicha_1mm_HC_vol_vars, Aicha_1mm_HC_vol_raw]=xlsread(Aicha_1mm_HC_vol_file);

Aicha_1mm_HC_FA_file='All_HC_run1_AICHA_1mm_FA.xlsx';
[Aicha_1mm_HC_FA_data, Aicha_1mm_HC_FA_vars, Aicha_1mm_HC_FA_raw]=xlsread(Aicha_1mm_HC_FA_file);

Aicha_1mm_HC_MD_file='All_HC_run1_AICHA_1mm_MD.xlsx';
[Aicha_1mm_HC_MD_data, Aicha_1mm_HC_MD_vars, Aicha_1mm_HC_MD_raw]=xlsread(Aicha_1mm_HC_MD_file);

Aicha_1mm_HC_RD_file='All_HC_run1_AICHA_1mm_RD.xlsx';
[Aicha_1mm_HC_RD_data, Aicha_1mm_HC_RD_vars, Aicha_1mm_HC_RD_raw]=xlsread(Aicha_1mm_HC_RD_file);

Aicha_1mm_HC_AD_file='All_HC_run1_AICHA_1mm_AD.xlsx';
[Aicha_1mm_HC_AD_data, Aicha_1mm_HC_AD_vars, Aicha_1mm_HC_AD_raw]=xlsread(Aicha_1mm_HC_AD_file);


cd '/Users/guigub/Downloads/ConnectivityProject/BN_Atlas_246_1mm/CC_Group'
BN_1mm_CC_AFD_file='All_CC_run1_BN_Atlas_246_1mm_meanAFD.xlsx';
[BN_1mm_CC_AFD_data, BN_1mm_CC_AFD_vars, BN_1mm_CC_AFD_raw]=xlsread(BN_1mm_CC_AFD_file);

BN_1mm_CC_vol_file='All_CC_run1_BN_Atlas_246_1mm_tractVolumes.xlsx';
[BN_1mm_CC_vol_data, BN_1mm_CC_vol_vars, BN_1mm_CC_vol_raw]=xlsread(BN_1mm_CC_vol_file);

BN_1mm_CC_FA_file='All_CC_run1_BN_Atlas_246_1mm_FA.xlsx';
[BN_1mm_CC_FA_data, BN_1mm_CC_FA_vars, BN_1mm_CC_FA_raw]=xlsread(BN_1mm_CC_FA_file);

BN_1mm_CC_MD_file='All_CC_run1_BN_Atlas_246_1mm_MD.xlsx';
[BN_1mm_CC_MD_data, BN_1mm_CC_MD_vars, BN_1mm_CC_MD_raw]=xlsread(BN_1mm_CC_MD_file);

BN_1mm_CC_RD_file='All_CC_run1_BN_Atlas_246_1mm_RD.xlsx';
[BN_1mm_CC_RD_data, BN_1mm_CC_RD_vars, BN_1mm_CC_RD_raw]=xlsread(BN_1mm_CC_RD_file);

BN_1mm_CC_AD_file='All_CC_run1_BN_Atlas_246_1mm_AD.xlsx';
[BN_1mm_CC_AD_data, BN_1mm_CC_AD_vars, BN_1mm_CC_AD_raw]=xlsread(BN_1mm_CC_AD_file);

cd '/Users/guigub/Downloads/ConnectivityProject/BN_Atlas_246_1mm/HC_Group'
BN_1mm_HC_AFD_file='All_HC_run1_BN_Atlas_246_1mm_meanAFD.xlsx';
[BN_1mm_HC_AFD_data, BN_1mm_HC_AFD_vars, BN_1mm_HC_AFD_raw]=xlsread(BN_1mm_HC_AFD_file);

BN_1mm_HC_vol_file='All_HC_run1_BN_Atlas_246_1mm_tractVolumes.xlsx';
[BN_1mm_HC_vol_data, BN_1mm_HC_vol_vars, BN_1mm_HC_vol_raw]=xlsread(BN_1mm_HC_vol_file);

BN_1mm_HC_FA_file='All_HC_run1_BN_Atlas_246_1mm_FA.xlsx';
[BN_1mm_HC_FA_data, BN_1mm_HC_FA_vars, BN_1mm_HC_FA_raw]=xlsread(BN_1mm_HC_FA_file);

BN_1mm_HC_MD_file='All_HC_run1_BN_Atlas_246_1mm_MD.xlsx';
[BN_1mm_HC_MD_data, BN_1mm_HC_MD_vars, BN_1mm_HC_MD_raw]=xlsread(BN_1mm_HC_MD_file);

BN_1mm_HC_RD_file='All_HC_run1_BN_Atlas_246_1mm_RD.xlsx';
[BN_1mm_HC_RD_data, BN_1mm_HC_RD_vars, BN_1mm_HC_RD_raw]=xlsread(BN_1mm_HC_RD_file);

BN_1mm_HC_AD_file='All_HC_run1_BN_Atlas_246_1mm_AD.xlsx';
[BN_1mm_HC_AD_data, BN_1mm_HC_AD_vars, BN_1mm_HC_AD_raw]=xlsread(BN_1mm_HC_AD_file);

%%%%%%%%%%%%%%%%%%%%%%%
%AFD
% %AICHA 24-28
% AICHA_CC_24_28_AFD_data=[];
% ROIpair=['24_28'];
% ROIidx=1;
% for i=1:size(CC_subs,1);
%     AICHA_CC_24_28_AFD_data=[AICHA_CC_24_28_AFD_data;Aicha_1mm_CC_AFD_data(find(strcmp(Aicha_1mm_CC_AFD_vars(:,1), ...
%         CC_subs(i,1))==1 & strcmp(Aicha_1mm_CC_AFD_vars(:,2),ROIpair)==1),ROIidx)];
% end
% 
% AICHA_HC_24_28_AFD_data=[];
% ROIpair=['24_28'];
% for i=1:size(HC_subs,1);
%     AICHA_HC_24_28_AFD_data=[AICHA_HC_24_28_AFD_data;Aicha_1mm_HC_AFD_data(find(strcmp(Aicha_1mm_HC_AFD_vars(:,1), ...
%         HC_subs(i,1))==1 & strcmp(Aicha_1mm_HC_AFD_vars(:,2),ROIpair)==1),ROIidx)];
% end
% 
% % [P1,H1]=ranksum(AICHA_HC_24_28_AFD_data,AICHA_CC_24_28_AFD_data)
% [H1,P1]=ttest2(AICHA_HC_24_28_AFD_data,AICHA_CC_24_28_AFD_data)
% 
% %AICHA 28_360
% AICHA_CC_28_360_AFD_data=[];
% ROIpair=['28_360'];
% ROIidx=3;
% for i=1:size(CC_subs,1);
%     AICHA_CC_28_360_AFD_data=[AICHA_CC_28_360_AFD_data;Aicha_1mm_CC_AFD_data(find(strcmp(Aicha_1mm_CC_AFD_vars(:,1), ...
%         CC_subs(i,1))==1 & strcmp(Aicha_1mm_CC_AFD_vars(:,2),ROIpair)==1),ROIidx)];
% end
% 
% AICHA_HC_28_360_AFD_data=[];
% ROIpair=['28_360'];
% for i=1:size(HC_subs,1);
%     AICHA_HC_28_360_AFD_data=[AICHA_HC_28_360_AFD_data;Aicha_1mm_HC_AFD_data(find(strcmp(Aicha_1mm_HC_AFD_vars(:,1), ...
%         HC_subs(i,1))==1 & strcmp(Aicha_1mm_HC_AFD_vars(:,2),ROIpair)==1),ROIidx)];
% end
% 
% % [P2,H2]=ranksum(AICHA_HC_28_360_AFD_data,AICHA_CC_28_360_AFD_data)
% [H2,P2]=ttest2(AICHA_HC_28_360_AFD_data,AICHA_CC_28_360_AFD_data)
% 
% 
% %AICHA 27_57
% AICHA_CC_27_57_AFD_data=[];
% ROIpair=['27_57'];
% ROIidx=4;
% for i=1:size(CC_subs,1);
%     AICHA_CC_27_57_AFD_data=[AICHA_CC_27_57_AFD_data;Aicha_1mm_CC_AFD_data(find(strcmp(Aicha_1mm_CC_AFD_vars(:,1), ...
%         CC_subs(i,1))==1 & strcmp(Aicha_1mm_CC_AFD_vars(:,2),ROIpair)==1),ROIidx)];
% end
% 
% AICHA_HC_27_57_AFD_data=[];
% ROIpair=['27_57'];
% for i=1:size(HC_subs,1);
%     AICHA_HC_27_57_AFD_data=[AICHA_HC_27_57_AFD_data;Aicha_1mm_HC_AFD_data(find(strcmp(Aicha_1mm_HC_AFD_vars(:,1), ...
%         HC_subs(i,1))==1 & strcmp(Aicha_1mm_HC_AFD_vars(:,2),ROIpair)==1),ROIidx)];
% end
% 
% % [P3,H3]=ranksum(AICHA_HC_27_57_AFD_data,AICHA_CC_27_57_AFD_data)
% [H3,P3]=ttest2(AICHA_HC_27_57_AFD_data,AICHA_CC_27_57_AFD_data)



%Mean AFD
%24_28
ROIidx=1;
AICHA_CC_24_28_AFD_data=Aicha_1mm_CC_AFD_data(:,ROIidx);

AICHA_HC_24_28_AFD_data=Aicha_1mm_HC_AFD_data(:,ROIidx);

[P1,H1]=ranksum(AICHA_CC_24_28_AFD_data,AICHA_HC_24_28_AFD_data)
[tH1,tP1]=ttest2(AICHA_CC_24_28_AFD_data,AICHA_HC_24_28_AFD_data)

%28_360
ROIidx=11;
AICHA_CC_28_360_AFD_data=Aicha_1mm_CC_AFD_data(:,ROIidx);

AICHA_HC_28_360_AFD_data=Aicha_1mm_HC_AFD_data(:,ROIidx);

[P2,H2]=ranksum(AICHA_CC_28_360_AFD_data,AICHA_HC_28_360_AFD_data)
[tH2,tP2]=ttest2(AICHA_CC_28_360_AFD_data,AICHA_HC_28_360_AFD_data)


%27_57
ROIidx=16;
AICHA_CC_27_57_AFD_data=Aicha_1mm_CC_AFD_data(:,ROIidx);

AICHA_HC_27_57_AFD_data=Aicha_1mm_HC_AFD_data(:,ROIidx);

[P3,H3]=ranksum(AICHA_CC_27_57_AFD_data,AICHA_HC_27_57_AFD_data)
[tH3,tP3]=ttest2(AICHA_CC_27_57_AFD_data,AICHA_HC_27_57_AFD_data)






%Tract Volume
%AICHA 24-28
AICHA_CC_24_28_vol_data=[];
ROIpair=['24_28'];
ROIidx=1;
for i=1:size(CC_subs,1);
    AICHA_CC_24_28_vol_data=[AICHA_CC_24_28_vol_data;Aicha_1mm_CC_vol_data(find(strcmp(Aicha_1mm_CC_vol_vars(:,1), ...
        CC_subs(i,1))==1 & strcmp(Aicha_1mm_CC_vol_vars(:,2),ROIpair)==1),ROIidx)];
end

AICHA_HC_24_28_vol_data=[];
ROIpair=['24_28'];
for i=1:size(HC_subs,1);
    AICHA_HC_24_28_vol_data=[AICHA_HC_24_28_vol_data;Aicha_1mm_HC_vol_data(find(strcmp(Aicha_1mm_HC_vol_vars(:,1), ...
        HC_subs(i,1))==1 & strcmp(Aicha_1mm_HC_vol_vars(:,2),ROIpair)==1),ROIidx)];
end

[P4,H4]=ranksum(AICHA_HC_24_28_vol_data,AICHA_CC_24_28_vol_data)
[tH4,tP4]=ttest2(AICHA_HC_24_28_vol_data,AICHA_CC_24_28_vol_data)

%AICHA 28_360
AICHA_CC_28_360_vol_data=[];
ROIpair=['28_360'];
ROIidx=3;
for i=1:size(CC_subs,1);
    AICHA_CC_28_360_vol_data=[AICHA_CC_28_360_vol_data;Aicha_1mm_CC_vol_data(find(strcmp(Aicha_1mm_CC_vol_vars(:,1), ...
        CC_subs(i,1))==1 & strcmp(Aicha_1mm_CC_vol_vars(:,2),ROIpair)==1),ROIidx)];
end

AICHA_HC_28_360_vol_data=[];
ROIpair=['28_360'];
for i=1:size(HC_subs,1);
    AICHA_HC_28_360_vol_data=[AICHA_HC_28_360_vol_data;Aicha_1mm_HC_vol_data(find(strcmp(Aicha_1mm_HC_vol_vars(:,1), ...
        HC_subs(i,1))==1 & strcmp(Aicha_1mm_HC_vol_vars(:,2),ROIpair)==1),ROIidx)];
end

[P5,H5]=ranksum(AICHA_HC_28_360_vol_data,AICHA_CC_28_360_vol_data)
[tH5,tP5]=ttest2(AICHA_HC_28_360_vol_data,AICHA_CC_28_360_vol_data)


%AICHA 27_57
AICHA_CC_27_57_vol_data=[];
ROIpair=['27_57'];
ROIidx=4;
for i=1:size(CC_subs,1);
    AICHA_CC_27_57_vol_data=[AICHA_CC_27_57_vol_data;Aicha_1mm_CC_vol_data(find(strcmp(Aicha_1mm_CC_vol_vars(:,1), ...
        CC_subs(i,1))==1 & strcmp(Aicha_1mm_CC_vol_vars(:,2),ROIpair)==1),ROIidx)];
end

AICHA_HC_27_57_vol_data=[];
ROIpair=['27_57'];
for i=1:size(HC_subs,1);
    AICHA_HC_27_57_vol_data=[AICHA_HC_27_57_vol_data;Aicha_1mm_HC_vol_data(find(strcmp(Aicha_1mm_HC_vol_vars(:,1), ...
        HC_subs(i,1))==1 & strcmp(Aicha_1mm_HC_vol_vars(:,2),ROIpair)==1),ROIidx)];
end

[P6,H6]=ranksum(AICHA_HC_27_57_vol_data,AICHA_CC_27_57_vol_data)
[tH6,tP6]=ttest2(AICHA_HC_27_57_vol_data,AICHA_CC_27_57_vol_data)

%FA
%24_28
ROIidx=1;
AICHA_CC_24_28_FA_data=Aicha_1mm_CC_FA_data(:,ROIidx);

AICHA_HC_24_28_FA_data=Aicha_1mm_HC_FA_data(:,ROIidx);

[P7,H7]=ranksum(AICHA_CC_24_28_FA_data,AICHA_HC_24_28_FA_data)
[tH7,tP7]=ttest2(AICHA_CC_24_28_FA_data,AICHA_HC_24_28_FA_data)

%28_360
ROIidx=11;
AICHA_CC_28_360_FA_data=Aicha_1mm_CC_FA_data(:,ROIidx);

AICHA_HC_28_360_FA_data=Aicha_1mm_HC_FA_data(:,ROIidx);

[P8,H8]=ranksum(AICHA_CC_28_360_FA_data,AICHA_HC_28_360_FA_data)
[tH8,tP8]=ttest2(AICHA_CC_28_360_FA_data,AICHA_HC_28_360_FA_data)


%27_57
ROIidx=16;
AICHA_CC_27_57_FA_data=Aicha_1mm_CC_FA_data(:,ROIidx);

AICHA_HC_27_57_FA_data=Aicha_1mm_HC_FA_data(:,ROIidx);

[P9,H9]=ranksum(AICHA_CC_27_57_FA_data,AICHA_HC_27_57_FA_data)
[tH9,tP9]=ttest2(AICHA_CC_27_57_FA_data,AICHA_HC_27_57_FA_data)

%MD
%24_28
ROIidx=1;
AICHA_CC_24_28_MD_data=Aicha_1mm_CC_MD_data(:,ROIidx);

AICHA_HC_24_28_MD_data=Aicha_1mm_HC_MD_data(:,ROIidx);

[P10,H10]=ranksum(AICHA_CC_24_28_MD_data,AICHA_HC_24_28_MD_data)
[tH10,tP10]=ttest2(AICHA_CC_24_28_MD_data,AICHA_HC_24_28_MD_data)

%28_360
ROIidx=11;
AICHA_CC_28_360_MD_data=Aicha_1mm_CC_MD_data(:,ROIidx);

AICHA_HC_28_360_MD_data=Aicha_1mm_HC_MD_data(:,ROIidx);

[P11,H11]=ranksum(AICHA_CC_28_360_MD_data,AICHA_HC_28_360_MD_data)
[tH11,tP11]=ttest2(AICHA_CC_28_360_MD_data,AICHA_HC_28_360_MD_data)

%27_57
ROIidx=16;
AICHA_CC_27_57_MD_data=Aicha_1mm_CC_MD_data(:,ROIidx);

AICHA_HC_27_57_MD_data=Aicha_1mm_HC_MD_data(:,ROIidx);

[P12,H12]=ranksum(AICHA_CC_27_57_MD_data,AICHA_HC_27_57_MD_data)
[tH12,tP12]=ttest2(AICHA_CC_27_57_MD_data,AICHA_HC_27_57_MD_data)



%RD
%24_28
ROIidx=1;
AICHA_CC_24_28_RD_data=Aicha_1mm_CC_RD_data(:,ROIidx);

AICHA_HC_24_28_RD_data=Aicha_1mm_HC_RD_data(:,ROIidx);

[P13,H13]=ranksum(AICHA_CC_24_28_RD_data,AICHA_HC_24_28_RD_data)
[tH13,tP13]=ttest2(AICHA_CC_24_28_RD_data,AICHA_HC_24_28_RD_data)

%28_360
ROIidx=11;
AICHA_CC_28_360_RD_data=Aicha_1mm_CC_RD_data(:,ROIidx);

AICHA_HC_28_360_RD_data=Aicha_1mm_HC_RD_data(:,ROIidx);

[P14,H14]=ranksum(AICHA_CC_28_360_RD_data,AICHA_HC_28_360_RD_data)
[tH14,tP14]=ttest2(AICHA_CC_28_360_RD_data,AICHA_HC_28_360_RD_data)

%27_57
ROIidx=16;
AICHA_CC_27_57_RD_data=Aicha_1mm_CC_RD_data(:,ROIidx);

AICHA_HC_27_57_RD_data=Aicha_1mm_HC_RD_data(:,ROIidx);

[P15,H15]=ranksum(AICHA_CC_27_57_RD_data,AICHA_HC_27_57_RD_data)
[tH15,tP15]=ttest2(AICHA_CC_27_57_RD_data,AICHA_HC_27_57_RD_data)



%AD
%24_28
ROIidx=1;
AICHA_CC_24_28_AD_data=Aicha_1mm_CC_AD_data(:,ROIidx);

AICHA_HC_24_28_AD_data=Aicha_1mm_HC_AD_data(:,ROIidx);

[P16,H16]=ranksum(AICHA_CC_24_28_AD_data,AICHA_HC_24_28_AD_data)
[tH16,tP16]=ttest2(AICHA_CC_24_28_AD_data,AICHA_HC_24_28_AD_data)

%28_360
ROIidx=11;
AICHA_CC_28_360_AD_data=Aicha_1mm_CC_AD_data(:,ROIidx);

AICHA_HC_28_360_AD_data=Aicha_1mm_HC_AD_data(:,ROIidx);

[P17,H17]=ranksum(AICHA_CC_28_360_AD_data,AICHA_HC_28_360_AD_data)
[tH17,tP17]=ttest2(AICHA_CC_28_360_AD_data,AICHA_HC_28_360_AD_data)

%27_57
ROIidx=16;
AICHA_CC_27_57_AD_data=Aicha_1mm_CC_AD_data(:,ROIidx);

AICHA_HC_27_57_AD_data=Aicha_1mm_HC_AD_data(:,ROIidx);

[P18,H18]=ranksum(AICHA_CC_27_57_AD_data,AICHA_HC_27_57_AD_data)
[tH18,tP18]=ttest2(AICHA_CC_27_57_AD_data,AICHA_HC_27_57_AD_data)





% %AFD
% %BN 22_246
% BN_CC_22_246_AFD_data=[];
% ROIpair=['22_246'];
% ROIidx=1;
% for i=1:size(CC_subs,1);
%     BN_CC_22_246_AFD_data=[BN_CC_22_246_AFD_data;BN_1mm_CC_AFD_data(find(strcmp(BN_1mm_CC_AFD_vars(:,1), ...
%         CC_subs(i,1))==1 & strcmp(BN_1mm_CC_AFD_vars(:,2),ROIpair)==1),ROIidx)];
% end
% 
% 
% 
% BN_HC_22_246_AFD_data=[];
% ROIpair=['22_246'];
% for i=1:size(HC_subs,1);
%     BN_HC_22_246_AFD_data=[BN_HC_22_246_AFD_data;BN_1mm_HC_AFD_data(find(strcmp(BN_1mm_HC_AFD_vars(:,1), ...
%         HC_subs(i,1))==1 & strcmp(BN_1mm_HC_AFD_vars(:,2),ROIpair)==1),ROIidx)];
% end
% 
% % [P19,H19]=ranksum(BN_HC_22_246_AFD_data,BN_CC_22_246_AFD_data)
% [H19,P19]=ttest2(BN_HC_22_246_AFD_data,BN_CC_22_246_AFD_data)


%AFD
%BN 22_246
ROIidx=1;
BN_CC_22_246_AFD_data=BN_1mm_CC_AFD_data(:,ROIidx);
BN_HC_22_246_AFD_data=BN_1mm_HC_AFD_data(:,ROIidx);
[P19,H19]=ranksum(BN_HC_22_246_AFD_data,BN_CC_22_246_AFD_data)
[tH19,tP19]=ttest2(BN_HC_22_246_AFD_data,BN_CC_22_246_AFD_data)



%Tract Volume
%BN 22_246
BN_CC_22_246_vol_data=[];
ROIpair=['22_246'];
ROIidx=1;
for i=1:size(CC_subs,1);
    BN_CC_22_246_vol_data=[BN_CC_22_246_vol_data;BN_1mm_CC_vol_data(find(strcmp(BN_1mm_CC_vol_vars(:,1), ...
        CC_subs(i,1))==1 & strcmp(BN_1mm_CC_vol_vars(:,2),ROIpair)==1),ROIidx)];
end

BN_HC_22_246_vol_data=[];
ROIpair=['22_246'];
for i=1:size(HC_subs,1);
    BN_HC_22_246_vol_data=[BN_HC_22_246_vol_data;BN_1mm_HC_vol_data(find(strcmp(BN_1mm_HC_vol_vars(:,1), ...
        HC_subs(i,1))==1 & strcmp(BN_1mm_HC_vol_vars(:,2),ROIpair)==1),ROIidx)];
end

[P20,H20]=ranksum(BN_HC_22_246_vol_data,BN_CC_22_246_vol_data)
[tH20,tP20]=ttest2(BN_HC_22_246_vol_data,BN_CC_22_246_vol_data)


%FA
%BN 22_246
ROIidx=1;
BN_CC_22_246_FA_data=BN_1mm_CC_FA_data(:,ROIidx);
BN_HC_22_246_FA_data=BN_1mm_HC_FA_data(:,ROIidx);
[P21,H21]=ranksum(BN_HC_22_246_FA_data,BN_CC_22_246_FA_data)
[tH21,tP21]=ttest2(BN_HC_22_246_FA_data,BN_CC_22_246_FA_data)

%MD
%BN 22_246
ROIidx=1;
BN_CC_22_246_MD_data=BN_1mm_CC_MD_data(:,ROIidx);
BN_HC_22_246_MD_data=BN_1mm_HC_MD_data(:,ROIidx);
[P22,H22]=ranksum(BN_HC_22_246_MD_data,BN_CC_22_246_MD_data)
[tH22,tP22]=ttest2(BN_HC_22_246_MD_data,BN_CC_22_246_MD_data)

%RD
%BN 22_246
ROIidx=1;
BN_CC_22_246_RD_data=BN_1mm_CC_RD_data(:,ROIidx);
BN_HC_22_246_RD_data=BN_1mm_HC_RD_data(:,ROIidx);
[P23,H23]=ranksum(BN_HC_22_246_RD_data,BN_CC_22_246_RD_data)
[tH23,tP23]=ttest2(BN_HC_22_246_RD_data,BN_CC_22_246_RD_data)

%AD
%BN 22_246
ROIidx=1;
BN_CC_22_246_AD_data=BN_1mm_CC_AD_data(:,ROIidx);
BN_HC_22_246_AD_data=BN_1mm_HC_AD_data(:,ROIidx);
[P24,H24]=ranksum(BN_HC_22_246_AD_data,BN_CC_22_246_AD_data)
[tH24,tP24]=ttest2(BN_HC_22_246_AD_data,BN_CC_22_246_AD_data)



Results=[H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 H24;...
    P1 P2 P3 P4 P5 P6 P7 P8 P9 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 P20 P21 P22 P23 P24]

tResults=[tH1 tH2 tH3 tH4 tH5 tH6 tH7 tH8 tH9 tH10 tH11 tH12 tH13 tH14 tH15 tH16 tH17 tH18 tH19 tH20 tH21 tH22 tH23 tH24;...
    tP1 tP2 tP3 tP4 tP5 tP6 tP7 tP8 tP9 tP10 tP11 tP12 tP13 tP14 tP15 tP16 tP17 tP18 tP19 tP20 tP21 tP22 tP23 tP24]


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




%% Follow-up analyses
%total number of streamlines between groups
CC_strs=[3977344, 2516943, 4137991, 2802682, 2479361, 2447485, 4728235, 2686240, 2493739, 2639602, 2798498, 2619986, 2756129, 2609117, 2953998, 3134095];
HC_strs=[2726197, 2599035, 2453146, 2783387, 2729751, 2696889, 5427167, 2669944, 2836902, 3112364, 2735507, 2727913, 3860319, 2870103, 3039772, 2402047,...
    2968707, 2731092, 2457032, 2605310, 2715354, 2755162, 3142640, 2575148, 2696554, 5317977, 3254845, 2717667, 2354266, 2666162, 2796350, 5800878, 2965766, ...
    2540950, 2380272, 2959735, 3026157, 3005037, 2789417, 3033137, 3044413, 4976265, 2371450, 2701823, 2968664, 2926917];
[H,P,CI,STATS]=ttest2(CC_strs,HC_strs)%Parametric
[P,H,STATS]=ranksum(CC_strs,HC_strs)%Non-parametric

CC_strs=CC_strs'
HC_strs=HC_strs'
%Correlation: total number of streamlines by nodal degree
[RHO,PVAL]=corr([HC_strs degAicha_HC_rDLPFC_sc24])%Default is Pearson, a parametric analysys
[RHO,PVAL]=corr([CC_strs degAicha_CC_rDLPFC_sc24])

[RHO,PVAL]=corr([HC_strs degAicha_HC_rDLPFC_sc24],'type','Spearman')%Non-parametric
[RHO,PVAL]=corr([CC_strs degAicha_CC_rDLPFC_sc24],'type','Spearman')