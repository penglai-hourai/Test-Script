#!/bin/bash

source ../configure.sh

demo_dir="$HOME/workspace/SuperLU_DIST_6.2.0"
demo="build/EXAMPLE/pddrive"

for group_matrix in "${matrix_list_lu[@]}"; do
    matrix="$(cut -d '/' -f 2 <<< "${group_matrix}")"
    if [ ! -f ${matrix_dir}/${matrix}/${matrix}.rb ]
    then
        wget ${url_prefix}/RB/${group_matrix}${url_surfix} -O - | tar --directory=${matrix_dir} -zxf -
    fi
    if [ ! -f ${demo_dir}/${demo} ]
    then
        make --directory=${demo_dir}/build
    fi
    log="${matrix}.log"
    echo "${stdbuf_prefix} mpiexec -n 4 ${demo_dir}/${demo} -r 2 -c 2 ${matrix_dir}/${matrix}/${matrix}.rb 2>&1 | tee ${log}"
    ${stdbuf_prefix} mpiexec -n 4 ${demo_dir}/${demo} -r 2 -c 2 ${matrix_dir}/${matrix}/${matrix}.rb 2>&1 | tee ${log}
done
