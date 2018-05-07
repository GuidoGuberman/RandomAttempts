CC_grp=(TC001)
#(TC001 TC007 TC033 TC042 TC054 TC056 TC057 TC071 TC073 TC074 TC076 TC077 TC078 TC079 TC050 TC069) #CC
HC_grp=(TC002)
#(TC002 TC003 TC004 TC005 TC006 TC008 TC009 TC010 TC011 TC013 TC014 TC015 TC016 TC017 TC018 TC019 TC020 TC021 TC022 TC023 TC024 TC025 TC026 TC028 TC029 TC030 TC031 TC032 TC034 TC036 \
TC037 TC038 TC039 TC040 TC041 TC043 TC044 TC045 TC046 TC049 TC052 TC055 TC059 TC060 TC058 TC061) #HC
runs=(1)
START_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/MNI
OUT_DIR=$START_DIR/ConnectivityProject/
parc1=(AICHA_1mm)
parc2=(BN_Atlas_246_1mm)
parcs=(AICHA_1mm BN_Atlas_246_1mm)
parc1rhROI=(24 28 360)
parc1lhROI=(27 57)
parc2rhROI=(22 246)

######################################################
#AICHA atlas

for parc in "${parc1[@]}"
do
  for nummni in "${CC_grp[@]}"
  GRP=CC
  do
    for numrun in "${runs[@]}"
    do
      SUB_DIR=$START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/
      PROJECT_DIR=$SUB_DIR/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
      cd $PROJECT_DIR

      for parc1rhROIs in "${parc1rhROI[@]}"
      do
        for roinum2 in "${parc1rhROI[@]}"
        do
          if [ "$parc1rhROIs" -ne "$roinum2" -a "$parc1rhROIs" -lt "$roinum2" ]
          then
            echo "$nummni" "$parc1rhROIs"_"$roinum2">>tmp2.txt
          fi
        done
      done

      for parc1lhROIs in "${parc1lhROI[@]}"
      do
        for roinum2 in "${parc1lhROI[@]}"
        do
          if [ "$parc1lhROIs" -ne "$roinum2" -a "$parc1lhROIs" -lt "$roinum2" ]
          then
            echo "$nummni" "$parc1lhROIs"_"$roinum2">>tmp2.txt
          fi
        done
      done
    done
  done
        #AFD along streamlines
        awk "/mean_afd/{print}" "$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt >>tmpAFD.txt
        awk -F ":|," '{print $2}' tmpAFD.txt > tmpAFD.txt
        paste tmp2.txt tmpAFD.txt > $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_AFDalongstrs.txt

        #DTI metrics
        echo awk '{print $2 " " $3 " " $4 " " $5 " " $6}' All_"$GRP"_run"$numrun"_"$parc"_FA.txt
        awk '{print $2 " " $3 " " $7 " " $8 " " $9}' All_"$GRP"_run"$numrun"_"$parc"_MD.txt
        awk '{print $2 " " $3 " " $10 " " $11 " " $12}' All_"$GRP"_run"$numrun"_"$parc"_RD.txt
        awk '{print $2 " " $3 " " $13 " " $14 " " $15}' All_"$GRP"_run"$numrun"_"$parc"_AD.txt

        #Tract volume
        awk "/volume/{print}" "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt >>tmpVols.txt
        awk -F '{print $2}' tmpVols.txt > tmpVols.txt
        paste tmp2.txt tmpVols.txt > $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_tractVolumes.txt

        rm tmp2.txt
done


for parc in "${parc1[@]}"
do
  for nummni in "${HC_grp[@]}"
  GRP=HC
  do
    for numrun in "${runs[@]}"
    do
      SUB_DIR=$START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/
      PROJECT_DIR=$SUB_DIR/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
      cd $PROJECT_DIR

      for parc1rhROIs in "${parc1rhROI[@]}"
      do
        for roinum2 in "${parc1rhROI[@]}"
        do
          if [ "$parc1rhROIs" -ne "$roinum2" -a "$parc1rhROIs" -lt "$roinum2" ]
          then
            echo "$nummni" "$parc1rhROIs"_"$roinum2">>tmp2.txt
          fi
        done
      done

      for parc1lhROIs in "${parc1lhROI[@]}"
      do
        for roinum2 in "${parc1lhROI[@]}"
        do
          if [ "$parc1lhROIs" -ne "$roinum2" -a "$parc1lhROIs" -lt "$roinum2" ]
          then
            echo "$nummni" "$parc1lhROIs"_"$roinum2">>tmp2.txt
          fi
        done
      done
    done
  done
        #AFD along streamlines
        awk "/mean_afd/{print}" "$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt >>tmpAFD.txt
        awk -F ":|," '{print $2}' tmpAFD.txt > tmpAFD.txt
        paste tmp2.txt tmpAFD.txt > $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_AFDalongstrs.txt

        #DTI metrics
        echo awk '{print $2 " " $3 " " $4 " " $5 " " $6}' All_"$GRP"_run"$numrun"_"$parc"_FA.txt
        awk '{print $2 " " $3 " " $7 " " $8 " " $9}' All_"$GRP"_run"$numrun"_"$parc"_MD.txt
        awk '{print $2 " " $3 " " $10 " " $11 " " $12}' All_"$GRP"_run"$numrun"_"$parc"_RD.txt
        awk '{print $2 " " $3 " " $13 " " $14 " " $15}' All_"$GRP"_run"$numrun"_"$parc"_AD.txt

        #Tract volume
        awk "/volume/{print}" "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt >>tmpVols.txt
        awk -F '{print $2}' tmpVols.txt > tmpVols.txt
        paste tmp2.txt tmpVols.txt > $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_tractVolumes.txt

        rm tmp2.txt
