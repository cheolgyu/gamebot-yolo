FROM ubuntu:20.04
RUN apt-get update && apt-get -y update

RUN  apt install -y software-properties-common && add-apt-repository -y ppa:deadsnakes/ppa
RUN  apt-get update
RUN  apt-get install -y python3.7 python3-pip git 

RUN pip3 install jupyter

WORKDIR /workspace
RUN git clone  https://github.com/AlexeyAB/darknet.git --branch master --single-branch --depth 1
RUN git clone  https://github.com/hunglc007/tensorflow-yolov4-tflite.git --branch master --single-branch --depth 1
RUN git clone  https://github.com/AlexeyAB/Yolo_mark.git --branch master --single-branch --depth 1
RUN git clone  https://github.com/tzutalin/labelImg.git --branch master --single-branch --depth 1


WORKDIR /workspace/tensorflow-yolov4-tflite 
# RUN pip3 install --no-cache-dir -r requirements.txt
# WORKDIR /workspace/Yolo_mark
# RUN apt-get install -y cmake make gcc
# RUN cmake .
# RUN make
WORKDIR /workspace/darknet
#RUN apt-get install -y cmake make gcc
#RUN ./build.sh

WORKDIR /workspace/gb-yolo

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]





