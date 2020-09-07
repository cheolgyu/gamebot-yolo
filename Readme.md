
https://github.com/AlexeyAB/darknet.git
https://github.com/hunglc007/tensorflow-yolov4-tflite.git
https://github.com/AlexeyAB/Yolo_mark.git
https://github.com/tzutalin/labelImg.git

# 프로젝트들
1. baram 바람에나라

# opncv 설치
opncv install
scripts/install_opnecv4.sh
### 라벨 변경
convert2Yolo


### 라벨링
https://github.com/AlexeyAB/darknet#datasets
OpenImages : python ./scripts/get_openimages_dataset.py기차 감지 데이터 세트에 레이블 지정에 사용
Pascal VOC : python ./scripts/voc_label.pyTrain / Test / Val 감지 데이터 세트에 레이블을 지정 하는 데 사용
./yolo_mark ds/baram_crop/img/all ds/baram_crop_3l/train.txt ds/baram_crop_3l/obj.names
./yolo_mark ds/baram_crop_3l/img/class_3 ds/baram_crop_3l/train.txt ds/baram_crop_3l/obj.names
./yolo_mark ds/baram/img/new cap_video t4.mp4 10
./yolo_mark ds/baram_crop_3l/img/baram_2020-08-21-16-46-01 cap_video ds/test_mp4/baram_2020-08-21-16-46-01.mp4 10
./yolo_mark ds/baram_crop_3l/img/baram_2020-08-21-15-31-18 cap_video ds/test_mp4/baram_2020-08-21-15-31-18.mp4 10

./yolo_mark ds/baram_crop_3l/img/baram_2020-08-21-15-31-18 ds/baram_crop_3l/train.txt ds/baram_crop_3l/obj.names


./yolo_mark ds/baram_crop_3l/img/baram_2020-08-21-16-46-01 ds/baram_crop_3l/train.txt ds/baram_crop_3l/obj.names
labelImg ~/workspace/gb-yolo/baram3/img/baram_crop/all/ ~/workspace/gb-yolo/baram_crop/classes.txt

labelImg ~/workspace/gb-yolo/ds/baram_crop/img/all/ ~/workspace/gb-yolo/baram_crop/name.txt

### build 
docker build -t gb-yolo:latest .  

docker run  --name gb-yolo -d -it -v ~/workspace/gb-yolo:/workspace/gb-yolo -p 8888:8888  gb-yolo:latest
scripts/install_OpenCV4.sh
~/workspace/darknet/build.sh
docker cp gb-yolo:/workspace/darknet/darknet ./darknet

### bakcup폴더
backup4 <= 바람출시
backup4_1 <= 특정 객체만 더 인식 해서 가능한지 파악하려고 생성
backup_baram_2<= 현재진행중


### 학습하기
#### 처음
./darknet detector train workspace/baram/project_3/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg yolov4-tiny.conv.29  -map
#### 이어서
./darknet detector train ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_last.weights  -map 
#### test
##### 사진
./darknet detector test 오브젝트.데이터 cfg파일 무게 -thresh 0.25
./darknet detector test /home/cheolgyu/workspace/gb-yolo/workspace/baram/project_3/obj.data  /home/cheolgyu/workspace/gb-yolo/cfg/yolov4-tiny-baram.cfg  /home/cheolgyu/workspace/gb-yolo/workspace/baram/project_3/backup/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.25

./darknet detector test /home/cheolgyu/workspace/gb-yolo/workspace/baram/project_3/obj.data  /home/cheolgyu/workspace/gb-yolo/cfg/yolov4-tiny-3l_baram_crop.cfg  /home/cheolgyu/workspace/gb-yolo/workspace/baram/project_3/backup/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.25

##### 동영상
./darknet detector demo 오브젝트.데이터 cfg파일 무게  -ext_output 동영상

## weights to tensorflow  to tflite
cp /home/cheolgyu/workspace/gb-yolo/workspace/baram/project_3/backup/yolov4-tiny-3l_baram_crop_best.weights /home/cheolgyu/workspace/tensorflow-yolov4-tflite/data/
무게 /home/cheolgyu/workspace/gb-yolo/workspace/baram/project_3/backup/yolov4-tiny-3l_baram_crop_best.weights

yolov4-tiny-3l_baram_crop_best.weights

python save_model.py --weights data/yolov4-tiny-3l_baram_crop_best.weights --output  ./checkpoints/baram/project_3_416 --input_size 416 --model yolov4 --framework tflite --tiny

python save_model.py --weights data/yolov4-tiny-3l_baram_crop_best.weights --output  ./checkpoints/baram/project_3_832 --input_size 832 --model yolov4 --framework tflite --tiny


python convert_tflite.py --weights ./checkpoints/baram/project_3_416 --output ./checkpoints/baram/project_3_416/detect-416.tflite
python convert_tflite.py --weights ./checkpoints/baram/project_3_832 --output ./checkpoints/baram/project_3_832/detect-832.tflite


python save_model.py --weights 무게 --output  완료파일 --input_size 416 --model yolov4 --framework tflite --tiny



python convert_tflite.py --weights 완료파일 --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-832.tflite

python save_model.py --weights ./data/yolov4-tiny-3l_baram_crop_best.weights --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-832 --input_size 832 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best-832 --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-832.tflite

python save_model.py --weights ./data/yolov4-tiny-3l_baram_crop_best.weights --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-608 --input_size 608 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best-608 --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-608.tflite

python save_model.py --weights ./data/yolov4-tiny-3l_baram_crop_best.weights --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-416 --input_size 416 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best-416 --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-416.tflite


# Run demo tflite model

python detect.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best.tflite --size 832 --model yolov4 --image ./data/1597947045328.jpg --framework tflite

python detect.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best --size 832 --model yolov4 --image ./data/7_쾌버튼1-회색-수락하기.jpg --tiny
