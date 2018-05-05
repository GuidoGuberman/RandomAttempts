START_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/ConnectivityProject/
TEMPLATE_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/Templates/DLPFCConnectivityStudy
SUB_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/

subs=(TC038)
#(TC001 TC007 TC033 TC042 TC054 TC056 TC057 TC071 TC073 TC074 TC076 TC077 TC078 TC079 TC050 TC069 TC002 TC003 TC004 TC005 TC006 TC008 TC009 TC010 TC011 TC013 TC014 TC015 TC016 TC017 TC018 \
#TC019 TC020 TC021 TC022 TC023 TC024 TC025 TC026 TC028 TC029 TC030 TC031 TC032 TC034 TC036 TC037 TC038 TC039 TC040 TC041 TC043 TC044 TC045 TC046 TC049 TC052 TC055 TC059 TC060 TC058 TC061)


grp1=(CC)
grp2=(HC)
grps=(CC HC)
CC_grp=(TC001 TC007 TC033 TC042 TC054 TC056 TC057 TC071 TC073 TC074 TC076 TC077 TC078 TC079 TC050 TC069) #CC
HC_grp=(TC002 TC003 TC004 TC005 TC006 TC008 TC009 TC010 TC011 TC013 TC014 TC015 TC016 TC017 TC018 TC019 TC020 TC021 TC022 TC023 TC024 TC025 TC026 TC028 TC029 TC030 TC031 TC032 TC034 TC036 \
TC037 TC038 TC039 TC040 TC041 TC043 TC044 TC045 TC046 TC049 TC052 TC055 TC059 TC060 TC058 TC061) #HC


runs=(1)

parcs=(AICHA_1mm BN_Atlas_246_1mm)

parc1=(AICHA_1mm)
parc2=(BN_Atlas_246_1mm)
#parcs=(Aicha_with_DLPFC Brainnetome_with_DLPFC AICHA_1mm BN_Atlas_246_1mm)

#parc1RNs=(1 21 22)
parc1rhROI=(24 28 360)
parc1lhROI=(27 57)
parc2rhROI=(22 246)
parc2lhROI=()
npv=24
seeding_map=interface.nii.gz
seeding_method=int


#######################################################

for parc in "${parc1[@]}"
do
	#THIS PART OF THE SCRIPT SHOULD BE MOVED TO THE TOP AND BE PUT INSIDE ITS OWN LOOP.
#	cd $TEMPLATE_DIR
#	mkdir "$parc"_labels
#	cd "$parc"_labels
#	echo "converting data type to int32 for parcellation $parc"
#	mrconvert ../"$parc".nii ../"$parc"_INT32.nii -datatype int32

#	echo "splitting volume labels for parcellation $parc"
#	scil_split_volume_labels.py ../"$parc"_INT32.nii ids

	for nummni in "${subs[@]}"
	do
		for numrun in "${runs[@]}"
		do
			echo "Now analyzing subject $nummni run $numrun parcellation $parc"
			cd $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"
			mkdir "$nummni"_run"$numrun"_metrics #Note: this directory should ideally be created in the preproc1 script. Run in this script once but then comment out for future iterations.
