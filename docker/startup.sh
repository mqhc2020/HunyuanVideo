#!/bin/bash

# Detect whether ROCm or CUDA is installed
if command -v rocm-smi &>/dev/null; then
        PLATFORM="ROCM"
        export HIP_FORCE_DEV_KERNARG=1
elif command -v nvidia-smi &>/dev/null; then
        PLATFORM="CUDA"
else
    echo "Neither ROCm nor CUDA could be detected. Exiting."
    exit 1
fi

mllm_name=llava-llama-3-8b-v1_1-transformers
pushd HunyuanVideo
python hyvideo/utils/preprocess_text_encoder_tokenizer_utils.py --input_dir ckpts/$mllm_name --output_dir ckpts/text_encoder
popd
