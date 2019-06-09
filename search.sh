#!/usr/bin/env bash

N_NODE=2
N_GPU=8

srun \
    --mpi pmi2 -p 16gV100 \
    --ntasks $(($N_NODE * $N_GPU)) \
    --gres gpu:$N_GPU \
    --ntasks-per-node $N_GPU \
    python -u search.py --training --validation 2>&1 | tee log
