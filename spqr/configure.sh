#!/bin/bash

nvprof_parameters="--normalized-time-unit s --profile-from-start off --system-profiling off --continuous-sampling-interval 50 --force-overwrite"
nvprof_command="nvprof ${nvprof_parameters}"

demo_old="$HOME/Temp/SuiteSparse/SPQR/Demo/qrdemo_gpu"
demo_new="$HOME/workspace/SuiteSparse/SPQR/Demo/qrdemo_gpu"
matrix_path="$HOME/workspace/Matrices"

matrix_array=("Flan_1565" "Freescale1" "H2O" "bundle_adj" "circuit5M_dc" "hood" "nd24k")
ngpu_array=(1)
