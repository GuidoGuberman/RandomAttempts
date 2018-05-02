START_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/ConnectivityProject/
TEMPLATE_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/Templates/DLPFCConnectivityStudy

grp1=(CC)
grp2=(HC)
grps=(CC HC)
CC_grp=(TC001 TC007 TC033 TC042 TC054 TC056 TC057 TC071 TC073 TC074 TC076 TC077 TC078 TC079 TC050 TC069) #CC 
HC_grp=(TC002 TC003 TC004 TC005 TC006 TC008 TC009 TC010 TC011 TC013 TC014 TC015 TC016 TC017 TC018 TC019 TC020 TC021 TC022 TC023 TC024 TC025 TC026 TC028 TC029 TC030 TC031 TC032 TC034 TC036 TC037 TC038 TC039 TC040 TC041 TC043 TC044 TC045 TC046 TC049 TC052 TC055 TC059 TC060 TC058 TC061) #HC 
runs=(1)

parcs=(AICHA_1mm BN_Atlas_246_1mm)

parc1=(AICHA_1mm)
parc2=(BN_Atlas_246_1mm)
#parcs=(Aicha_with_DLPFC Brainnetome_with_DLPFC AICHA_1mm BN_Atlas_246_1mm)

#parc1RNs=(1 21 22)
parc1rhROIs=(24 28 360)
parc1lhROIs=(27 57)
parc2rhROIs=(22 246)
parc1lhROIs=()

#######################################################

for parc in "${parcs[@]}"
do
	cd $TEMPLATE_DIR
	mkdir "$parc"_labels
	cd "$parc"_labels
	echo "converting data type to int32 for parcellation $parc"
	mrconvert ../"$parc".nii ../"$parc"_INT32.nii -datatype int32 

	echo "splitting volume labels for parcellation $parc"
	scil_split_volume_labels.py ../"$parc"_INT32.nii ids
done

for parc1RHROI in "${parc1RHROI[@]}"
do


#specify the pair of connections you want to extract from your whole brain tractogram
#transform them to native diffusion space (although you could consider splitting the labels from the subject-specific parcellations which you use in your WBscript)

#Extract them by applying scil_robust_filter... in two steps

#Then generate binary maps from those connections

#Then extract measures (FA,volume,AFD,and after processing run2s, add AFDalongstreamlines)
