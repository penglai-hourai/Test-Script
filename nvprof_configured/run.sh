source ../configure.sh

for ngpus in "${ngpu_array[@]}"; do
    export CHOLMOD_NUM_GPUS="${ngpus}"
    for memsize in "${memsize_array[@]}"; do
        export CHOLMOD_GPU_MEM_BYTES="${memsize}000000000"
        for matrix in "${matrix_array[@]}"; do
            log_prefix="${matrix}_${ngpus}gpu_original_${memsize}gbs"
            log_name="${log_prefix}.log"
            nvvp_name="${log_prefix}.nvvp"
            nvprof_command="nvprof ${nvprof_parameters} --export-profile ${nvvp_name}"
            echo "${srun_p100} ${nvprof_command} ${original} \"${matrix_path}/${matrix}.mtx\" 2>&1 | tee \"${log_name}\""
            ${srun_p100} ${nvprof_command} ${original} "${matrix_path}/${matrix}.mtx" 2>&1 | tee "${log_name}"
            for npara in "${npara_array[@]}"; do
                export CHOLMOD_GPU_PARALLEL="${npara}"
                log_prefix="${matrix}_${ngpus}gpu_${npara}parallel_${memsize}gbs"
                log_name="${log_prefix}.log"
                nvvp_name="${log_prefix}.nvvp"
                nvprof_command="nvprof ${nvprof_parameters} --export-profile ${nvvp_name}"
                echo "${srun_p100} ${nvprof_command} ${modified} \"${matrix_path}/${matrix}.mtx\" 2>&1 | tee \"${log_name}\""
                ${srun_p100} ${nvprof_command} ${modified} "${matrix_path}/${matrix}.mtx" 2>&1 | tee "${log_name}"
            done
        done
    done
done
