srun_parameters="--time=00:30:00"
srun_k80="srun --partition=hsw_k80 $srun_parameters"
srun_p100="srun --partition=hsw_p100 $srun_parameters"

original="cholmod_l_demo_original"
modified="cholmod_l_demo_modified"
matrix_path="$HOME/Temp/Matrices"
matrix_array=("Emilia_923" "Fault_639" "Flan_1565" "Serena" "inline_1" "ldoor" "nd24k")
ngpu_array=(1 2 4)
npara_array=(2 4)
memsize_array=(3 6 15)

for matrix in "${matrix_array[@]}"; do
    for memsize in "${memsize_array[@]}"; do
        export CHOLMOD_GPU_MEM_BYTES="${memsize}000000000"
        for ngpus in "${ngpu_array[@]}"; do
            export CHOLMOD_NUM_GPUS="${ngpus}"
            echo "${matrix}_${ngpus}gpus_original_${memsize}gbs.log"
            ${srun_p100} ${original} "${matrix_path}/${matrix}.mtx" > "${matrix}_${ngpus}gpus_original_${memsize}gbs.log"
            for npara in "${npara_array[@]}"; do
                export CHOLMOD_GPU_PARALLEL="${npara}"
                echo "${matrix}_${ngpus}gpus_${npara}parallel_${memsize}gbs.log"
                ${srun_p100} ${modified} "${matrix_path}/${matrix}.mtx" > "${matrix}_${ngpus}gpus_${npara}parallel_${memsize}gbs.log"
            done
        done
    done
done
