#!/bin/bash
# https://webnautes.tistory.com/1186
#based on https://devtalk.nvidia.com/default/topic/1042035/installing-opencv4-on-xavier/ & https://github.com/markste-in/OpenCV4XAVIER/blob/master/buildOpenCV4.sh

# Compute Capabilities can be found here https://developer.nvidia.com/cuda-gpus#compute

apt-get purge -y  libopencv* python-opencv
apt-get autoremove
apt-get install -y build-essential cmake
apt-get install pkg-config


ARCH_BIN=7.2 # AGX Xavier
#ARCH_BIN=6.2 # Tx2
mkdir -p ~/opencv
cd ~/opencv
apt-get install -y build-essential \
    unzip \
    pkg-config \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libgtk-3-dev \
    libatlas-base-dev \
    gfortran \
    python3-dev \
    python3-venv \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libdc1394-22-dev \
    libavresample-dev

git clone https://github.com/opencv/opencv.git 
git clone https://github.com/opencv/opencv_contrib.git 

pip3 install wheel
pip3 install numpy
cd ~/opencv/opencv
mkdir build 

cd ~/opencv/opencv/build

cmake \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_TBB=OFF \
-D WITH_IPP=OFF \
-D WITH_1394=OFF \
-D BUILD_WITH_DEBUG_INFO=OFF \
-D BUILD_DOCS=OFF \
-D INSTALL_C_EXAMPLES=OFF \
-D INSTALL_PYTHON_EXAMPLES=OFF \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
-D WITH_QT=OFF \
-D WITH_GTK=ON \
-D WITH_OPENGL=ON \
-D OPENCV_EXTRA_MODULES_PATH=~/opencv/opencv_contrib/modules \
-D WITH_V4L=ON \
-D WITH_FFMPEG=ON \
-D BUILD_NEW_PYTHON_SUPPORT=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
../





make -j12
make install
ldconfig

#cd ~/Downloads/lib/python3.7/site-packages
#ln -s /usr/local/lib/python3.7/site-packages/cv2.cpython-36m-aarch64-linux-gnu.so cv2.so
pkg-config --modversion opencv
Scanning dependencies of target opencv_python3
[100%] Building CXX object modules/python3/CMakeFiles/opencv_python3.dir/__/src2/cv2.cpp.o
[100%] Linking CXX shared module ../../lib/python3/cv2.cpython-38-x86_64-linux-gnu.so
