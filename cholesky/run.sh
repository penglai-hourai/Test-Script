#!/bin/bash

source ../configure.sh

demo_dir="$HOME/workspace/libspmtx"
demo="Demo/demo"

for group_matrix in "${matrix_list_cholesky[@]}"; do
    matrix="$(cut -d '/' -f 2 <<< "${group_matrix}")"
    if [ ! -f ${matrix_dir}/${matrix}/${matrix}.mtx ]
    then
        wget ${url_prefix}/MM/${group_matrix}${url_surfix} -O - | tar --directory=${matrix_dir} -zxf -
    fi
    if [ ! -f ${demo_dir}/${demo} ]
    then
        make --directory=${demo_dir}
    fi
    log="${matrix}.log"
    echo "${stdbuf_prefix} ${demo_dir}/${demo} cholesky ${matrix_dir}/${matrix}/${matrix}.mtx 2>&1 | tee ${log}"
    ${stdbuf_prefix} ${demo_dir}/${demo} cholesky ${matrix_dir}/${matrix}/${matrix}.mtx 2>&1 | tee ${log}
done