#			cp fa.nii.gz "$nummni"_run"$numrun"_metrics/fa.nii.gz
#			cp md_ransac.nii* "$nummni"_run"$numrun"_metrics/md.nii.gz
#			cp ad_ransac.nii* "$nummni"_run"$numrun"_metrics/ad.nii.gz
#			cp rd_ransac.nii* "$nummni"_run"$numrun"_metrics/rd.nii.gz
#			cp fodf.nii.gz "$nummni"_run"$numrun"_metrics/fodf.nii.gz


			cp fa.nii.gz "$nummni"_run"$numrun"_metrics/"$nummni"_run"$numrun"_fa.nii.gz
			cp md_ransac.nii* "$nummni"_run"$numrun"_metrics/"$nummni"_run"$numrun"_md.nii.gz
			cp ad_ransac.nii* "$nummni"_run"$numrun"_metrics/"$nummni"_run"$numrun"_ad.nii.gz
			cp rd_ransac.nii* "$nummni"_run"$numrun"_metrics/"$nummni"_run"$numrun"_rd.nii.gz
			cp fodf.nii.gz "$nummni"_run"$numrun"_metrics/"$nummni"_run"$numrun"_fodf.nii.gz

			PROJECT_DIR=$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
			cd $PROJECT_DIR
			rm "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt "$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt "$nummni"_run"$numrun"_"$parc"_DTImetrics.txt #RM here because they only get updated at the level of sub_run.

			echo "Splitting labels for subject $nummni run $numrun $parc"
			cd $PROJECT_DIR
			mkdir "$nummni"_run"$numrun"_"$parc"_labels
			cd "$nummni"_run"$numrun"_"$parc"_labels
			mrconvert ../"$nummni"_"$parc"_in_dwi"$numrun".nii "$nummni"_"$parc"_in_dwi"$numrun"_INT32.nii -datatype int32
			scil_split_volume_labels.py "$nummni"_"$parc"_in_dwi"$numrun"_INT32.nii ids


			cd $PROJECT_DIR
			for parc1rhROIs2 in "${parc1rhROI[@]}"
			do
				echo "Applying first ROI lbl$parc1rhROIs2, subject $nummni run $numrun"
				scil_robust_filter_tractogram.py $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated.trk \
				"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1rhROIs2".trk --drawn_roi \
				$PROJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$parc1rhROIs2".nii* --either_end -f
			done

			for parc1rhROIs in "${parc1rhROI[@]}"
			do
				for roinum2 in "${parc1rhROI[@]}"
				do
					if [ "$parc1rhROIs" -ne "$roinum2" -a "$parc1rhROIs" -lt "$roinum2" ]
					then
						echo "Applying second ROI lbl$roinum2 to lbl$parc1rhROIs, subject $nummni run $numrun"
						scil_robust_filter_tractogram.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1rhROIs".trk \
						"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1rhROIs"_lbl"$roinum2".trk --drawn_roi \
						$PROJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$roinum2".nii* --either_end -f

						echo "cutting streamlines in tract lbl$parc1rhROIs-lbl$roinum2"
						scil_cut_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1rhROIs"_lbl"$roinum2".trk \
						$RPOJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$parc1rhROIs2".nii* $RPOJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$roinum2".nii* \
						"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1rhROIs"_lbl"$roinum2"_cut.trk


						echo "Computing tractometry metrics for subject $nummni run $numrun"

						echo "Computing tract volume for tract connecting lbl$parc1rhROIs with lbl$roinum2"
						scil_tractometry_bundle_volume.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1rhROIs"_lbl"$roinum2"_cut.trk \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_MNI2DWI"$numrun"_Warped.nii.gz >> "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt

						echo "Computing AFD along streamlines for tract connecting lbl$parc1rhROIs with lbl$roinum2"
						scil_compute_afd_along_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1rhROIs"_lbl"$roinum2"_cut.trk \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/"$nummni"_run"$numrun"_fodf.nii.gz --jump 1 --tp trackvis >>"$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt

						echo "Computing DTI metrics over streamlines for tract connecting lbl$parc1rhROIs with lbl$roinum2"

						#echo "$numni" "$numrun" "lbl$parc1rhROIs" "lbl$roinum2" \
						#`scil_compute_metrics_stats_over_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_lbl"$parc1rhROIs"_lbl"$roinum2".trk \
						#--metrics $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/fa.nii.gz \
						#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/md.nii.gz \
						#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/rd.nii.gz \
						#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/ad.nii.gz --binary --tp trackvis` >>"$nummni"_run"$numrun"_DTImetrics.txt

						echo "$numni" "$numrun" "lbl$parc1rhROIs" "lbl$roinum2" \
						`scil_compute_metrics_stats_over_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1rhROIs"_lbl"$roinum2"_cut.trk \
						--metrics $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/fa.nii.gz \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/md_ransac.nii \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/rd_ransac.nii \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/ad_ransac.nii --binary --tp trackvis` >>"$nummni"_run"$numrun"_"$parc"_DTImetrics.txt
					fi
				done
			done

			for parc1lhROIs2 in "${parc1lhROI[@]}"
			do
				echo "Applying first ROI lbl$parc1lhROIs2, subject $nummni run $numrun"
				scil_robust_filter_tractogram.py $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated.trk \
				"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1lhROIs2".trk --drawn_roi \
				$PROJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$parc1lhROIs2".nii* -f
			done

			for parc1lhROIs in "${parc1lhROI[@]}"
			do
				for roinum3 in "${parc1lhROI[@]}"
				do
					if [ "$parc1lhROIs" -ne "$roinum3" -a "$parc1lhROIs" -lt "$roinum3" ]
					then
						echo "Applying second ROI lbl$roinum3 to lbl$parc1lhROIs, subject $nummni run $numrun"
						scil_robust_filter_tractogram.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1lhROIs".trk \
						"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1lhROIs"_lbl"$roinum3".trk --drawn_roi \
						$PROJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$roinum3".nii* -f

						echo "cutting streamlines in tract lbl$parc1lhROIs-lbl$roinum3"
						scil_cut_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1lhROIs"_lbl"$roinum3".trk \
						$RPOJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$parc1lhROIs2".nii* $RPOJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$roinum3".nii* \
						"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1lhROIs"_lbl"$roinum3"_cut.trk

						echo "Computing tractometry metrics for subject $nummni run $numrun"

						echo "Computing tract volume for tract connecting lbl$parc1lhROIs with lbl$roinum3"
						scil_tractometry_bundle_volume.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1lhROIs"_lbl"$roinum3"_cut.trk \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_MNI2DWI"$numrun"_Warped.nii.gz >> "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt

						echo "Computing AFD along streamlines for tract connecting lbl$parc1lhROIs with lbl$roinum3"
						scil_compute_afd_along_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1lhROIs"_lbl"$roinum3"_cut.trk \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/"$nummni"_run"$numrun"_fodf.nii.gz --jump 1 --tp trackvis >>"$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt

						echo "Computing DTI metrics over streamlines for tract connecting lbl$parc1lhROIs with lbl$roinum3"

					#echo "$numni" "$numrun" "lbl$parc1rhROIs" "lbl$roinum2" \
					#`scil_compute_metrics_stats_over_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_lbl"$parc1rhROIs"_lbl"$roinum2".trk \
					#--metrics $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/fa.nii.gz \
					#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/md.nii.gz \
					#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/rd.nii.gz \
					#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/ad.nii.gz --binary --tp trackvis` >>"$nummni"_run"$numrun"_DTImetrics.txt

						echo "$numni" "$numrun" "lbl$parc1lhROIs" "lbl$roinum3" \
						`scil_compute_metrics_stats_over_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc1lhROIs"_lbl"$roinum3"_cut.trk \
						--metrics $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/fa.nii.gz \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/md_ransac.nii \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/rd_ransac.nii \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/ad_ransac.nii --binary --tp trackvis` >>"$nummni"_run"$numrun"_"$parc"_DTImetrics.txt
				fi
			done
		done
	done
