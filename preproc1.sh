

export OMP_NUM_THREADS=4
START_DIR=/Users/Guido/Documents/Analyses/subjects/PedsData/MNI
subs=(TC001 TC002 TC003 TC004 TC005 TC006 TC007 TC008 TC009 TC010 TC011 TC013 TC014 TC015 TC016 TC017 TC018 TC019 TC020 TC021 TC022 TC023 \
	TC024 TC025 TC026 TC028 TC029 TC030 TC031 TC032 TC033 TC034 TC036 TC037 TC038 TC039 TC040 TC041 TC042 TC043 TC044 TC045 TC046 TC049 TC052 \
	TC054 TC055 TC056 TC057 TC059 TC060 TC071 TC073 TC074 TC076 TC077 TC078 TC079 TC050 TC058 TC069 TC061)
runs=(2)

########################################################################

for  nummni in "${subs[@]}"
do
	for numrun in "${runs[@]}"
	do
	 	cd $START_DIR/"$nummni"/DWI
 		#mkdir Preproc1
 		cd Preproc1

		echo "Now processing subject $nummni run $numrun"

		echo "Converting to RAS (mrconvert) for subject $nummni run $numrun"
		rm "$nummni"_dwi"$numrun".nii "$nummni"_bvecs"$numrun"_x
		mrconvert ../"$nummni"_DWI"$numrun".nii* "$nummni"_dwi"$numrun".nii -stride +1,+2,+3,+4
		scil_flip_grad.py ../bvecs"$numrun" "$nummni"_bvecs"$numrun"_x x --fsl
		cp ../bvals"$numrun" bvals"$numrun"

 		echo "Extracting mean b0 image and BET for DWI for subject $nummni run $numrun"
		rm "$nummni"_mean_b0_"$numrun".nii "$nummni"_mean_b0_"$numrun"_brain_mask.nii.gz "$nummni"_mean_b0_"$numrun"_brain.nii.gz
		scil_extract_b0.py "$nummni"_dwi"$numrun".nii bvals"$numrun" "$nummni"_bvecs"$numrun"_x "$nummni"_mean_b0_"$numrun".nii --mean
		bet "$nummni"_mean_b0_"$numrun".nii "$nummni"_mask_b0_"$numrun".nii -m -R -f 0.15
		mv "$nummni"_mask_b0_"$numrun".nii.gz "$nummni"_mean_b0_"$numrun"_brain.nii.gz
		mv "$nummni"_mask_b0_"$numrun"_mask.nii.gz "$nummni"_mean_b0_"$numrun"_brain_mask.nii.gz

		#
		# Denoising - NLSAM
		#
		# We use N=4 for Siemens scanners
		# Please cite: https://www.sciencedirect.com/science/article/pii/S1361841516000335

		echo "NLSAM denoising for subject $nummni run $numrun"
		rm "$nummni"_dwi"$numrun"_nlsam.nii
		nlsam_denoising "$nummni"_dwi"$numrun".nii "$nummni"_dwi"$numrun"_nlsam.nii 4 bvals"$numrun" "$nummni"_bvecs"$numrun"_x 5 --fix_implausible --mask "$nummni"_mean_b0_"$numrun"_brain_mask.nii.gz --noise_mask "$nummni"_piesno_mask"$numrun".nii \
		--save_stab "$nummni"_dwi_stab"$numrun".nii --save_sigma "$nummni"_sigma"$numrun".nii -f --verbose

#
# N4 inhomogeneity correction
#
#
	echo "Inhomogeneity correction for subject $nummni run $numrun"
	rm "$nummni"_b0_"$numrun".nii "$nummni"_b0_"$numrun"_n4.nii "$nummni"_bias_field_b0_"$numrun".nii "$nummni"_dwi"$numrun"_nlsam_n4.nii
	scil_extract_b0.py "$nummni"_dwi"$numrun"_nlsam.nii bvals"$numrun" "$nummni"_bvecs"$numrun"_x "$nummni"_b0_"$numrun".nii --mean
	N4BiasFieldCorrection -d 3 -i "$nummni"_b0_"$numrun".nii -o ["$nummni"_b0_n4.nii, "$nummni"_bias_field_b0_"$numrun".nii] -c [50x50x50x50, 0.001] > "$nummni"logN4b0.txt ; scil_apply_bias_field_on_dwi.py "$nummni"_dwi"$numrun"_nlsam.nii \
	"$nummni"_bias_field_b0_"$numrun".nii "$nummni"_dwi"$numrun"_nlsam_n4.nii -f



