
https://github.com/AlexeyAB/darknet.git
https://github.com/hunglc007/tensorflow-yolov4-tflite.git
https://github.com/AlexeyAB/Yolo_mark.git
https://github.com/tzutalin/labelImg.git
====
opncv install
scripts/install_opnecv4.sh

=================
라벨링
https://github.com/AlexeyAB/darknet#datasets
OpenImages : python ./scripts/get_openimages_dataset.py기차 감지 데이터 세트에 레이블 지정에 사용
Pascal VOC : python ./scripts/voc_label.pyTrain / Test / Val 감지 데이터 세트에 레이블을 지정 하는 데 사용

====================
build 
docker build -t gb-yolo:latest .  

docker run  --name gb-yolo -d -it -v ~/workspace/gb-yolo:/workspace/gb-yolo -p 8888:8888  gb-yolo:latest
scripts/install_OpenCV4.sh
~/workspace/darknet/build.sh
docker cp gb-yolo:/workspace/darknet/darknet ./darknet

==========
make weights 
Start training: 
./darknet detector train ds/baram/obj.data cfg/yolov4-tiny-baram.cfg yolov4-tiny.conv.29  -map 

test
./darknet detector test ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup2/yolov4-tiny-baram_last.weights -thresh 0.25
./darknet detector test ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup2/yolov4-tiny-baram_last.weights -thresh 0.15
ds/baram/img/baram_test1_class_2_4.jpg
ds/baram/img/baram_test1_class_1_10.jpg
ds/baram/img/baram_test1_class_5_10.jpg
ds/baram/img/baram_test1_class_5_1.jpg
ds/baram/img/baram_test1_class_6_1.jpg
./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup2/yolov4-tiny-baram_last.weights -ext_output test3.mp4

==================
weights to tensorflow 
weights_tf to tflite

## yolov4-tiny
python save_model.py --weights ./data/yolov4-tiny-baram_last.weights --output ./checkpoints/yolov4-tiny-baram_last --input_size 416 --model yolov4 --framework tflite --tiny
# Run demo tensorflow
python detect.py --weights ./checkpoints/yolov4-tiny-baram_last --size 416 --model yolov4 --image ./data/baram_test1_class_7_7.jpg --tiny  --output ./result3.png
# yolov4
python convert_tflite.py --weights ./checkpoints/yolov4-tiny-baram_last --output ./checkpoints/yolov4-tiny-baram_last.tflite
=========================
