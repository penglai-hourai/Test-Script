source ../configure.sh

export CHOLMOD_NUM_GPUS=1
for matrix in "${matrix_array[@]}"; do
    log_prefix="${matrix}_original"
    log_name="${log_prefix}.log"
    nvvp_name="${log_prefix}.nvvp"
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
            echo "${srun_hsw_p100} ${nvprof_command} ${modified_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
            ${srun_hsw_p100} ${nvprof_command} ${modified_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
        done
    done
done
