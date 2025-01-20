#!/bin/bash

export HIP_FORCE_DEV_KERNARG=1

mllm_name=llava-llama-3-8b-v1_1-transformers
pushd HunyuanVideo
python hyvideo/utils/preprocess_text_encoder_tokenizer_utils.py --input_dir ckpts/$mllm_name --output_dir ckpts/text_encoder
popd
