srun_parameters="--unbuffered --time=00:30:00"
srun_hsw_k80="srun --partition=hsw_k80 $srun_parameters"
srun_hsw_p100="srun --partition=hsw_p100 $srun_parameters"
nvprof_parameters="--force-overwrite --profile-from-start off --system-profiling on"

original="../cholmod_l_demo_original"
modified="../cholmod_l_demo_modified"
modified_batched="../cholmod_l_batched_demo_modified"
matrix_path="$HOME/Temp/Matrices"
matrix_array=("Emilia_923" "Fault_639" "Flan_1565" "Serena" "audikw_1" "inline_1" "ldoor" "nd24k")
ngpu_array=(1 2 4)
npara_array=(1 2 4 8 16)

memsize_array=(3 6 15)
