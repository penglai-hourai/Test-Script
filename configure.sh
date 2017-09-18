srun_parameters="--unbuffered --time=00:30:00"
srun_hsw_k80="srun --partition=hsw_k80 $srun_parameters"
srun_hsw_p100="srun --partition=hsw_p100 $srun_parameters"
nvprof_parameters="--normalized-time-unit s --profile-from-start off --system-profiling on --continuous-sampling-interval 50 --force-overwrite"
nvprof_command="nvprof ${nvprof_parameters}"

original_old="$HOME/Temp/SuiteSparse-4.5.3/CHOLMOD/Demo/cholmod_l_demo"
modified_old="$HOME/Temp/SuiteSparse_streams/CHOLMOD/Demo/cholmod_l_demo"

original="$HOME/Temp/SuiteSparse-4.6.0-beta/CHOLMOD/Demo/cholmod_l_demo"
modified="$HOME/workspace/SuiteSparse/CHOLMOD/Demo/cholmod_l_demo"
modified_batched="$HOME/workspace/SuiteSparse/CHOLMOD/Demo/cholmod_l_batched_demo"
matrix_path="$HOME/Temp/Matrices"

matrix_array=("Emilia_923" "Fault_639" "Flan_1565" "G3_circuit" "Geo_1438" "Hook_1498" "Serena" "StocF-1465" "apache2" "audikw_1" "bone010" "boneS10" "inline_1" "ldoor" "nd24k")
ngpu_array=(1 2 4)
npara_array=(1 2 4)
