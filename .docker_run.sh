#!/bin/bash
set -x
# run this script at the folder [~/workspace] of the host
COMMAND=$1

if [ "$COMMAND" == "" ]; then
    docker run -it --rm -v \
        --shm-size=8g \
        --gpus '"device=4,5,6,7"' \
        -v $PWD:/workspace \
        -v /home/yjlee/workspace/projects:/workspace/projects \
        -v /home/yjlee/workspace/data:/workspace/data \
        -p 18088:8888 -p 16066:6006 \
        --ulimit memlock=-1 --ulimit stack=67108864 \
        --device=/dev/snd \
        nvcr.io/nvidia/nemo:1.4.0
else
    docker run --gpus all -it --rm \
        --name "lightning-trainer" \
        --ipc=host \
        -v /home/yjlee/workspace/projects:/workspace/projects \
        -v /home/yjlee/workspace/data:/workspace/data \
        nvcr.io/nvidia/nemo:1.4.0 \
        /bin/bash \
        -c "cd /workspace/projects/lightning-trainers;sh .pip_req.sh;sh run_models.sh $COMMAND"
fi
