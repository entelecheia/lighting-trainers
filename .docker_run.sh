#!/bin/bash
# run this script at the folder [~/workspace] of the host
docker run --gpus all -it --rm \
    --name "lightning-trainer" \
    --ipc=host \
    -v $PWD/projects:/workspace/projects \
    -v $PWD/data:/workspace/data \
    nvcr.io/nvidia/pytorch:21.05-py3
