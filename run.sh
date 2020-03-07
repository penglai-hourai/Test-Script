#!/bin/bash

cd sparseframelu
./run.sh
cd -

cd glu
./run.sh
cd -

cd umfpack
./run.sh
cd -

cd klu
./run.sh
cd -
