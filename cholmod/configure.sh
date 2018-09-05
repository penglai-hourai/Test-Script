#!/bin/bash

nvprof_parameters="--normalized-time-unit s --profile-from-start off --system-profiling off --continuous-sampling-interval 50 --force-overwrite"
nvprof_command="nvprof ${nvprof_parameters}"

demo_old="$HOME/Temp/SuiteSparse/CHOLMOD/Demo/cholmod_l_demo"
demo_new="$HOME/workspace/SuiteSparse/CHOLMOD/Demo/cholmod_l_demo"
matrix_path="$HOME/workspace/Matrices"

matrix_array=("Emilia_923" "Fault_639" "Flan_1565" "Geo_1438" "Hook_1498" "Serena" "StocF-1465" "audikw_1" "bone010" "nd24k")
ngpu_array=(1 2 4)