#../../prepare_index_file_for_eddy.py dwi.nii index.txt

# Dummy acqparams.txt. Does not change anything
#echo "0 1 0 0.051" > acqparams.txt

#
# LONG! Much faster on a cluster with eddy_openmp
# FSL > 5.1

	echo "Eddy current and motion correction for subject $nummni run $numrun"
	rm "$nummni"_dwi"$numrun"_eddy_nlsam_n4* "$nummni"_bvecs"$numrun"_eddy
	time eddy_openmp --imain="$nummni"_dwi"$numrun"_nlsam_n4.nii --mask="$nummni"_mean_b0_"$numrun"_brain_mask.nii.gz --index=../index.txt --acqp=../acqparams.txt --bvecs="$nummni"_bvecs"$numrun"_x --bvals=bvals"$numrun" --out="$nummni"_dwi"$numrun"_eddy_nlsam_n4
	cp "$nummni"_dwi"$numrun"_eddy_nlsam_n4.eddy_rotated_bvecs "$nummni"_bvecs"$numrun"_eddy

# On mammouth
# LD_LIBRARY_PATH=""
# OMP_NUM_THREADS=23
#
# eddy_openmp --imain=dwi --mask=mask_mask  \
#     --index=index.txt --acqp=acqparams.txt --bvecs=bvec --bvals=bval \
#     --out=dwi_nlsam_n4_eddy
#
# source ~/.bashrc


# QA: Motion artefact corrected!
#
#
	echo "Cropping images for subject $nummni run $numrun"
	rm  "$nummni"_dwi"$numrun"c.nii "$nummni"_mask_mask"$numrun"c.nii
	scil_crop_volume.py "$nummni"_mean_b0_"$numrun"_brain_mask.nii.gz "$nummni"_mask"$numrun"_crop.nii --output_bbox "$nummni"_box"$numrun".pkl -f --ignore_voxel_size
	scil_crop_volume.py "$nummni"_dwi"$numrun"_eddy_nlsam_n4.nii.gz "$nummni"_dwi"$numrun"-crop.nii --input_bbox "$nummni"_box"$numrun".pkl -f --ignore_voxel_size
	mv "$nummni"_dwi"$numrun"-crop.nii "$nummni"_dwi"$numrun"c.nii
	mv "$nummni"_mask"$numrun"_crop.nii "$nummni"_mask_mask"$numrun"c.nii

#
# Upsample to 1x1x1 space
#
	echo "Upsampling to 1x1x1 space for subject $nummni run $numrun"
	rm  "$nummni"_dwi"$numrun"c_1x1x1.nii "$nummni"_mask"$numrun"c_1x1x1.nii "$nummni"_b0c_"$numrun"_1x1x1.nii
	scil_resample_volume.py "$nummni"_dwi"$numrun"c.nii "$nummni"_dwi"$numrun"c_1x1x1.nii --resolution 1 --interp cubic -f
	scil_resample_volume.py "$nummni"_mask_mask"$numrun"c.nii "$nummni"_mask"$numrun"c_1x1x1.nii --resolution 1 --interp nn -f
	scil_extract_b0.py "$nummni"_dwi"$numrun"c_1x1x1.nii bvals"$numrun" "$nummni"_bvecs"$numrun"_eddy "$nummni"_b0c_"$numrun"_1x1x1.nii --mean
#
# Concatinate both acquisitions or NOT?
#   There is a rotation in between them. I would be tempted to not too
#    and use the DWI2 for test-retest and variation assessment
#


# DWI Pre-processing DONE.
##########################

#
# DTI reconstruction. Don't worry about warnings printed to the screen!
#
	mkdir "$nummni"_diff"$numrun"
	echo "Local reconstruction for subject $nummni run $numrun"
