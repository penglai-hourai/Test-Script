#!/bin/bash

srun_parameters="--unbuffered --time=00:30:00"
srun_hsw_k80=""
srun_hsw_p100=""
#srun_hsw_k80="srun --partition=hsw_k80 $srun_parameters"
#srun_hsw_p100="srun --partition=hsw_p100 $srun_parameters"
nvprof_parameters="--normalized-time-unit s --profile-from-start off --system-profiling on --continuous-sampling-interval 50 --force-overwrite"
nvprof_command="nvprof ${nvprof_parameters}"

root="$HOME/workspace/SuiteSparse_root/CHOLMOD/Demo/cholmod_l_demo"
root_batched="$HOME/workspace/SuiteSparse_root/CHOLMOD/Demo/cholmod_l_batched_demo"
subtree_root="$HOME/workspace/SuiteSparse_subtree_root/CHOLMOD/Demo/cholmod_l_demo"
subtree_root_batched="$HOME/workspace/SuiteSparse_subtree_root/CHOLMOD/Demo/cholmod_l_batched_demo"
subtree="$HOME/workspace/SuiteSparse/CHOLMOD/Demo/cholmod_l_demo"
subtree_batched="$HOME/workspace/SuiteSparse/CHOLMOD/Demo/cholmod_l_batched_demo"
matrix_path="$HOME/Temp/Matrices"

matrix_array=("Emilia_923" "Fault_639" "Flan_1565" "Geo_1438" "Hook_1498" "Serena" "StocF-1465" "audikw_1" "bone010" "nd24k")
ngpu_array=(1 2 4)
npara_array=(1)
