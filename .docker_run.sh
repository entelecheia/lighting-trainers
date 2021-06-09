#!/bin/bash
# run this script at the folder [~/workspace] of the host
COMMAND=$1

if [ "$COMMAND" == "" ]; then
    docker run --gpus all -it --rm \
        --name "lightning-trainer" \
        --ipc=host \
        -v $PWD/projects:/workspace/projects \
        -v $PWD/data:/workspace/data \
        nvcr.io/nvidia/pytorch:21.05-py3
else
    docker run --gpus all -it --rm \
        --name "lightning-trainer" \
        --ipc=host \
        -v $PWD/projects:/workspace/projects \
        -v $PWD/data:/workspace/data \
        nvcr.io/nvidia/pytorch:21.05-py3 \
        /bin/bash \
        -c "cd /workspace/projects/lightning-trainers;sh .pip_req.sh;sh run_models.sh $COMMAND"
fi
