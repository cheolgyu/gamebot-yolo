
yolo : https://github.com/AlexeyAB/darknet.git   
yolo to tflite : https://github.com/hunglc007/tensorflow-yolov4-tflite.git   
라벨링   
https://github.com/tzutalin/labelImg.git   
+ sudo apt-get install pyqt5-dev-tools
voc -> yolo 포맷 변경: https://github.com/ssaru/convert2Yolo.git   

# 준비
1. darknet , yolo_mark (동영상 자를때), labelImg 설치
2. git clone git@github.com:cheolgyu/gamebot-yolo.git
3. darknet 실행파일 gamebot-yolo에 넣고
4. git clone git@github.com:cheolgyu/gamebot-dataset.git
5. gamebot-dataset 이동해서 gamebot-dataset/ds/폴더 원드라이드랑 업로드 동기화 시키고 
6. gamebot-yolo docker는 사용안하고 우분투에서 실행시킴. 
7. 사진없고 동영상만 있으면 yolo_mark로 프레임 짜르고 
8. 사진가지고 라벨링을하는데 labelImg로 하기 
9. 라벨링 어느정도 완료하면 라벨링된것을 훈련용과 검증용 으로 분류해야됨.
10. 분류스크립트는 https://github.com/cheolgyu/gamebot-dataset/blob/master/yolo/label_after2.py 참고하고
11. obj.data 랑 obj.names랑 backup폴더 확인하고 
12. 학습하기 처음-이어서로 학습하면되고 그래프가안나오면 opnecv가 설치제대로안해서 그런거니깐 보고싶으면 설치 ㄱㄱ
13. [중간중간 훈련된것 확인하는방법](https://github.com/cheolgyu/gamebot-yolo#test)
14. [훈련이 어느정된후 tflite로 바꾸는방법은]()
15. tensorflow-yolov4-tflite 폴더에 converet_dockerfile 빌드후에 실행시키고
16. 거기서 weights to tensorflow to tflite 참고해서 실행시키면 됨. 2번실행해야됨.tensorflow(pb) 바꾸고 그담 그걸 tflite로 만들고 이렇게 2번실행.



# 프로젝트들
1. v4
2. gotgl: 왕좌의게임:윈터이즈커밍
    project5 
        project4 1000.weights에서 시작
        해상도= width=960 height=480
        인식성공
    project6 
        project5 last.weights에서 시작 ( 약 2000 iteration)
        해상도 608 * 608 안되
        960 * 960 
    project5 +  https://github.com/Zellius/tensorflow-yolov4-tflite, https://github.com/hunglc007/tensorflow-yolov4-tflite/pull/163
        --input_size 960x480  안드에서 인식률 떨어짐. 100퍼 ->20퍼 + 인식도 잘안됨. 
    project6
        960 * 960 로 더학습 
    project7
        960 * 960 ==> map 0%
    project8
        추가
            확인
            일어나기 
        project5_last로 시작 ==> nan 나옴
        처음부터 == > 잘됨.
    project9
        추가
            확인
            일어나기 + 수령+도움 
        처음부터 



# opncv 설치
opncv install
scripts/install_opnecv4.sh
### 라벨 변경
convert2Yolo의 예대로 폴더구조 변경해야됨.


### 라벨링
https://github.com/AlexeyAB/darknet#datasets

### build 
docker build -t gb-yolo:latest .  

docker run  --name gb-yolo -d -it -v ~/workspace/gb-yolo:/workspace/gb-yolo -p 8888:8888  gb-yolo:latest
scripts/install_OpenCV4.sh
~/workspace/darknet/build.sh
docker cp gb-yolo:/workspace/darknet/darknet ./darknet



### 학습하기
#### 처음
cfg/yolov4-tiny-gotgl-project_1.cfg
cfg/yolov4-tiny-gotgl-project_1.cfg
./darknet detector train workspace/gotgl/project_9/obj.data cfg/yolov4-tiny-gotgl-project_9-3l.cfg yolov4-tiny.conv.29  -map
./darknet detector train workspace/gotgl/project_7/obj.data cfg/yolov4-tiny-gotgl-project_7-3l.cfg yolov4-tiny.conv.29  -map
#### 이어서
./darknet detector train workspace/gotgl/project_8/obj.data cfg/yolov4-tiny-gotgl-project_8-3l.cfg workspace/gotgl/project_8/backup/yolov4-tiny-gotgl-project_5-3l_last.weights  -map
./darknet detector train workspace/gotgl/project_8/obj.data cfg/yolov4-tiny-gotgl-project_8-3l.cfg workspace/gotgl/project_8/backup/yolov4-tiny-gotgl-project_8-3l_last.weights  -map

#### test

./darknet_cpu detector test workspace/v4/project_3/obj.data  cfg/yolov4-tiny-v4-project_3.cfg  workspace/v4/project_3/backup/yolov4-tiny-v4-project_3_last.weights -thresh 0.25

./darknet_cpu detector test workspace/v4/project_3/obj.data  cfg/yolov4-tiny-3l-v4-project_3.cfg  workspace/v4/project_3/backup/yolov4-tiny-3l-v4-project_3_best.weights -thresh 0.01

yolov4-tiny-gotgl-project_5-3l_last

./darknet detector demo workspace/gotgl/project_8/obj.data cfg/yolov4-tiny-gotgl-project_8-3l.cfg workspace/gotgl/project_8/backup/yolov4-tiny-gotgl-project_8-3l_last.weights -ext_output /home/cheolgyu/다운로드/gotgl_video_1.mp4


./darknet detector map workspace/gotgl/project_1/obj.data cfg/yolov4-tiny-gotgl-project_1.cfg workspace/gotgl/project_1/backup/yolov4-tiny-gotgl-project_1_best.weights


##### 사진
./darknet detector test 오브젝트.데이터 cfg파일 무게 -thresh 0.25
./darknet detector test /home/cheolgyu/workspace/gb-yolo/workspace/blackdesertm/project_1/obj.data  /home/cheolgyu/workspace/gb-yolo/cfg/yolov4-tiny-baram.cfg  /home/cheolgyu/workspace/gb-yolo/workspace/blackdesertm/project_1/backup/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.25

./darknet detector test /home/cheolgyu/workspace/gb-yolo/workspace/blackdesertm/project_1/obj.data  /home/cheolgyu/workspace/gb-yolo/cfg/yolov4-tiny-3l_baram_crop.cfg  /home/cheolgyu/workspace/gb-yolo/workspace/blackdesertm/project_1/backup/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.25

##### 동영상
./darknet detector demo 오브젝트.데이터 cfg파일 무게  -ext_output 동영상

## weights to tensorflow  to tflite
cp /home/cheolgyu/workspace/gamebot/gamebot-yolo/workspace/gotgl/project_8/backup/yolov4-tiny-gotgl-project_8-3l_last.weights /home/cheolgyu/workspace/gamebot/tensorflow-yolov4-tflite/data/gotgl/yolov4-tiny-v4-project_8_last.weights
무게 data/yolov4-tiny-v4-project_1_last.weights

yolov4-tiny-3l_baram_crop_best.weights

python save_model.py --weights data/gotgl/yolov4-tiny-v4-project_5_last.weights --output ./checkpoints/gotgl/project_5 --input_size 960 --input_size_h 480 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/gotgl/project_5 --output ./checkpoints/gotgl/project_5/detect.tflite

python save_model.py --weights data/yolov4-tiny-3l_baram_crop_best.weights --output  ./checkpoints/baram/project_3_832 --input_size 832 --model yolov4 --framework tflite --tiny

## weights to tensorflow  to tflite  ==>2
cp /home/cheolgyu/workspace/gamebot/gamebot-yolo/workspace/gotgl/project_8/backup/yolov4-tiny-gotgl-project_8-3l_last.weights /home/cheolgyu/workspace/gamebot/convert2/data/gotgl/yolov4-tiny-v4-project_8_last.weights

### 416x416
python save_model.py --weights data/gotgl/yolov4-tiny-v4-project_5_last.weights --output ./checkpoints/gotgl/project_5_416x416 --input_size 416x416 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/gotgl/project_5_416x416 --output ./checkpoints/gotgl/project_5_416x416/detect.tflite
python detect.py --weights ./checkpoints/gotgl/project_5_416x416/detect.tflite --size 416x416 --model yolov4 --image ./gotgl_video_1_00000003.jpg --framework tflite

### 608x608
python save_model.py --weights data/gotgl/yolov4-tiny-v4-project_5_last.weights --output ./checkpoints/gotgl/project_5_608x608 --input_size 608x608 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/gotgl/project_5_608x608 --output ./checkpoints/gotgl/project_5_608x608/detect.tflite
python detect.py --weights ./checkpoints/gotgl/project_5_608x608/detect.tflite --size 608x608 --model yolov4 --image ./gotgl_video_1_00000003.jpg --framework tflite

### 832x832
python save_model.py --weights data/gotgl/yolov4-tiny-v4-project_8_last.weights --output ./checkpoints/gotgl/project_8_832x832 --input_size 832x832 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/gotgl/project_8_832x832 --output ./checkpoints/gotgl/project_8_832x832/detect_832x832.tflite
python detect.py --weights ./checkpoints/gotgl/project_8_832x832/detect_832x832.tflite --size 832x832 --model yolov4 --image ./gotgl_video_1_00000003.jpg --framework tflite



# Run demo tflite model

python detect.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best.tflite --size 832 --model yolov4 --image ./data/1597947045328.jpg --framework tflite

python detect.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best --size 832 --model yolov4 --image ./data/7_쾌버튼1-회색-수락하기.jpg --tiny
