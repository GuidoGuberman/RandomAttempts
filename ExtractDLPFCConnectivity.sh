START_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/MNI

cd $START_DIR

mkdir ConnectivityProject
grp1=(CC)
grp2=(HC)
grps=(CC HC)
CC_grp=(TC001 TC007 TC033 TC042 TC054 TC056 TC057 TC071 TC073 TC074 TC076 TC077 TC078 TC079 TC050 TC069) #CC
HC_grp=(TC002 TC003 TC004 TC005 TC006 TC008 TC009 TC010 TC011 TC013 TC014 TC015 TC016 TC017 TC018 TC019 TC020 TC021 TC022 TC023 TC024 TC025 TC026 TC028 TC029 TC030 TC031 TC032 TC034 TC036 TC037 TC038 TC039 TC040 TC041 TC043 TC044 TC045 TC046 TC049 TC052 TC055 TC059 TC060 TC058 TC061) #HC
runs=(1)
#parcs1=(Aicha_with_DLPFC)
#parcs4=(Brainnetome_with_DLPFC)
parcs2=(AICHA_1mm)
parcs3=(BN_Atlas_246_1mm)
#parcs=(Aicha_with_DLPFC Brainnetome_with_DLPFC AICHA_1mm BN_Atlas_246_1mm)
parcs=(AICHA_1mm BN_Atlas_246_1mm)
#parc1RNs=(1 21 22)
parc2RNs=(1 20 21 22 23 24 25 26 27 28 29)#Note: 1 is the labels row. The numbers here are the row where the ROIs are found, not the actual label numbers of the ROI.
parc3RNs=(1 16 17 20 21 22 23)
#parc4RNs=(1 19 20)
#####################################################################ALL VARIABLES ABOVE ARE MODIFIABLE#####################################################
##############THE ONLY THING MODIFIABLE BELOW ARE SPECIFIC PATHS############################################################################################

for grp in "${grp1[@]}"
do
	for nummni in "${CC_grp[@]}"
	do
		for numrun in "${runs[@]}"
		do
#			for parc in "${parcs1[@]}"
#			do
#				mkdir $START_DIR/ConnectivityProject/"$parc"
#				cd $START_DIR/ConnectivityProject/"$parc"
#				mkdir "$grp"_Group
#
#				cd $START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
#				rm "$nummni"_run"$numrun"_"$parc"_spConn.txt
#
#				for parcRN in "${parc1RNs[@]}"
#				do
#					rm "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
#					echo "$nummni" `awk "NR==$parcRN {print}" "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv` > "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
#				done
#				cat "$nummni"_run"$numrun"_"$parc"_spConntmp*.txt > "$nummni"_run"$numrun"_"$parc"_spConn.txt
#				cp "$nummni"_run"$numrun"_"$parc"_spConn.txt $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/"$nummni"_run"$numrun"_"$parc"_spConn.txt
#			done

#			for parc in "${parcs4[@]}"
#			do
#				mkdir $START_DIR/ConnectivityProject/"$parc"
#				cd $START_DIR/ConnectivityProject/"$parc"
#				mkdir "$grp"_Group
#
#				cd $START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
#				rm "$nummni"_run"$numrun"_"$parc"_spConn.txt
#
#				for parcRN in "${parc4RNs[@]}"
#				do
#					rm "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
#					echo "$nummni" `awk "NR==$parcRN {print}" "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv` > "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
#				done
#				cat "$nummni"_run"$numrun"_"$parc"_spConntmp*.txt > "$nummni"_run"$numrun"_"$parc"_spConn.txt
#				cp "$nummni"_run"$numrun"_"$parc"_spConn.txt $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/"$nummni"_run"$numrun"_"$parc"_spConn.txt
#			done

			for parc in "${parcs2[@]}"
			do
				mkdir $START_DIR/ConnectivityProject/"$parc"
				cd $START_DIR/ConnectivityProject/"$parc"
				mkdir "$grp"_Group

				cd $START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
				rm "$nummni"_run"$numrun"_"$parc"_spConn.txt

				for parcRN in "${parc2RNs[@]}"
				do
					rm "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
					echo "$nummni" `awk "NR==$parcRN {print}" "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv` > "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
				done
				cat "$nummni"_run"$numrun"_"$parc"_spConntmp*.txt > "$nummni"_run"$numrun"_"$parc"_spConn.txt
				cp "$nummni"_run"$numrun"_"$parc"_spConn.txt $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/"$nummni"_run"$numrun"_"$parc"_spConn.txt
			done


			for parc in "${parcs3[@]}"
			do
				mkdir $START_DIR/ConnectivityProject/"$parc"
				cd $START_DIR/ConnectivityProject/"$parc"
				mkdir "$grp"_Group

				cd $START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
				rm "$nummni"_run"$numrun"_"$parc"_spConn.txt

				for parcRN in "${parc3RNs[@]}"
				do
					rm "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
					echo "$nummni" `awk "NR==$parcRN {print}" "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv` > "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
				done
				cat "$nummni"_run"$numrun"_"$parc"_spConntmp*.txt > "$nummni"_run"$numrun"_"$parc"_spConn.txt
				cp "$nummni"_run"$numrun"_"$parc"_spConn.txt $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/"$nummni"_run"$numrun"_"$parc"_spConn.txt
			done
		done
	done
