#!/bin/bash
#SBATCH --account=def-aptito
#SBATCH --time=20:00:00
#SBATCH --mem-per-cpu=4028M
#SBATCH --mail-user=guidoguberman@gmail.com
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL

TEMPLATE_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/Templates
ROI_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/Templates/Buckner_JNeurophysiol11_MNI152
WORKING_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/MNI
npv=24
seeding_method=int
subs=(TC001 TC002 TC003 TC004 TC005 TC006 TC007 TC008 TC009 TC010 TC011 TC013 TC014 TC015 TC016 TC017 TC018 \
	TC019 TC020 TC021 TC022 TC023 TC024 TC025 TC026 TC028 TC029 TC030 TC031 TC032 TC033 TC034 TC036 TC037 TC038 TC039 TC040 TC041 TC042 TC043 TC044 TC045 TC046 TC049 TC052 \
	TC054 TC055 TC056 TC057 TC059 TC060 TC071 TC073 TC074 TC076 TC077 TC078 TC079 TC050 TC058 TC069 TC061)
#(TC069 TC061)
#
runs=(1)
parcs=(AICHA_1mm BN_Atlas_246_1mm)

######################################################
for nummni in "${subs[@]}"
do
	for numrun in "${runs[@]}"
	do

		cd $WORKING_DIR/"$nummni"/DWI/Preproc1/"$nummni"_diff"$numrun"
#

		cd "$nummni"_"$numrun"_ROIs
#		echo "Registering MNI to DWI space, suject $nummni run $numrun"
#		rm "$nummni"_MNI2DWI"$numrun"_0GenericAffine.mat "$nummni"_MNI2DWI"$numrun"_test1InverseWarp.nii.gz "$nummni"_MNI2DWI"$numrun"_Warp.nii.gz "$nummni"_MNI2DWI"$numrun"_Warped.nii.gz
#		antsRegistrationSyN.sh -d 3 -f ../fa.nii.gz -f ../../"$nummni"_b0c_"$numrun"_1x1x1.nii -m $TEMPLATE_DIR/MNI152_T1_1mm_brain.nii -m $TEMPLATE_DIR/MNI152_T1_1mm_brain.nii -o "$nummni"_MNI2DWI"$numrun"_

#		mkdir "$nummni"_"$numrun"_ConnectivityProject
		cd "$nummni"_"$numrun"_ConnectivityProject

		for parc in "${parcs[@]}"
		do
			#echo "Transforming parcellation $parc to native DWI space, subject $nummni run $numrun"
			#rm "$nummni"_"$parc"_in_dwi"$numrun".nii
			#antsApplyTransforms -d 3 -r ../../../"$nummni"_b0c_"$numrun"_1x1x1.nii -t [../"$nummni"_MNI2DWI"$numrun"_0GenericAffine.mat,0] -n MultiLabel -i $ROI_DIR/"$parc".nii* -o "$nummni"_"$parc"_in_dwi"$numrun".nii -v 1

			echo "Computing whole-brain connectivity for subject $nummni run $numrun based on parcellation $parc"
			cd "$nummni"_"$numrun"_FollowUpAnalyses
			#scil_compute_robust_connectivity_matrix.py ../../"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated.trk "$nummni"_"$parc"_in_dwi"$numrun".nii "$nummni"_run"$numrun"_"$parc"_ConnMat_norm.csv --no_self_connection --normalize --tp trackvis -f
			#scil_compute_robust_connectivity_matrix.py ../../"$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated.trk "$nummni"_"$parc"_in_dwi"$numrun".nii "$nummni"_run"$numrun"_"$parc"_ConnMat.csv --no_self_connection --tp trackvis -f
			scil_compute_robust_connectivity_matrix.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_noCerebellum.trk ../"$nummni"_"$parc"_in_dwi"$numrun".nii "$nummni"_run"$numrun"_"$parc"_noCerebellum_ConnMat_norm.csv --no_self_connection --normalize --tp trackvis -f
			scil_compute_robust_connectivity_matrix.py "$nummni"_run"$numrun"_prob_pft_fodf_npv"$npv"_"$seeding_method"_fc02_20-200_noloops_migrated_noCerebellum.trk ../"$nummni"_"$parc"_in_dwi"$numrun".nii "$nummni"_run"$numrun"_"$parc"_noCerebellum_ConnMat.csv --no_self_connection --tp trackvis -f
		done
	done
done
