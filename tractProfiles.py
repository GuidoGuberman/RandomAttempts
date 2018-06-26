HC_subs=['TC002']
CC_subs=['TC001']
"""
HC_subs= ['TC002', 'TC003', 'TC004', 'TC005', 'TC006', 'TC008', 'TC009', 'TC010', 'TC011', 'TC013', 'TC014', 'TC015', 'TC016', 'TC017', 'TC018', 'TC019', 'TC020', \
'TC021', 'TC022', 'TC023', 'TC024', 'TC025', 'TC026', 'TC028', 'TC029', 'TC030', 'TC031', 'TC032', 'TC034', 'TC036', 'TC037', 'TC038', 'TC039', 'TC040', 'TC041', \
'TC043', 'TC044', 'TC045', 'TC046', 'TC049', 'TC052', 'TC055', 'TC059', 'TC060', 'TC058', 'TC061']
CC_subs= ['TC001', 'TC007', 'TC033', 'TC042', 'TC054', 'TC056', 'TC057', 'TC071', 'TC073', 'TC074', 'TC076', 'TC077', 'TC078', 'TC079', 'TC050', 'TC069']
"""

runs=[1]


parcs=['AICHA_1mm', 'BN_Atlas_246_1mm']
parcNameOnly=['Aicha', 'BN']
#parcs=(AICHA_1mm)

Aicha_ROIs=[20]
Aicha_20=[4]

"""
Aicha_ROIs=[20, 22, 24, 26, 28, 19, 21, 23, 25, 27]
BN_ROIs=[16 ,20, 22, 15, 19, 21]
#These labels are the ones that are connected to the ROI in every subject. They are taken from the LookingAtConnectomes script.
Aicha_20=[4, 10, 12, 16, 22, 24, 28, 30, 32, 34, 40, 150, 208, 210, 244, 350, 354, 358, 364]
Aicha_22=[4, 10, 12, 16, 20, 24, 28, 32, 150, 210, 354, 358, 364]
Aicha_24=[12, 16, 20, 22, 26, 28, 32, 354]
Aicha_26=[16, 24, 28]
Aicha_28=[4, 12, 16, 20, 22, 24, 26, 31, 32, 58, 354, 360]
Aicha_19=[3, 9, 11, 13, 21, 23, 27, 29, 31, 353, 354, 363]
Aicha_21=[3, 9, 11, 13, 15, 19, 23, 29, 31, 33, 149, 207, 209, 243, 353, 354, 357, 358, 363]
Aicha_23=[11, 19, 21, 27, 31]
Aicha_25=[11, 13, 15, 27, 31, 57, 230, 353, 363]
Aicha_27=[13, 19, 23, 25, 31, 57]
BN_16=[1, 2, 4, 6, 8, 11, 12, 14, 18, 20, 22, 24, 26, 28, 30, 34, 38, 40, 56, 138, 140, 178, 222, 228, 230, 232, 246]
BN_20=[2, 4, 6, 12, 14, 16, 18, 22, 24, 26, 28, 30, 32, 38, 42, 44, 46, 52, 220, 222, 226, 228, 230]
BN_22=[2, 4, 6, 12, 14, 16, 18, 20, 24, 28, 30, 32, 34, 36, 38, 42, 44, 46, 52, 146, 178, 220, 222, 226, 228, 232, 246]
BN_15=[1, 2, 3, 5, 7, 11, 13, 17, 19, 21, 23, 25, 27, 29, 31, 33, 37, 41, 55, 221, 227, 228, 229, 231]
BN_19=[3, 5, 11, 13, 15, 17, 21, 23, 27, 37, 41, 43, 45, 51, 179, 219, 221, 225, 227, 228, 231]
BN_21=[1, 3, 5, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 35, 37, 41, 43, 45, 51, 121, 177, 179, 219, 221, 225, 227, 228, 229]
"""

Group=['CC', 'HC']
Metrics=['ad', 'md', 'rd', 'fa', 'meanAFDalongStrs']

