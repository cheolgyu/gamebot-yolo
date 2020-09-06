
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
./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.25
./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.15
./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup4_1/yolov4-tiny-baram_best.weights -thresh 0.15
./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.06

 ./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.8
 ./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.3
./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.03
./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.01

./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.01

./darknet detector test ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_last.weights -thresh 0.01

ds/baram_crop/img/all/2020-08-29_145033673394.jpg
ds/baram_crop/img/all/2020-08-29_143757374233.jpg
ds/baram_crop/img/all/2020-08-29_145031401763.jpg
ds/baram_crop/img/all/2020-08-29_143800958789.jpg
ds/baram_crop/img/all/2020-08-29_145032568056.jpg
ds/baram_crop/img/all/2020-08-29_143956153017.jpg
ds/baram_crop/img/all/2020-08-29_145028744082.jpg
ds/baram_crop/img/all/2020-08-29_145014947324.jpg
ds/baram_crop/img/all/2020-08-29_143833162480.jpg
ds/baram_crop/img/all/2020-08-29_143948260079.jpg
ds/baram_crop/img/all/2020-08-29_143948981434.jpg
ds/baram_crop/img/all/2020-08-29_145031066996.jpg
ds/baram_crop/img/all/2020-08-29_145026490860.jpg






ds/test_img/1597947054546.JPEG
ds/test_img/수락하기.jpg
ds/test_img/돋보기.jpg
ds/test_img/1_돋보기.jpg
ds/test_img/2_건너뛰기.jpg
ds/test_img/3_초록쾌완1.jpg
ds/test_img/3_초록쾌완2.jpg
ds/test_img/3_초록쾌완3.jpg
ds/test_img/4_쾌다음.jpg
ds/test_img/4_쾌다음2.jpg
ds/test_img/4_쾌다음3.jpg
ds/test_img/4_쾌다4.jpg
ds/test_img/4_쾌다음5.jpg
ds/test_img/5_쾌버튼1-노랑.jpg
ds/test_img/6_완료쾌창수락1.jpg
ds/test_img/6_완료쾌창수락2.jpg
ds/test_img/7_쾌버튼1-회색-수락하기.jpg
ds/test_img/8_터치하여즉시수락-텍스트.jpg
ds/test_img/9_자동이동중_텍스트.jpg
ds/test_img/10_뉴아이콘.jpg
ds/test_img/11_도감100퍼.jpg
ds/test_img/12_완료하기.jpg
ds/test_img/12_완료하기2.jpg
ds/test_img/13_이동하기.jpg
ds/test_img/14_걸어가기.jpg
ds/test_img/15_사냥도감_제목.jpg
ds/test_img/16_업적.jpg
ds/test_img/17_대화.jpg
ds/test_img/18_이동하기알림.jpg
ds/test_img/19_도전임무완료.jpg
ds/test_img/20_수락하기-텍스트-쾌창1.jpg
ds/test_img/20_수락하기-텍스트-쾌창2.jpg
ds/test_img/21_보상받기-이벤트창.jpg
ds/test_img/22_모두받기-이벤트창.jpg
ds/test_img/23_자동이동중-아이콘.jpg
ds/test_img/24_모두받기-우편함.jpg
ds/test_img/25_확인-우편함.jpg
ds/test_img/26_업적 모두받기.jpg


./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/test3.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/test.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/t1.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/t2.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/t3.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/t4.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/t5.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/t6.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/t7.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/baram_2020-08-21-15-31-18.mp4
./darknet detector demo ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights -ext_output ds/test_mp4/baram_2020-08-21-16-46-01.mp4

ds/baram_crop_3l/obj.data cfg/yolov4-tiny-3l_baram_crop.cfg backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights 
## weights to tensorflow  to tflite
cp ~/workspace/gb-yolo/backup/backup_baram_crop_3l/yolov4-tiny-3l_baram_crop_best.weights /home/cheolgyu/workspace/tensorflow-yolov4-tflite/data

python save_model.py --weights ./data/yolov4-tiny-3l_baram_crop_best.weights --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-832 --input_size 832 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best-832 --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-832.tflite

python save_model.py --weights ./data/yolov4-tiny-3l_baram_crop_best.weights --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-608 --input_size 608 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best-608 --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-608.tflite

python save_model.py --weights ./data/yolov4-tiny-3l_baram_crop_best.weights --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-416 --input_size 416 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best-416 --output ./checkpoints/yolov4-tiny-3l-baram_crop_best-416.tflite


# Run demo tflite model

python detect.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best.tflite --size 832 --model yolov4 --image ./data/1597947045328.jpg --framework tflite

python detect.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best --size 832 --model yolov4 --image ./data/7_쾌버튼1-회색-수락하기.jpg --tiny
