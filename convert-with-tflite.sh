#!/bin/bash

tflite_convert \
--output_file=./faster_rcnn_inception_v2_coco_2018_01_28.tflite \
--saved_model_dir=faster_rcnn_inception_v2_coco_2018_01_28/saved_model \
--inference_type=QUANTIZED_UINT8 \
--input_shapes=1,320,320,3 \
--input_arrays normalized_input_image_tensor \
--output_arrays "TFLite_Detection_PostProcess,TFLite_Detection_PostProcess:1,TFLite_Detection_PostProcess:2,TFLite_Detection_PostProcess:3" \
--mean_values 128 \
--std_dev_values 128 \
--allow_custom_ops \
--change_concat_input_ranges=false \
--allow_nudging_weights_to_use_fast_gemm_kernel=true