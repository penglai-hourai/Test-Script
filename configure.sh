#!/bin/bash

url_prefix="https://sparse.tamu.edu"
url_surfix=".tar.gz"

matrix_dir="$HOME/workspace/Matrices"
if [ ! -d ${matrix_dir} ]
then
    mkdir -p ${matrix_dir}
fi

matrix_list_cholesky=("Janna/Emilia_923" "Janna/Fault_639" "Janna/Flan_1565" "Janna/Geo_1438" "Janna/Hook_1498" "Janna/Serena" "Janna/StocF-1465" "GHS_psdef/audikw_1" "Oberwolfach/bone010" "ND/nd24k")
matrix_list_lu=("Sandia/ASIC_680k" "Freescale/Freescale1" "Janna/ML_Geer" "Janna/ML_Laplace" "Janna/Transport" "Grund/bayer01" "VLSI/dgreen" "Averous/epb1" "Li/li" "Martin/marine1" "Schenk_IBMSDS/matrix_9" "VLSI/nv2" "ATandT/onetone1" "Grund/poli_large" "ATandT/pre2" "Goodwin/rim" "Bova/rma10" "VLSI/ss" "VLSI/stokes" "Ronis/xenon1")

stdbuf_prefix="stdbuf -oL"

nvprof_prefix="nvprof --normalized-time-unit s --profile-from-start off --system-profiling off --continuous-sampling-interval 50 --force-overwrite"
