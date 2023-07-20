FROM tensorflow/tensorflow:2.9.3-gpu
WORKDIR /workspace
RUN apt update && apt install git \
    protobuf-compiler python-pil python-lxml python-tk -y 

# Install python 
RUN apt-get install -y python3

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN python -m pip install --upgrade pip


RUN mkdir -p /tensorflow/models 
RUN git clone https://github.com/tensorflow/models.git /tensorflow/models

RUN cd /tensorflow/models/research && protoc object_detection/protos/*.proto --python_out=.

WORKDIR /tensorflow/models/research/object_detection
RUN mkdir workspace
WORKDIR /tensorflow/models/research/object_detection/workspace






