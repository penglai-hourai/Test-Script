#!/bin/bash

source ../configure.sh

for ngpus in "${ngpu_array[@]}"; do
    export SPQR_NUM_GPUS="${ngpus}"
    for matrix in "${matrix_array[@]}"; do
        log_prefix="${matrix}_${ngpus}gpu_old"
        log_name="${log_prefix}.log"
        echo "stdbuf -oL ${demo_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
        stdbuf -oL ${demo_old} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
        log_prefix="${matrix}_${ngpus}gpu_new"
        log_name="${log_prefix}.log"
        echo "stdbuf -oL ${demo_new} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}"
        stdbuf -oL ${demo_new} ${matrix_path}/${matrix}.mtx 2>&1 | tee ${log_name}
    done
done
