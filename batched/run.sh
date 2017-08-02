source ../configure.sh

for ngpus in "${ngpu_array[@]}"; do
    export CHOLMOD_NUM_GPUS="${ngpus}"
    for matrix in "${matrix_array[@]}"; do
        for npara in "${npara_array[@]}"; do
            export CHOLMOD_GPU_PARALLEL="${npara}"
            log_prefix="${matrix}_x4_${ngpus}gpu_${npara}parallel"
            log_name="${log_prefix}.log"
            echo "${srun_p100} ${modified_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
            ${srun_p100} ${modified_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
        done
    done
done
