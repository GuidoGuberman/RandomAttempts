CC_grp=(TC001 TC007 TC033 TC042 TC054 TC056 TC057 TC071 TC073 TC074 TC076 TC077 TC078 TC079 TC050 TC069) #CC
HC_grp=(TC002 TC003 TC004 TC005 TC006 TC008 TC009 TC010 TC011 TC013 TC014 TC015 TC016 TC017 TC018 TC019 TC020 TC021 TC022 TC023 TC024 TC025 TC026 TC028 TC029 TC030 TC031 TC032 TC034 TC036 \
TC037 TC038 TC039 TC040 TC041 TC043 TC044 TC045 TC046 TC049 TC052 TC055 TC059 TC060 TC058 TC061) #HC
runs=(1)
START_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/MNI
OUT_DIR=$START_DIR/ConnectivityProject


parcs=(AICHA_1mm BN_Atlas_246_1mm)
#parcs=(AICHA_1mm)
Aicha_ROIs=(20 22 24 26 28 19 21 23 25 27)
BN_ROIs=(16 20 22 15 19 21)
#These labels are the ones that are connected to the ROI in every subject. They are taken from the LookingAtConnectomes script.
Aicha_20=(4 10 12 16 22 24 28 30 32 34 40 150 208 210 244 350 354 358 364)
Aicha_22=(4 10 12 16 20 24 28 32 150 210 354 358 364)
Aicha_24=(12 16 20 22 26 28 32 354)
Aicha_26=(16 24 28)
Aicha_28=(4 12 16 20 22 24 26 31 32 58 354 360)
Aicha_19=(3 9 11 13 21 23 27 29 31 353 354 363)
Aicha_21=(3 9 11 13 15 19 23 29 31 33 149 207 209 243 353 354 357 358 363)
Aicha_23=(11 19 21 27 31)
Aicha_25=(11 13 15 27 31 57 230 353 363)
Aicha_27=(13 19 23 25 31 57)
BN_16=(1 2 4 6 8 11 12 14 18 20 22 24 26 28 30 34 38 40 56 138 140 178 222 228 230 232 246)
BN_20=(2 4 6 12 14 16 18 22 24 26 28 30 32 38 42 44 46 52 220 222 226 228 230)
BN_22=(2 4 6 12 14 16 18 20 24 28 30 32 34 36 38 42 44 46 52 146 178 220 222 226 228 232 246)
BN_15=(1 2 3 5 7 11 13 17 19 21 23 25 27 29 31 33 37 41 55 221 227 228 229 231)
BN_19=(3 5 11 13 15 17 21 23 27 37 41 43 45 51 179 219 221 225 227 228 231)
BN_21=(1 3 5 11 13 15 17 19 23 25 27 29 31 35 37 41 43 45 51 121 177 179 219 221 225 227 228 229)
Group=(CC HC)

######################################################