done




for grp in "${grp2[@]}"
do
	for nummni in "${HC_grp[@]}"
	do
		for numrun in "${runs[@]}"
		do
#			for parc in "${parcs1[@]}"
#			do
#				mkdir $START_DIR/ConnectivityProject/"$parc"
#				cd $START_DIR/ConnectivityProject/"$parc"
#				mkdir "$grp"_Group
#
#				cd $START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
#				rm "$nummni"_run"$numrun"_"$parc"_spConn.txt
#
#				for parcRN in "${parc1RNs[@]}"
#				do
#					rm "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
#					echo "$nummni" `awk "NR==$parcRN {print}" "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv` > "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
#				done
#				cat "$nummni"_run"$numrun"_"$parc"_spConntmp*.txt > "$nummni"_run"$numrun"_"$parc"_spConn.txt
#				cp "$nummni"_run"$numrun"_"$parc"_spConn.txt $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/"$nummni"_run"$numrun"_"$parc"_spConn.txt
#			done
#
#			for parc in "${parcs4[@]}"
#			do
#				mkdir $START_DIR/ConnectivityProject/"$parc"
#				cd $START_DIR/ConnectivityProject/"$parc"
#				mkdir "$grp"_Group
#
#				cd $START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
#				rm "$nummni"_run"$numrun"_"$parc"_spConn.txt
#
#				for parcRN in "${parc4RNs[@]}"
#				do
#					rm "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
#					echo "$nummni" `awk "NR==$parcRN {print}" "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv` > "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
#				done
#				cat "$nummni"_run"$numrun"_"$parc"_spConntmp*.txt > "$nummni"_run"$numrun"_"$parc"_spConn.txt
#				cp "$nummni"_run"$numrun"_"$parc"_spConn.txt $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/"$nummni"_run"$numrun"_"$parc"_spConn.txt
#			done


			for parc in "${parcs2[@]}"
			do
				mkdir $START_DIR/ConnectivityProject/"$parc"
				cd $START_DIR/ConnectivityProject/"$parc"
				mkdir "$grp"_Group

				cd $START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
				rm "$nummni"_run"$numrun"_"$parc"_spConn.txt

				for parcRN in "${parc2RNs[@]}"
				do
					rm "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
					echo "$nummni" `awk "NR==$parcRN {print}" "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv` > "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
				done
				cat "$nummni"_run"$numrun"_"$parc"_spConntmp*.txt > "$nummni"_run"$numrun"_"$parc"_spConn.txt
				cp "$nummni"_run"$numrun"_"$parc"_spConn.txt $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/"$nummni"_run"$numrun"_"$parc"_spConn.txt
			done


			for parc in "${parcs3[@]}"
			do
				mkdir $START_DIR/ConnectivityProject/"$parc"
				cd $START_DIR/ConnectivityProject/"$parc"
				mkdir "$grp"_Group

				cd $START_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
				rm "$nummni"_run"$numrun"_"$parc"_spConn.txt

				for parcRN in "${parc3RNs[@]}"
				do
					rm "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
					echo "$nummni" `awk "NR==$parcRN {print}" "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv` > "$nummni"_run"$numrun"_"$parc"_spConntmp"$parcRN".txt
				done
				cat "$nummni"_run"$numrun"_"$parc"_spConntmp*.txt > "$nummni"_run"$numrun"_"$parc"_spConn.txt
				cp "$nummni"_run"$numrun"_"$parc"_spConn.txt $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/"$nummni"_run"$numrun"_"$parc"_spConn.txt
			done
		done
	done
done

for numrun in "${runs[@]}"
do
	for parc in "${parcs[@]}"
	do
		for grp in "${grps[@]}"
		do
			cd $START_DIR/ConnectivityProject/"$parc"/"$grp"_Group/
			rm ALL_"$grp"_run"$numrun"_"$parc"_spConn.txt
			cat *_run"$numrun"_"$parc"_spConn.txt > ALL_"$grp"_run"$numrun"_"$parc"_spConn.txt
		done
	done
done