done
done





for parc in "${parc2[@]}"
do
#	cd $TEMPLATE_DIR
#	mkdir "$parc"_labels
#	cd "$parc"_labels
#	echo "converting data type to int32 for parcellation $parc"
#	mrconvert ../"$parc".nii ../"$parc"_INT32.nii -datatype int32

#	echo "splitting volume labels for parcellation $parc"
#	scil_split_volume_labels.py ../"$parc"_INT32.nii ids

	for nummni in "${subs[@]}"
	do
		for numrun in "${runs[@]}"
		do
			echo "Now analyzing subject $nummni run $numrun parcellation $parc"
			cd $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
			rm "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt "$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt "$nummni"_run"$numrun"_"$parc"_DTImetrics.txt #RM here because they only get updated at the level of sub_run.

			echo "Splitting labels for subject $nummni run $numrun $parc"
			cd $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
			mkdir "$nummni"_run"$numrun"_"$parc"_labels
			cd "$nummni"_run"$numrun"_"$parc"_labels
			mrconvert ../"$nummni"_"$parc"_in_dwi"$numrun".nii "$nummni"_"$parc"_in_dwi"$numrun"_INT32.nii -datatype int32
			scil_split_volume_labels.py "$nummni"_"$parc"_in_dwi"$numrun"_INT32.nii ids

			cd $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject
			for parc2rhROIs2 in "${parc2rhROI[@]}"
			do
				echo "Applying first ROI lbl$parc2rhROIs2, subject $nummni run $numrun"
				scil_robust_filter_tractogram.py $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated.trk \
				"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc2rhROIs2".trk --drawn_roi \
				$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject/"$nummni"_run"$numrun"_"$parc"_labels/"$parc2rhROIs2".nii* --either_end -f
			done

			for parc2rhROIs in "${parc2rhROI[@]}"
			do
				for roinum4 in "${parc2rhROI[@]}"
				do
					if [ "$parc2rhROIs" -ne "$roinum4" -a "$parc2rhROIs" -lt "$roinum4" ]
					then
						echo "Applying second ROI lbl$roinum4 to lbl$parc2rhROIs, subject $nummni run $numrun"
						scil_robust_filter_tractogram.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc2rhROIs".trk \
						"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc2rhROIs"_lbl"$roinum4".trk --drawn_roi \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_"$numrun"_ConnectivityProject/"$nummni"_run"$numrun"_"$parc"_labels/"$roinum4".nii* --either_end -f

						echo "cutting streamlines in tract lbl$parc2rhROIs-lbl$roinum4"
						scil_cut_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc2rhROIs"_lbl"$roinum4".trk \
						$RPOJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$parc2rhROIs2".nii* $RPOJECT_DIR/"$nummni"_run"$numrun"_"$parc"_labels/"$roinum4".nii* \
						"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc2rhROIs"_lbl"$roinum4"_cut.trk

						echo "Computing tractometry metrics for subject $nummni run $numrun"

						echo "Computing tract volume for tract connecting lbl$parc2rhROIs with lbl$roinum4"
						scil_tractometry_bundle_volume.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc2rhROIs"_lbl"$roinum4"_cut.trk \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_"$numrun"_ROIs/"$nummni"_MNI2DWI"$numrun"_Warped.nii.gz >> "$nummni"_run"$numrun"_"$parc"_tractVolumes.txt

						echo "Computing AFD along streamlines for tract connecting lbl$parc2rhROIs with lbl$roinum4"
						scil_compute_afd_along_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc2rhROIs"_lbl"$roinum4"_cut.trk \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/"$nummni"_run"$numrun"_fodf.nii.gz --jump 1 --tp trackvis >>"$nummni"_run"$numrun"_"$parc"_AFDalongstrs.txt

						echo "Computing DTI metrics over streamlines for tract connecting lbl$parc2rhROIs with lbl$roinum4"

						#echo "$numni" "$numrun" "lbl$parc1rhROIs" "lbl$roinum2" \
						#`scil_compute_metrics_stats_over_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_lbl"$parc1rhROIs"_lbl"$roinum2".trk \
						#--metrics $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/fa.nii.gz \
						#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/md.nii.gz \
						#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/rd.nii.gz \
						#$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/"$nummni"_run"$numrun"_metrics/ad.nii.gz --binary --tp trackvis` >>"$nummni"_run"$numrun"_DTImetrics.txt

						echo "$numni" "$numrun" "lbl$parc2rhROIs" "lbl$roinum4" \
						`scil_compute_metrics_stats_over_streamlines.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_"$parc"_lbl"$parc2rhROIs"_lbl"$roinum4"_cut.trk \
						--metrics $SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/fa.nii.gz \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/md_ransac.nii \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/rd_ransac.nii \
						$SUB_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"/ad_ransac.nii --binary --tp trackvis` >>"$nummni"_run"$numrun"_"$parc"_DTImetrics.txt
					fi
				done
			done
	done
done
done




#specify the pair of connections you want to extract from your whole brain tractogram
#transform them to native diffusion space (although you could consider splitting the labels from the subject-specific parcellations which you use in your WBscript)

#Extract them by applying scil_robust_filter... in two steps

#Then generate binary maps from those connections

#Then extract measures (FA,volume,AFD,and after processing run2s, add AFDalongstreamlines)
