source ../configure.sh

for ngpus in "${ngpu_array[@]}"; do
    export CHOLMOD_NUM_GPUS="${ngpus}"
    for matrix in "${matrix_array[@]}"; do
        for npara in "${npara_array[@]}"; do
            export CHOLMOD_GPU_PARALLEL="${npara}"
            log_prefix="${matrix}_x16_subtreeRoot_${ngpus}gpu_${npara}parallel"
            log_name="${log_prefix}.log"
            echo "${srun_hsw_p100} ${subtreeRoot_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
            ${srun_hsw_p100} ${subtreeRoot_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
            log_prefix="${matrix}_x16_subtree_${ngpus}gpu_${npara}parallel"
            log_name="${log_prefix}.log"
            echo "${srun_hsw_p100} ${subtree_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
            ${srun_hsw_p100} ${subtree_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
        done
    done
done
