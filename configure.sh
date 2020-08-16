#!/bin/bash

url_prefix="https://sparse.tamu.edu"
url_surfix=".tar.gz"

matrix_dir="$HOME/workspace/Matrix"
if [ ! -d ${matrix_dir} ]
then
    mkdir -p ${matrix_dir}
fi

matrix_list_cholesky=("Janna/Emilia_923" "Janna/Fault_639" "Janna/Flan_1565" "Janna/Geo_1438" "Janna/Hook_1498" "Janna/Serena" "Janna/StocF-1465" "GHS_psdef/audikw_1" "Oberwolfach/bone010" "ND/nd24k")
matrix_list_lu=("Sandia/ASIC_680k" "Freescale/Freescale1" "Janna/ML_Geer" "Janna/ML_Laplace" "Janna/Transport" "VLSI/dgreen" "Martin/marine1" "ATandT/pre2" "VLSI/ss" "VLSI/stokes")
matrix_list_qr=("Freescale/Freescale1" "Freescale/circuit5M_dc" "GHS_psdef/hood" "Janna/Flan_1565" "Mazaheri/bundle_adj" "ND/nd24k" "PARSEC/H2O")

stdbuf_prefix="timeout 1h stdbuf -oL"

nvprof_prefix="nvprof --normalized-time-unit s --profile-from-start off --system-profiling off --continuous-sampling-interval 50 --force-overwrite"