done





#BN Atlas
for parc in "${parc2[@]}"
do
  for nummni in "${CC_grp[@]}"
  GRP=CC
  do
    for numrun in "${runs[@]}"
    do
      SUB_DIR=$START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/
      PROJECT_DIR=$SUB_DIR/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
      cd $PROJECT_DIR

      for parc2rhROIs in "${parc2rhROI[@]}"
      do
        for roinum2 in "${parc2rhROI[@]}"
        do
          if [ "$parc2rhROIs" -ne "$roinum2" -a "$parc2rhROIs" -lt "$roinum2" ]
          then
            echo "$nummni" "$parc2rhROIs"_"$roinum2">>tmp2.txt
          fi
        done
      done
    done
  done
        #AFD along streamlines
        awk "/mean_afd/{print}" "$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt >>tmpAFD.txt
        awk -F ":|," '{print $2}' tmpAFD.txt > tmpAFD.txt
        paste tmp2.txt tmpAFD.txt > $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_AFDalongstrs.txt

        #DTI metrics
        echo awk '{print $2 " " $3 " " $4 " " $5 " " $6}' All_"$GRP"_run"$numrun"_"$parc"_FA.txt
        awk '{print $2 " " $3 " " $7 " " $8 " " $9}' All_"$GRP"_run"$numrun"_"$parc"_MD.txt
        awk '{print $2 " " $3 " " $10 " " $11 " " $12}' All_"$GRP"_run"$numrun"_"$parc"_RD.txt
        awk '{print $2 " " $3 " " $13 " " $14 " " $15}' All_"$GRP"_run"$numrun"_"$parc"_AD.txt

        #Tract volume
        awk "/volume/{print}" "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt >>tmpVols.txt
        awk -F '{print $2}' tmpVols.txt > tmpVols.txt
        paste tmp2.txt tmpVols.txt > $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_tractVolumes.txt

        rm tmp2.txt
done


for parc in "${parc2[@]}"
do
  for nummni in "${HC_grp[@]}"
  GRP=HC
  do
    for numrun in "${runs[@]}"
    do
      SUB_DIR=$START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/
      PROJECT_DIR=$SUB_DIR/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
      cd $PROJECT_DIR

      for parc2rhROIs in "${parc2rhROI[@]}"
      do
        for roinum2 in "${parc2rhROI[@]}"
        do
          if [ "$parc2rhROIs" -ne "$roinum2" -a "$parc2rhROIs" -lt "$roinum2" ]
          then
            echo "$nummni" "$parc2rhROIs"_"$roinum2">>tmp2.txt
          fi
        done
      done
    done
  done
        #AFD along streamlines
        awk "/mean_afd/{print}" "$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt >>tmpAFD.txt
        awk -F ":|," '{print $2}' tmpAFD.txt > tmpAFD.txt
        paste tmp2.txt tmpAFD.txt > $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_AFDalongstrs.txt

        #DTI metrics
        echo awk '{print $2 " " $3 " " $4 " " $5 " " $6}' All_"$GRP"_run"$numrun"_"$parc"_FA.txt
        awk '{print $2 " " $3 " " $7 " " $8 " " $9}' All_"$GRP"_run"$numrun"_"$parc"_MD.txt
        awk '{print $2 " " $3 " " $10 " " $11 " " $12}' All_"$GRP"_run"$numrun"_"$parc"_RD.txt
        awk '{print $2 " " $3 " " $13 " " $14 " " $15}' All_"$GRP"_run"$numrun"_"$parc"_AD.txt

        #Tract volume
        awk "/volume/{print}" "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt >>tmpVols.txt
        awk -F '{print $2}' tmpVols.txt > tmpVols.txt
        paste tmp2.txt tmpVols.txt > $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_tractVolumes.txt

        rm tmp2.txt
done
