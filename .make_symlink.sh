#!/bin/bash

LINK_NAME=""

function make_synmlink () {
    TARGET_DIR="../../data/projects/esgML/$LINK_NAME"

    if [ ! -d $TARGET_DIR ]; then
        echo "Creating an $LINK_NAME directory."
        mkdir -p $TARGET_DIR
    else
        echo "Target directory [$TARGET_DIR] already exists."
    fi

    if [ -d $LINK_NAME ]; then
        echo "Directory [$LINK_NAME] exists. Move or delete the directory."
    elif [ -L $LINK_NAME ]; then
        echo "Symbolic link [$LINK_NAME] exists already."
    else
        echo "Making symbolic link [$LINK_NAME] to [$TARGET_DIR]."
        ln -s $TARGET_DIR $LINK_NAME
    fi
}

function usage()
{
    echo "usage: sh [[--option value ] | [-h]] link_name"
    echo "example:"
    echo "       sh .make_synmlink.sh --all"
}

while [ "$1" != "" ]; do
    case $1 in
        -d | --data )           shift
                                LINK_NAME="data"
                                ;;
        -m | --models )         shift
                                LINK_NAME="models"
                                ;;
        -o | --outputs )        shift
                                LINK_NAME="outputs"
                                ;;
        -a | --all )            shift
                                LINK_NAME="all"
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     LINK_NAME=$1
    esac
    shift
done

# echo "command: $COMMAND"
# echo "limit: $LIMIT"

case $LINK_NAME in
    data)
        make_synmlink
        ;;
    models)
        make_synmlink
        ;;
    outputs)
        make_synmlink
        ;;
    all)
        LINK_NAME="data"
        make_synmlink
        LINK_NAME="models"
        make_synmlink
        LINK_NAME="outputs"
        make_synmlink
        ;;
    *)
        echo "not existing command\n"
        usage
        exit
        ;;
esac
