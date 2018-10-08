#!/bin/bash

source ../configure.sh

for ngpus in "${ngpu_array[@]}"; do
    export SPQR_NUM_GPUS="${ngpus}"
    for matrix in "${matrix_array[@]}"; do
        log_prefix="${matrix}_${ngpus}gpu_old"
        log_name="${log_prefix}.log"
        nvvp_name="${log_prefix}.nvvp"
        echo "stdbuf -oL ${nvprof_command} --export-profile ${nvvp_name} ${demo_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
        stdbuf -oL ${nvprof_command} --export-profile ${nvvp_name} ${demo_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
        log_prefix="${matrix}_${ngpus}gpu_new"
        log_name="${log_prefix}.log"
        nvvp_name="${log_prefix}.nvvp"
        echo "stdbuf -oL ${nvprof_command} --export-profile ${nvvp_name} ${demo_new} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
        stdbuf -oL ${nvprof_command} --export-profile ${nvvp_name} ${demo_new} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
    done
done
