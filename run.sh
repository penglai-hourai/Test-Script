#!/bin/bash

cd sparseframelu
CUDA_VISIBLE_DEVICES=4,5,6,7 ./run.sh
cd -

cd umfpack
CUDA_VISIBLE_DEVICES=4,5,6,7 ./run.sh
cd -

cd klu
CUDA_VISIBLE_DEVICES=4,5,6,7 ./run.sh
cd -

cd klu
CUDA_VISIBLE_DEVICES=4,5,6,7 ./run.sh
cd -
