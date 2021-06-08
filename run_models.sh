python train.py \
    task=nlp/ekonspacing \
    dataset=nlp/token_classification/ekonspacing_small \
    trainer=gpus \
    trainer.max_epochs=4 \
    training.batch_size=32 \
    training.num_workers=16 \
    backbone.pretrained_model_name_or_path=entelecheia/ekonbert-base
