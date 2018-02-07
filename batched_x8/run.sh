#!/bin/bash

source ../configure.sh

for ngpus in "${ngpu_array[@]}"; do
    export CHOLMOD_NUM_GPUS="${ngpus}"
    for matrix in "${matrix_array[@]}"; do
        for npara in "${npara_array[@]}"; do
            export CHOLMOD_GPU_PARALLEL="${npara}"
            log_prefix="${matrix}_x8_subtree_root_${ngpus}gpu_${npara}parallel"
            log_name="${log_prefix}.log"
            echo "${srun_hsw_p100} ${subtree_root_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx > ${log_name}"
            pkill cholmod_l_batched_demo
            ${srun_hsw_p100} ${subtree_root_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx > ${log_name}
            log_prefix="${matrix}_x8_subtree_${ngpus}gpu_${npara}parallel"
            log_name="${log_prefix}.log"
            echo "${srun_hsw_p100} ${subtree_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx > ${log_name}"
            pkill cholmod_l_batched_demo
            ${srun_hsw_p100} ${subtree_batched} ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx ${matrix_path}/${matrix}.mtx > ${log_name}
        done
    done
done
