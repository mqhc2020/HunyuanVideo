#!/bin/bash
# Description: This script demonstrates how to inference a video based on HunyuanVideo model

if [[ "$PROFILE_DIFFUSION" == "1" ]]; then
    infer_steps=3
    profiling_option="--profiling diffusion"
elif [[ "$PROFILE_VAE" == "1" ]]; then
    infer_steps=0
    profiling_option="--profiling vae"
else
    infer_steps=50
    profiling_option=""
fi

python3 sample_video.py \
    --video-size 720 1280 \
    --video-length 129 \
	--infer-steps $infer_steps \
    --prompt "A cat walks on the grass, realistic style." \
    --seed 42 \
	--embedded-cfg-scale 6.0 \
    --flow-shift 7.0 \
    --flow-reverse \
    --use-cpu-offload \
    $profiling_option \
    --save-path ./results
