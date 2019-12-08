#!/bin/bash

source ../configure.sh

demo_dir="$HOME/workspace/SuiteSparse/UMFPACK"
readhb_nozeros="Demo/readhb_nozeros"
readhb_size="Demo/readhb_size"
demo="Demo/umf4"

if [ ! -d tmp ]
then
    mkdir tmp
fi

for group_matrix in "${matrix_list_lu[@]}"; do
    matrix="$(cut -d '/' -f 2 <<< "${group_matrix}")"
    if [ ! -f ${matrix_dir}/${matrix}/${matrix}.rb ]
    then
        wget ${url_prefix}/RB/${group_matrix}${url_surfix} -O - | tar --directory=${matrix_dir} -zxf -
    fi
    if [ ! -f ${demo_dir}/${readhb_nozeros} ] || [ ! -f ${demo_dir}/${readhb_size} ] || [ ! -f ${demo_dir}/${demo} ]
    then
        make --directory=${demo_dir} hb
    fi
    log="${matrix}.log"
    ${stdbuf_prefix} ${demo_dir}/${readhb_nozeros} < ${matrix_dir}/${matrix}/${matrix}.rb  > tmp/A
    ${stdbuf_prefix} ${demo_dir}/${readhb_size} < ${matrix_dir}/${matrix}/${matrix}.rb  > tmp/Asize
    echo "${stdbuf_prefix} ${demo_dir}/${demo} 2>&1 | tee ${log}"
    ${stdbuf_prefix} ${demo_dir}/${demo} 2>&1 | tee ${log}
done

if [ ! -e tmp ]
then
    rm -fr tmp
fi
