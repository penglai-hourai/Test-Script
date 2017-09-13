source ../configure.sh

original_old="$HOME/Temp/SuiteSparse-4.5.3/CHOLMOD/Demo/cholmod_l_demo"
modified_old="$HOME/Temp/SuiteSparse_streams/CHOLMOD/Demo/cholmod_l_demo"

export CHOLMOD_NUM_GPUS=1
for matrix in "${matrix_array[@]}"; do
    log_prefix="${matrix}_original"
    log_name="${log_prefix}.log"
    nvvp_name="${log_prefix}.nvvp"
    nvprof_command="nvprof ${nvprof_parameters} --export-profile ${nvvp_name}"
    echo "${srun_hsw_p100} ${nvprof_command} ${original_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
    ${srun_hsw_p100} ${nvprof_command} ${original_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
done

for ngpus in "${ngpu_array[@]}"; do
    export CHOLMOD_NUM_GPUS="${ngpus}"
    for matrix in "${matrix_array[@]}"; do
        for npara in "${npara_array[@]}"; do
            export CHOLMOD_GPU_PARALLEL="${npara}"
            log_prefix="${matrix}_${ngpus}gpu_${npara}parallel"
            log_name="${log_prefix}.log"
            nvvp_name="${log_prefix}.nvvp"
            nvprof_command="nvprof ${nvprof_parameters} --export-profile ${nvvp_name}"
            echo "${srun_hsw_p100} ${nvprof_command} ${modified_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
            ${srun_hsw_p100} ${nvprof_command} ${modified_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
        done
    done
done
