FROM nvidia/cuda:10.0-cudnn7-devel
LABEL maintainer "Dennis Tan <dennis@formatech.com>"


######## DEPENDENCIES ########
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        g++ \
        make \
        cmake \
        wget \
        curl \
        git \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        libsuitesparse-dev \
        protobuf-compiler \
        python3-dev \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install setuptools
RUN pip3 install numpy scipy opencv-python opencv-contrib-python tensorflow-gpu==1.15
RUN pip3 install matplotlib scikit-image


####### APP ########
COPY . /app

WORKDIR /app
ENTRYPOINT [ "python3" ]
CMD [ "demo.py" ]