for GRP in "${Group[@]}"
do
  case $GRP in
    CC)
      echo "Working on $GRP group"
      for parc in "${parcs[@]}"
      do
        echo "Working on $GRP group $parc parcellation"
        rm $OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
        rm $OUT_DIR/"$parc"/"$GRP"_Group/tmp1Vols.txt
        rm $OUT_DIR/"$parc"/"$GRP"_Group/tmpVols.txt


        for numrun in "${runs[@]}"
         do
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_FA.txt
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_MD.txt
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_RD.txt
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_AD.txt
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_meanAFDalongStrs.txt

           for nummni in "${CC_grp[@]}"
           do
             echo "Working on subject $nummni run $numrun"
             PROJECT_DIR=$START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
             cd $PROJECT_DIR
             #Tract volume
             awk "/volume/{print}" "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt >$OUT_DIR/"$parc"/"$GRP"_Group/tmp1Vols.txt
             awk '{print $2}' "$OUT_DIR"/"$parc"/"$GRP"_Group/tmp1Vols.txt >> $OUT_DIR/"$parc"/"$GRP"_Group/tmpVols.txt

             awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt>> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_FA.txt
             awk '{print $1 " " $2 " " $3 " " $4 " " $8 " " $9 " " $10}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt>> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_MD.txt
             awk '{print $1 " " $2 " " $3 " " $4 " " $11 " " $12 " " $13}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt >> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_RD.txt
             awk '{print $1 " " $2 " " $3 " " $4 " " $14 " " $15 " " $16}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt>> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_AD.txt
             awk '{print $1 " " $2 " " $3 " " $4 " " $17 " " $18 " " $19}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt>> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_meanAFDalongStrs.txt
	              case $parc in
	                AICHA_1mm)
		                for Aicha_ROI in "${Aicha_ROIs[@]}"
				            do
			                case $Aicha_ROI in
			                  20)
					                roinum=$Aicha_ROI
                          for Aicha_label in "${Aicha_20[@]}"
            							do
                            echo "Extracting tract name for tract $roinum-$Aicha_label"
                            echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
				                  done
								         ;;
								        22)
									        roinum=$Aicha_ROI
                          for Aicha_label in "${Aicha_22[@]}"
            							do
                            echo "Extracting tract name for tract $roinum-$Aicha_label"
                            echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
				                  done
									      ;;
                        24)
                        roinum=$Aicha_ROI
                        for Aicha_label in "${Aicha_24[@]}"
                        do
                          echo "Extracting tract name for tract $roinum-$Aicha_label"
                          echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                        done
                        ;;
                        26)
                        roinum=$Aicha_ROI
                        for Aicha_label in "${Aicha_26[@]}"
                        do
                          echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                        done
	                       ;;
                         28)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_28[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         19)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_19[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         21)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_21[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         23)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_23[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         25)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_25[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         27)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_27[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                       esac
                     done
                     ;;
          BN_Atlas_246_1mm)
            for BN_ROI in "${BN_ROIs[@]}"
						do
							case $BN_ROI in
								16)
									roinum=$BN_ROI
									for BN_label in "${BN_16[@]}"
									do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
									done
                ;;
                20)
                  roinum=$BN_ROI
									for BN_label in "${BN_20[@]}"
									do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
									done
                ;;
                22)
                  roinum=$BN_ROI
									for BN_label in "${BN_22[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
								15)
									roinum=$BN_ROI
                  for BN_label in "${BN_15[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
                19)
                  roinum=$BN_ROI
                  for BN_label in "${BN_19[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
                21)
                  roinum=$BN_ROI
                  for BN_label in "${BN_21[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
								esac
							done
					esac
				done
        paste "$OUT_DIR"/"$parc"/"$GRP"_Group/tmp2.txt "$OUT_DIR"/"$parc"/"$GRP"_Group/tmpVols.txt > "$OUT_DIR"/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_tractVolumes.txt
      done
    done
    ;;
    HC)
      echo "this is group $GRP"
      for parc in "${parcs[@]}"
      do
        echo "Working on $GRP group $parc parcellation"
        rm $OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
        rm $OUT_DIR/"$parc"/"$GRP"_Group/tmp1Vols.txt
        rm $OUT_DIR/"$parc"/"$GRP"_Group/tmpVols.txt

        for numrun in "${runs[@]}"
         do
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_FA.txt
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_MD.txt
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_RD.txt
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_AD.txt
           rm $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_meanAFDalongStrs.txt

           for nummni in "${HC_grp[@]}"
           do

             PROJECT_DIR=$START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
             cd $PROJECT_DIR
             #Tract volume
             awk "/volume/{print}" "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt >$OUT_DIR/"$parc"/"$GRP"_Group/tmp1Vols.txt
             awk '{print $2}' "$OUT_DIR"/"$parc"/"$GRP"_Group/tmp1Vols.txt >> $OUT_DIR/"$parc"/"$GRP"_Group/tmpVols.txt

             awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt>> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_FA.txt
             awk '{print $1 " " $2 " " $3 " " $4 " " $8 " " $9 " " $10}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt>> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_MD.txt
             awk '{print $1 " " $2 " " $3 " " $4 " " $11 " " $12 " " $13}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt >> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_RD.txt
             awk '{print $1 " " $2 " " $3 " " $4 " " $14 " " $15 " " $16}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt>> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_AD.txt
             awk '{print $1 " " $2 " " $3 " " $4 " " $17 " " $18 " " $19}' "$PROJECT_DIR"/"$nummni"_run"$numrun"_"$parc"_metrics.txt>> $OUT_DIR/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_meanAFDalongStrs.txt

                case $parc in
                  AICHA_1mm)
                    for Aicha_ROI in "${Aicha_ROIs[@]}"
                    do
                      case $Aicha_ROI in
                        20)
                          roinum=$Aicha_ROI
                          for Aicha_label in "${Aicha_20[@]}"
                          do
                            echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                          done
                         ;;
                        22)
                          roinum=$Aicha_ROI
                          for Aicha_label in "${Aicha_22[@]}"
                          do
                            echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                          done
                        ;;
                        24)
                        roinum=$Aicha_ROI
                        for Aicha_label in "${Aicha_24[@]}"
                        do
                          echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                        done
                        ;;
                        26)
                        roinum=$Aicha_ROI
                        for Aicha_label in "${Aicha_26[@]}"
                        do
                          echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                        done
                         ;;
                         28)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_28[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         19)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_19[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         21)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_21[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         23)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_23[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         25)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_25[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                         27)
                         roinum=$Aicha_ROI
                         for Aicha_label in "${Aicha_27[@]}"
                         do
                           echo "$nummni" "$roinum" "$Aicha_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                         done
                         ;;
                       esac
                     done
                     ;;
                    BN_Atlas_246_1mm)
                     for BN_ROI in "${BN_ROIs[@]}"
            do
              case $BN_ROI in
                16)
                  roinum=$BN_ROI
                  for BN_label in "${BN_16[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
                20)
                  roinum=$BN_ROI
                  for BN_label in "${BN_20[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
                22)
                  roinum=$BN_ROI
                  for BN_label in "${BN_22[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
                15)
                  roinum=$BN_ROI
                  for BN_label in "${BN_15[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
                19)
                  roinum=$BN_ROI
                  for BN_label in "${BN_19[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
                21)
                  roinum=$BN_ROI
                  for BN_label in "${BN_21[@]}"
                  do
                    echo "$nummni" "$roinum" "$BN_label">>$OUT_DIR/"$parc"/"$GRP"_Group/tmp2.txt
                  done
                ;;
                esac
              done
          esac
        done
        paste "$OUT_DIR"/"$parc"/"$GRP"_Group/tmp2.txt "$OUT_DIR"/"$parc"/"$GRP"_Group/tmpVols.txt > "$OUT_DIR"/"$parc"/"$GRP"_Group/All_"$GRP"_run"$numrun"_"$parc"_tractVolumes.txt
      done
    done
  esac
done