npv=24
seeding_method='int'
######################################################
import numpy
import pandas
import argparse
import csv
import sys
sys.path.append('/Users/Guido/Desktop/ResearchDiffusion/scilpy/scripts')
import scil_tractometry_tractprofiles
from os import getcwd as pwd
from os import chdir as cd
from os import path
from os import remove as rm
import numpy as np
import nibabel as nb
dir_path='/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/'
for k in range (0,len(Metrics)):
    for l in range (0,len(Group)):
        for j in range(0,len(runs)):
            subgroup='%s_subs' % (Group[l])
            subgroup=eval(subgroup)
            print(subgroup)
            for i in range(0,len(subgroup)):
                diff_dir='%s_diff%d/' % (subgroup[i],runs[j])
                sub_roi_dir='%s_%d_ROIs' % (subgroup[i],runs[j])
                conn_proj_dir='%s_%d_ConnectivityProject/' % (subgroup[i],runs[j])
                metrics_dir='%s_run%d_metrics/' % (subgroup[i],runs[j])
                for q in range (0, len(parcs)):
                    parcellation='%s_ROIs' % (parcNameOnly[q])
                    parcellation=eval(parcellation)
                    for n in range (0, len(parcellation)):
                        roi1='%s_%d' % (parcNameOnly[q],parcellation[n])
                        roi1=eval(roi1)
                        for w in range (0,len(roi1)):
                            if Metrics[k] in ['meanAFDalongStrs']:
                                subpath=path.join(dir_path,subgroup[i],'DWI','Preproc1',diff_dir,sub_roi_dir,conn_proj_dir)
                                cd(path.dirname(subpath))
                                metric_filename='%s_run%d_%s_lbl%d_lbl%d_%s.nii' % (subgroup[i],runs[j],parcs[q],parcellation[n],roi1[w],Metrics[k])
                                bundle_filename='%s_run%d_prob_pft_fodf_npv%d_%s_fc02_20-200_noloops_migrated_%s_lbl%d_lbl%d_cut.trk' % (subgroup[i],runs[j],npv,seeding_method,parcs[q],parcellation[n],roi1[w])
                                print(metric_filename)
                                print(bundle_filename)
                                #bundle=nb.load(bundle_filename)
                                # metric=nb.load(metric_filename)
                                # metric_data=metric.get_data()
                                scil_tractometry_tractprofiles.get_metrics_profile_over_streamlines(bundle_filename,metric_filename)
                            else:
                                subpath=path.join(dir_path,subgroup[i],'DWI','Preproc1',diff_dir,metrics_dir)
                                cd(path.dirname(subpath))
                                metric_filename='%s_run%d_%s.nii' % (subgroup[i],runs[j],Metrics[k])
                                print(metric_filename)
                                # metric=nb.load(metric_filename)
                                # metric_data=metric.get_data()
                                subpath=path.join(dir_path,subgroup[i],'DWI','Preproc1',diff_dir,sub_roi_dir,conn_proj_dir)
                                bundle_filename='%s_run%d_prob_pft_fodf_npv%d_%s_fc02_20-200_noloops_migrated_%s_lbl%d_lbl%d_cut.trk' % (subgroup[i],runs[j],npv,seeding_method,parcs[q],parcellation[n],roi1[w])
                                scil_tractometry_tractprofiles.get_metrics_profile_over_streamlines(bundle_filename,metric_filename)
"""



subpath=path.join(dir_path,subgroup[i],'DWI','Preproc1',diff_dir,sub_roi_dir,conn_proj_dir)
cd(path.dirname(subpath))



import os
"""
os.chdir('/Users/Guido/Documents/Analyses/subjects/PedsData/MNI/TC001/DWI/Preproc1/TC001_diff1/TC001_1_ROIs/TC001_1_ConnectivityProject')
'TC001_run1_BN_Atlas_246_1mm_lbl22_lbl246_meanAFD.nii'
filename='%s_run%d_%s_lbl%d_lbl%d_%s.nii' % ('TC001',1,'BN_Atlas_246_1mm',22,246,'meanAFD')
bundle_filename='%s_run%d_prob_pft_fodf_npv%d_%s_fc02_20-200_noloops_migrated_%s_lbl%d_lbl%d_cut.trk' % ('TC001',1,24,'int','BN_Atlas_246_1mm',22,246)
data=nb.load(filename)
metric=data.get_data()
strs=nb.streamlines.load('TC001_run1_prob_pft_fodf_npv24_int_fc02_20-200_noloops_migrated_BN_Atlas_246_1mm_lbl22_lbl246_cut.trk')
strs_data=strs.get_data()
scil_tractometry_tractprofiles.get_metrics_profile_over_streamlines(strs,metric)


TC001_run1_prob_pft_fodf_npv24_int_fc02_20-200_noloops_migrated_BN_Atlas_246_1mm_lbl22_lbl246_cut.trk TC001_run1_BN_Atlas_246_1mm_lbl22_lbl246_meanAFD.nii > testTractProfile.txt


os.system('scil_tractometry_tractprofiles.py "$bundle_filename" "$filename"')

"""
filename='All_%s_run%d_%s_tractVolumes.txt' % (Grp[l],runs[j],parcs[k])
outdir=path.join(dir_path,'ConnectivityProject',parcs[k], Group)

#I could loop through my metrics first

#Loop through your subjects and run scil_tractometry_tractprofiles.py

#Loop through your subjects and through your ROI combinations
cat testTractProfile.txt | jq '."TC001_run1_prob_pft_fodf_npv24_int_fc02_20-200_noloops_migrated_BN_Atlas_246_1mm_lbl22_lbl246_cut"."TC001_run1_BN_Atlas_246_1mm_lbl22_lbl246_meanAFD"."mean"'
"""
