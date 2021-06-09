COMMAND=$1

case $COMMAND in
    ekonspacing)
        python train.py \
            task=nlp/ekonspacing \
            dataset=nlp/token_classification/ekonspacing_small \
            trainer=gpus \
            trainer.max_epochs=4 \
            training.batch_size=32 \
            training.num_workers=16 \
            backbone.pretrained_model_name_or_path=entelecheia/ekonbert-base
        ;;
    nsmc)
        python train.py \
            task=nlp/text_classification \
            dataset=nlp/text_classification/default \
            dataset.cfg.dataset_name=nsmc \
            dataset.cfg.train_val_split=0.1 \
            trainer=gpus \
            trainer.max_epochs=4 \
            training.batch_size=32 \
            training.num_workers=16 \
            backbone.pretrained_model_name_or_path=entelecheia/ekonbert-base
        ;;
    *)
        echo "not existing command"
        exit
        ;;
esac
