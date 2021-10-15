#!/bin/bash
set -x
# run this script at the folder [~/workspace] of the host
COMMAND=$1

if [ "$COMMAND" == "" ]; then
    docker run -it --rm -v \
        --shm-size=8g \
        --gpus '"device=4,5,6,7"' \
        -v $PWD:/workspace \
        -v /home/yjlee/workspace/projects/pathML:/workspace/projects/pathML \
        -v /home/yjlee/workspace/data/projects/pathML/data:/workspace/projects/pathML/data \
        -v /home/yjlee/workspace/data/projects/pathML/models:/workspace/projects/pathML/models \
        -v /home/yjlee/workspace/data/projects/pathML/results:/workspace/projects/pathML/results \
        -p 18088:8888 -p 16066:6006 \
        --ulimit memlock=-1 --ulimit stack=67108864 \
        --device=/dev/snd \
        nvcr.io/nvidia/nemo:1.4.0
else
    docker run --gpus all -it --rm \
        --name "lightning-trainer" \
        --ipc=host \
        -v $PWD/projects:/workspace/projects \
        -v $PWD/data:/workspace/data \
        nvcr.io/nvidia/nemo:1.4.0 \
        /bin/bash \
        -c "cd /workspace/projects/lightning-trainers;sh .pip_req.sh;sh run_models.sh $COMMAND"
fi
