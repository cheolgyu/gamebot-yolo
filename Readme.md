
https://github.com/AlexeyAB/darknet.git
https://github.com/hunglc007/tensorflow-yolov4-tflite.git
https://github.com/AlexeyAB/Yolo_mark.git
https://github.com/tzutalin/labelImg.git

# 프로젝트들
1. baram 바람에나라
2. baram_2 
	바람-임무창의 작은 텍스트를 구분해 내기위해 cfg 바꿔서 학습
3. baram_3
	darknet으로는 검출이 되지만  tflite로 바꾸면 정확도가 낮아서 그런지 안됨
4. baram_3
	작은텍스트만 학습시켜서 tflite로 돌려보기
5. baram_3 cfg 수정해서 이어서 학습.
	

3. stoneage


# opncv 설치
opncv install
scripts/install_opnecv4.sh

### 라벨링
https://github.com/AlexeyAB/darknet#datasets
OpenImages : python ./scripts/get_openimages_dataset.py기차 감지 데이터 세트에 레이블 지정에 사용
Pascal VOC : python ./scripts/voc_label.pyTrain / Test / Val 감지 데이터 세트에 레이블을 지정 하는 데 사용
./yolo_mark ds/baram_3/img/all ds/baram_3/train.txt ds/baram_3/obj.names
./yolo_mark ds/baram/img/new cap_video t4.mp4 10
./yolo_mark ds/baram_3/img/baram_2020-08-21-16-46-01 cap_video ds/test_mp4/baram_2020-08-21-16-46-01.mp4 10
./yolo_mark ds/baram_3/img/baram_2020-08-21-15-31-18 cap_video ds/test_mp4/baram_2020-08-21-15-31-18.mp4 10

./yolo_mark ds/baram_3/img/baram_2020-08-21-16-46-01 ds/baram_3/train.txt ds/baram_3/obj.names

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
./darknet detector train ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg yolov4-tiny.conv.29  -map
./darknet detector train ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3_2.cfg yolov4-tiny.conv.29  -map
#### 이어서
./darknet detector train ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3_1/yolov4-tiny-3l_baram_3_best.weights  -map 
./darknet detector train ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3_1/yolov4-tiny-3l_baram_3_best.weights  -map 
./darknet detector train ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3_2.cfg backup/backup_baram_3_2/yolov4-tiny-3l_baram_3_2_last.weights  -map 

./darknet detector train ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights  -map 

./darknet detector train ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights  -map 
#### test
./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -thresh 0.25
./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -thresh 0.15
./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup4_1/yolov4-tiny-baram_best.weights -thresh 0.15
./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -thresh 0.06

 ./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -thresh 0.8
 ./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -thresh 0.3
./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -thresh 0.03
./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -thresh 0.01

./darknet detector test ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -thresh 0.01

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


./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/test3.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/test.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/t1.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/t2.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/t3.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/t4.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/t5.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/t6.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/t7.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/baram_2020-08-21-15-31-18.mp4
./darknet detector demo ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights -ext_output ds/test_mp4/baram_2020-08-21-16-46-01.mp4

ds/baram_3/obj.data cfg/yolov4-tiny-3l_baram_3.cfg backup/backup_baram_3/yolov4-tiny-3l_baram_3_best.weights 
## weights to tensorflow  to tflite
python save_model.py --weights ./data/yolov4-tiny-3l_baram_3_best.weights --output ./checkpoints/yolov4-tiny-3l_baram_3_best --input_size 608 --model yolov4 --framework tflite --tiny

python convert_tflite.py --weights ./checkpoints/yolov4-tiny-3l_baram_3_best --output ./checkpoints/yolov4-tiny-3l_baram_3_best.tflite


# Run demo tflite model
python detect.py --weights ./checkpoints/yolov4-tiny-3l_baram_3_best.tflite --size 608 --model yolov4 --image ./data/1597947045328.jpg --framework tflite

python detect.py --weights ./checkpoints/yolov4-tiny-3l_baram_3_best --size 608 --model yolov4 --image ./data/7_쾌버튼1-회색-수락하기.jpg --tiny
