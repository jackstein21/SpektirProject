FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

ENV BLENDER_MAJOR 3.2
ENV BLENDER_VERSION 3.2.2
ENV BLENDER_TAR_URL https://download.blender.org/release/Blender${BLENDER_MAJOR}/blender-${BLENDER_VERSION}-linux-x64.tar.xz


RUN apt-get update && \
	apt-get install -y \
		curl wget nano \
		bzip2 libfreetype6 libgl1-mesa-dev \
		libglu1-mesa \
		libxi6 libxrender1 && \
	apt-get -y autoremove

# Install blender

RUN mkdir -p /usr/local/blender/myblender/blender && \
    cd /tmp && \
    wget --quiet ${BLENDER_TAR_URL} -O blender.tar.xz && \
    tar -xvf blender.tar.xz -C /usr/local/blender/myblender/blender --strip-components=1 && \
    rm blender.tar.xz

# Install python 
RUN apt-get install -y python3

WORKDIR /workspace

# ENTRYPOINT ["/usr/local/blender/myblender/blender", "-b"]