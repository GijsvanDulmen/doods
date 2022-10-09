# Load TensorFlow
import tensorflow as tf
import pathlib

# Set up the converter
converter = tf.lite.TFLiteConverter.from_saved_model("./faster_rcnn_inception_v2_coco_2018_01_28/saved_model")
# converter.target_ops = [tf.lite.OpsSet.TFLITE_BUILTINS, tf.lite.OpsSet.SELECT_TF_OPS]
converter.allow_custom_ops=True
converter.experimental_new_converter = True

def representative_dataset():
    for _ in range(100):
      data = np.random.rand(1, 244, 244, 3)
      yield [data.astype(np.float32)]

# quanitized
# converter.optimizations = [tf.lite.Optimize.DEFAULT]
converter.representative_dataset = representative_dataset
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
converter.inference_input_type = tf.uint8
converter.inference_output_type = tf.uint8

# Perform conversion and output file
tflite_quant_model = converter.convert()

tflite_models_dir = pathlib.Path("./lite_faster_rcnn_inception_v2_coco_2018_01_28/")
tflite_models_dir.mkdir(exist_ok=True, parents=True)

tflite_model_file = tflite_models_dir/"faster_rcnn_inception_v2_coco_2018_01_28.tflite"
tflite_model_file.write_bytes(tflite_quant_model)
