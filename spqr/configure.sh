#!/bin/bash

nvprof_parameters="--normalized-time-unit s --profile-from-start off --system-profiling off --continuous-sampling-interval 50 --force-overwrite"
nvprof_command="nvprof ${nvprof_parameters}"

demo_old="$HOME/Temp/SuiteSparse/SPQR/Demo/qrdemo_gpu"
demo_new="$HOME/workspace/SuiteSparse/SPQR/Demo/qrdemo_gpu"
matrix_path="$HOME/workspace/Matrices"

matrix_array=("Flan_1565" "H2O" "circuit_2" "landmark" "lhr71" "lhr71c" "nd24k" "olesnik0" "west0067")
ngpu_array=(1)
