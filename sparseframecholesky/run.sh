#!/bin/bash

source ../configure.sh

demo_dir="$HOME/workspace/SparseFrame/Cholesky"
demo="Demo/demo"

for group_matrix in "${matrix_list_cholesky[@]}"; do
    matrix="$(cut -d '/' -f 2 <<< "${group_matrix}")"
    if [ ! -f ${matrix_dir}/${matrix}/${matrix}.mtx ]
    then
        echo "wget"
        wget ${url_prefix}/MM/${group_matrix}${url_surfix} -O - | tar --directory=${matrix_dir} -zxf -
    fi
    if [ ! -f ${demo_dir}/${demo} ]
    then
        echo "make"
        make --directory=${demo_dir}
    fi
    log="${matrix//\//$'_'}.log"
    echo "${stdbuf_prefix} ${demo_dir}/${demo} ${matrix_dir}/${matrix}/${matrix}.mtx 2>&1 | tee ${log}"
    ${stdbuf_prefix} ${demo_dir}/${demo} ${matrix_dir}/${matrix}/${matrix}.mtx 2>&1 | tee ${log}
done
