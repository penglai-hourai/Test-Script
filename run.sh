#!/bin/bash

cd cholmod
./run.sh
cd -

cd cholesky
./run.sh
cd -

cd lu
./run.sh
cd -
