srun_parameters="--unbuffered --time=00:30:00"
srun_k80="srun --partition=hsw_k80 $srun_parameters"
srun_p100="srun --partition=hsw_p100 $srun_parameters"
nvprof_parameters="--force-overwrite --profile-from-start off --system-profiling off --continuous-sampling-interval 1"

original="../cholmod_l_demo_original"
modified="../cholmod_l_demo_modified"
matrix_path="$HOME/Temp/Matrices"
matrix_array=("Emilia_923" "Fault_639" "Flan_1565" "Serena" "inline_1" "ldoor" "nd24k")
ngpu_array=(1 2 4)
npara_array=(2 4)
