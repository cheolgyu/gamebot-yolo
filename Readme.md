
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
./yolo_mark ds/baram/img/new ds/baram/train.txt ds/baram/obj.names
./yolo_mark ds/baram/img/new cap_video t4.mp4 10
./yolo_mark ds/baram/img/new cap_video t2.mp4 10
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
baram_test4
./darknet detector train ds/baram_test4/obj.data cfg/yolov4-tiny-baram.cfg yolov4-tiny.conv.29  -map 
./darknet detector test ds/baram_test4/obj.data cfg/yolov4-tiny-baram.cfg baram_test4/yolov4-tiny-baram_last.weights -thresh 0.06

이어서
./darknet detector train ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights  -map 
4번 인식못해 27번으로 새로 추가함
./darknet detector train ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights  -map 

test
./darknet detector test ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -thresh 0.25
./darknet detector test ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -thresh 0.15
./darknet detector test ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_best.weights -thresh 0.15
./darknet detector test ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -thresh 0.06
 ./darknet detector test ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -thresh 0.8

ds/baram/img/baram_test1_class_2_4.jpg
ds/baram/img/baram_test1_class_1_10.jpg
ds/baram/img/baram_test1_class_5_10.jpg
ds/baram/img/baram_test1_class_5_2.jpg
ds/baram/img/baram_test1_class_5_1.jpg
ds/baram/img/baram_test1_class_6_1.jpg
ds/baram/img/baram_test1_class_4_2.jpg

test/1_돋보기.jpg
test/2_건너뛰기.jpg
test/3_초록쾌완1.jpg
test/4_쾌다음.jpg
test/4_쾌다음2.jpg
test/4_쾌다음3.jpg
test/4_쾌다4.jpg
test/4_쾌다음5.jpg
test/5_쾌버튼1-노랑.jpg
test/6_완료쾌창수락1.jpg
test/6_완료쾌창수락2.jpg
test/7_쾌버튼1-회색-수락하기.jpg
test/8_터치하여즉시수락-텍스트.jpg
test/9_자동이동중_텍스트.jpg
test/10_뉴아이콘.jpg
test/11_도감100퍼.jpg
test/12_완료하기.jpg
test/12_완료하기2.jpg
test/13_이동하기.jpg
test/14_걸어가기.jpg
test/15_사냥도감_제목.jpg
test/16_업적.jpg
test/17_대화.jpg
test/18_이동하기알림.jpg
test/19_도전임무완료.jpg
test/20_수락하기-텍스트-쾌창1.jpg
test/20_수락하기-텍스트-쾌창2.jpg
test/21_보상받기-이벤트창.jpg
test/22_모두받기-이벤트창.jpg
test/23_자동이동중-아이콘.jpg
test/24_모두받기-우편함.jpg
test/25_확인-우편함.jpg
test/26_업적 모두받기.jpg


./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_best.weights -ext_output test3.mp4
./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -ext_output test.mp4
./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -ext_output t1.mp4
./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -ext_output t2.mp4
./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -ext_output t3.mp4
./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -ext_output t4.mp4
./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -ext_output t5.mp4
./darknet detector demo ds/baram/obj.data cfg/yolov4-tiny-baram.cfg backup4/yolov4-tiny-baram_last.weights -ext_output t6.mp4

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