#
	cd "$nummni"_diff"$numrun"
	scil_compute_dti_metrics.py ../"$nummni"_dwi"$numrun"c_1x1x1.nii --mask ../"$nummni"_mask"$numrun"c_1x1x1.nii ../bvals"$numrun" ../"$nummni"_bvecs"$numrun"_eddy
	scil_remove_outliers_ransac.py md.nii.gz md_ransac.nii -f
	scil_remove_outliers_ransac.py ad.nii.gz ad_ransac.nii -f
	scil_remove_outliers_ransac.py rd.nii.gz rd_ransac.nii -f
	scil_remove_outliers_ransac.py md.nii.gz md_ransac.nii -f
	scil_remove_outliers_ransac.py ad.nii.gz ad_ransac.nii -f
	scil_remove_outliers_ransac.py rd.nii.gz rd_ransac.nii -f
	scil_remove_outliers_ransac.py md.nii.gz md_ransac.nii -f
	scil_remove_outliers_ransac.py ad.nii.gz ad_ransac.nii -f
	scil_remove_outliers_ransac.py rd.nii.gz rd_ransac.nii -f


	echo "Registering T1 to DWI for subject $nummni run $numrun"
	rm "$nummni"_mask_wm_ants.nii.gz "$nummni"_mask_gm_ants.nii.gz "$nummni"_mask_csf_ants.nii.gz "$nummni"_map_wm_ants.nii.gz "$nummni"_map_gm_ants.nii.gz "$nummni"_map_csf_ants.nii.gz "$nummni"_t1_brain_ants.nii.gz "$nummni"_t1c_nlm.nii
	cp ../../t1c_nlm.nii "$nummni"_t1c_nlm.nii
	antsRegistrationSyN.sh -d 3 -f fa.nii.gz -f ../"$nummni"_b0c_"$numrun"_1x1x1.nii -m "$nummni"_t1c_nlm.nii -m "$nummni"_t1c_nlm.nii -o "$nummni"_T1toDWI
	cp "$nummni"_T1toDWIWarped.nii.gz "$nummni"_T1toDWIWarped2.nii.gz
	fast -t 1 -n 3 -H 0.1 -I 4 -l 20.0 -g -o "$nummni"_T1toDWIWarped2.nii.gz "$nummni"_T1toDWIWarped2.nii.gz
	mv "$nummni"_T1toDWIWarped2_seg_2.nii.gz mask_wm_ants.nii.gz
	mv "$nummni"_T1toDWIWarped2_seg_1.nii.gz mask_gm_ants.nii.gz
	mv "$nummni"_T1toDWIWarped2_seg_0.nii.gz mask_csf_ants.nii.gz
	mv "$nummni"_T1toDWIWarped2_pve_2.nii.gz map_wm_ants.nii.gz
	mv "$nummni"_T1toDWIWarped2_pve_1.nii.gz map_gm_ants.nii.gz
	mv "$nummni"_T1toDWIWarped2_pve_0.nii.gz map_csf_ants.nii.gz


# clean up
#mkdir -p metrics
#mkdir -p work
#mv ad.nii md.nii rd.nii mode.nii ga.nii fa.nii nufo.nii afd_* metrics/
#mv tensor* dti_residual* mask* fodf* field.nii acqparams* MultiVarmd* dwi* *txt *.b bv* t1* topup_results_fieldcoef.nii unwarped_images.nii work/
#mv peak* physically_implausible_signals_mask.nii pulsation_and_misalignment_std_dwi.nii rgb_tv.nii bias_field_b0* b0* sigma.nii noise_map* work/
#mv interface.nii wm* map_* work/
#cp work/t1_brain_ants.nii t1_final.nii
#rm -rf mrtrix*
#mv ventricles.nii box* *qry work/

#mv ad_ransac.nii metrics/ad.nii
#mv rd_ransac.nii metrics/rd.nii
#mv md_ransac.nii metrics/md.nii
#mv work/rgb.nii .
#cd ../


	done
done

echo "Pre-processing complete!"
