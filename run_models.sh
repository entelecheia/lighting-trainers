python train.py \
    task=nlp/ekonspacing \
    dataset=nlp/token_classification/ekonspacing_small \
    trainer=gpus \
    training.batch_size=32 \
    training.num_workers=32 \
    backbone.pretrained_model_name_or_path=entelecheia/ekonbert-base