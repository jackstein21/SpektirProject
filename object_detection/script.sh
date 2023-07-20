#!/bin/bash

# Copy /workspace directory to the current directory
# cp -r /workspace .

# Change directory to /tensorflow/models/research
cd /tensorflow/models/research

# Copy setup.py to the current directory
cp object_detection/packages/tf2/setup.py .

# Install the package using pip
python -m pip install .
# Crash prevention
sleep 10

# Change directory to /tensorflow/models/research/object_detection/workspace
cd /tensorflow/models/research/object_detection/workspace

# Generate train.record using generate_tfrecord.py for the training data
python generate_tfrecord.py -x /tensorflow/models/research/object_detection/workspace/images/train -l /tensorflow/models/research/object_detection/workspace/annotations/label_map.pbtxt -o /tensorflow/models/research/object_detection/workspace/annotations/train.record

# Generate test.record using generate_tfrecord.py for the test data
python generate_tfrecord.py -x /tensorflow/models/research/object_detection/workspace/images/test -l /tensorflow/models/research/object_detection/workspace/annotations/label_map.pbtxt -o /tensorflow/models/research/object_detection/workspace/annotations/test.record

# Change directory to /tensorflow/models/research/object_detection
cd /tensorflow/models/research/object_detection

# Fix issue with opencv
pip uninstall opencv-python -y 
apt-get install python3-opencv -y

# Train model
python model_main_tf2.py --model_dir /tensorflow/models/research/object_detection/workspace/models --pipeline_config_path /tensorflow/models/research/object_detection/workspace/models/pipeline.config

# Export the model
python exporter_main_v2.py --input_type image_tensor --pipeline_config_path /tensorflow/models/research/object_detection/workspace/models/pipeline.config --trained_checkpoint_dir /tensorflow/models/research/object_detection/workspace/models/pre-trained-models/ssd_mobilenet_v2_fpnlite_640x640_coco17_tpu-8 --output_directory /tensorflow/models/research/object_detection/workspace/exported_model