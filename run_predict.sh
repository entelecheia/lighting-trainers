COMMAND=$1

case $COMMAND in
    ekonspacing)
        python predict.py \
            task=nlp/ekonspacing \
            dataset=nlp/token_classification/ekonspacing_small \
            trainer=gpus \
            trainer.max_epochs=4 \
            training.batch_size=32 \
            training.num_workers=16 \
            backbone.pretrained_model_name_or_path=entelecheia/ekonbert-base
        ;;
    nsmc)
        python predict.py \
            task=nlp/text_classification \
            +job_name=nsmc-predict \
            +model_name=ekonbert \
            +checkpoint_path=/workspace/projects/lightning-trainers/outputs/nsmc/ekonbert/20210609_071211/checkpoints/epoch1-step527.ckpt \
            "+x='이 영화는 짱이다.'"
        ;;
    *)
        echo "not existing command"
        exit
        ;;
esac
