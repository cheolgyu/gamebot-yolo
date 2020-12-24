
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
5. gamebot-dataset 이동해서 gamebot-dataset/ds/폴더 원드라이드랑 업로드 동기화 시켜 동영상 다운받기
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
```
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
    project9 832x832 출시, 추론하는데 2~3초걸림
        추가
            확인
            일어나기 + 수령+도움 
        처음부터 
    project10 
        필요
            수정: 일어나기-상태바:축소 -> 피통 빨간부분만 인식 후에 없으면 0.0 좌표클릭 이벤트발생 
            추가: 자원수집 : 이슈 수집 버튼이 너무작음 832x832해도 작음 자원외의 비슷한 아이콘도 존재함. 
            ==>3l-832x832가 2~3초정도걸림. 그래서 project10은 아예 yolov4 로 테스트
            
            CUDA Error: out of memory:
    project11
        tiny-3l  
        960x480
        map 100% 나와서 종료 tflite test에서는 정확도가 낮음 
    ./darknet detector map workspace/gotgl/project_11/obj.data cfg/gotgl_11.cfg workspace/gotgl/project_11/backup/gotgl_11_last.weights
    project12
        tiny-3l 처음부터  
        960x960 학습 : 1696x954 픽셀 이미지
        map 0% 실패
        ./darknet detector map workspace/gotgl/project_12/obj.data cfg/gotgl_12.cfg workspace/gotgl/project_12/backup/gotgl_12_last.weights
    project13
        tiny-3l 처음부터  
        832x832 학습 : 1696x954 픽셀 이미지
        map 0% 실패

        https://github.com/AlexeyAB/darknet/wiki/FAQ---frequently-asked-questions
        ./darknet detector map workspace/gotgl/project_14/obj.data cfg/gotgl_14.cfg workspace/gotgl/project_14/backup/gotgl_14_last.weights

        
        480x480 하니깐 잘된다 대박
    project14
        project13 + 라벨링 정리.
        480x480 으로학습 960으로 tflite
        ./darknet detector demo workspace/gotgl/project_14/obj.data cfg/gotgl_14.cfg workspace/gotgl/project_14/backup/gotgl_14_last.weights  -ext_output /home/cheolgyu/다운로드/gotgl_video_1.mp4

    project15
        라벨링
            0. 수령 - > 이미지 하단 위주로 다시라벨링.
            1. 도움
            2. 수령확인
            3. 상태바- > 할리스아이콘으로
            4. 식량
            5. 목재
            6. 석재
            7. 철광
            8. 음식
            9. 창닫기
        dataset= 
            v8 = 수령,도움,할리스,식량,목재,석재,철광,음식 - 350
            v9 = 창닫기 - 153
            수령_도움_할리스_독사진 - 442
            식량_목재_석재_철과_음식_확대사진 < - 손으로 라벨링 !!  - 31
            수령x_t1 - 14
            수령x_t2 - 69
        + 창닫기 추가
        + 수령 아이콘 모양의 하단 부분으로 라벨링 변경.
        
        480x480 으로학습 960으로 tflite

        1. 수령가능 하지 않는상태는 라벨링 하지 않고 테스트 실패면? -> 잘되네.
            1-1. 수령가능 하지 않는 상태를 라벨링하여 학습한다
            1-2. 수령가능 하지 않는 상태의 이미지 수를 많게하고 나머진 10개 씩만 하고 테스트
        
    project16- 실패 
        카메라 확대 로 416 가자 . 
        + dataset 10~19
        확대한것 사용
        0. 수령 
        1. 수령x5
        2. 수령확인
        3. 도움
        4. 할리스
        5. 식량
        6. 목재
        7. 석재
        8. 철광
        9. 음식
        10. 창닫기
        fivestars_1.cfg 복사


 ```           
3. fivestars 파이브스타즈
    ```
    yolov4-tiny.cfg
    classes= 8
    0. 쾌시작
    1. 쾌정보-확인
    2. 전투시작
    3. 월드맵
    4. 건너뛰기
    5. 쾌스트보상-확인
    6. 렙업확인
    7. 컨텐츠오픈 확인
    
4. illusionc 일루전커넥트
    yolov4-tiny.cfg
    0. 쾌시작
    1. 도전
    2. 알림
    3. 승리
    4. 스킵
    5. 패배
    6. 획득보상
    classes=12

    ```

5. sk2 세븐나이츠2
```
    project5

        인식대상기준
            0 0.956291 0.050000 0.058007 0.088406   --홈
            1 0.933415 0.906522 0.066176 0.140580   --절전풀.방치o
            2 0.097631 0.057246 0.090686 0.097101   --전체풀
            3 0.769608 0.775362 0.225490 0.136232   --분해좌
            4 0.645016 0.675362 0.100490 0.081159   --일반
            5 0.743056 0.674638 0.097222 0.073913   --고급
            6 0.903595 0.771014 0.181373 0.168116   --분해우
            7 0.230801 0.547826 0.100490 0.168116   --금화위치.분해결과2.분해선택
            7 0.184641 0.547101 0.086601 0.157971   --금화위치.분해결과3.분해선택

            8 0.524101 0.500000 0.776961 0.515942   --분해팝업창
            9 0.613971 0.663043 0.247549 0.155072   --분해팝업창.확인
            10 0.428922 0.479710 0.104575 0.171014  --금화위치.분해결과2
            10 0.361928 0.484783 0.104575 0.169565  --금화위치.분해결과3
            11 0.498775 0.221014 0.178922 0.120290  --분해결과.텍스트
            12 0.928102 0.072500 0.119361 0.085000  --스킵
            13 0.613715 0.699846 0.204861 0.121914  --스킵확인
            14 0.387587 0.699074 0.203993 0.111111  --스킵취소
            15 0.879229 0.790833 0.121241 0.208333  --스마.off
            16 0.879229 0.790833 0.121241 0.208333  --스마.on
            17 0.500000 0.498457 0.913194 0.651235  --팀교체.전체
            18 0.486979 0.650463 0.477431 0.331790  --팀교체.중간
            19 0.601562 0.715278 0.197917 0.158951  --팀교체.진행
            20 0.293837 0.401235 0.556424 0.709877  --도움.전체
            21 0.296441 0.109568 0.459201 0.120370  --도움.중간
            22 0.492622 0.105710 0.070312 0.128086  --도움.닫기
            23 0.522059 0.492972 0.727376 0.638554  --전투패배팝업







```




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

### cfg
https://github.com/AlexeyAB/darknet#how-to-train-to-detect-your-custom-objects   
max_batches to (classes*2000     
change [filters=255] to filters=(classes + 5)x3 in the 3 [convolutional] before each [yolo] 




### 학습하기
#### 처음
./darknet detector train workspace/sk2/project_4/obj.data cfg/sk2_p4_yolov4-tiny-3l.cfg yolov4-tiny.conv.29  -map

#### 이어서
./darknet detector train workspace/sk2/project_4/obj.data cfg/sk2_p4_yolov4-tiny-3l.cfg workspace/sk2/project_4/backup/sk2_p4_yolov4-tiny-3l_last.weights   -map 
./darknet detector train workspace/sk2/project_1/obj.data cfg/sk2_2_yolov4-tiny-3l.cfg workspace/sk2/project_1/backup/sk2_2_yolov4-tiny-3l_last.weights   -map  -show_imgs
./darknet detector train workspace/illusionc/p1/obj.data cfg/illusionc_1.cfg workspace/illusionc/p1/backup/illusionc_1_last.weights   -map
./darknet detector map workspace/illusionc/p1/obj.data cfg/illusionc_1.cfg workspace/illusionc/p1/backup/illusionc_1_last.weights  
#### test
./darknet detector demo workspace/sk2/project_3/obj.data cfg/sk2_p3_yolov4-tiny-3l.cfg workspace/sk2/project_3/backup/sk2_p3_yolov4-tiny-3l_last.weights  -ext_output /home/cheolgyu/다운로드/sk2_0032.mp4 -thresh 0.6
./darknet detector demo workspace/sk2/project_1/obj.data cfg/sk2_2_yolov4-tiny-3l.cfg workspace/sk2/project_1/backup/sk2_2_yolov4-tiny-3l_best.weights  -ext_output /home/cheolgyu/다운로드/sk2_0021.mp4

./darknet detector test workspace/sk2/project_1/obj.data  cfg/sk2_1.cfg  workspace/sk2/project_1/backup/sk2_1_last.weights  -thresh 0.25
./darknet detector test workspace/sk2/project_1/obj.data  cfg/sk2_2_yolov4-tiny-3l.cfg  workspace/sk2/project_1/backup/sk2_2_yolov4-tiny-3l_best.weights  -thresh 0.25

./darknet_cpu detector test workspace/v4/project_3/obj.data  cfg/yolov4-tiny-3l-v4-project_3.cfg  workspace/v4/project_3/backup/yolov4-tiny-3l-v4-project_3_best.weights -thresh 0.01

./darknet detector demo workspace/illusionc/p1/obj.data cfg/illusionc_1.cfg workspace/illusionc/p1/backup/illusionc_1_last.weights  -ext_output /home/cheolgyu/다운로드/gotgl_video_11.mp4

./darknet detector map workspace/illusionc/p1/obj.data   cfg/illusionc_1.cfg   workspace/illusionc/p1/backup/illusionc_1_last.weights 


##### 사진
./darknet detector test 오브젝트.데이터 cfg파일 무게 -thresh 0.25
./darknet detector test /home/cheolgyu/workspace/gb-yolo/workspace/blackdesertm/project_1/obj.data  /home/cheolgyu/workspace/gb-yolo/cfg/yolov4-tiny-baram.cfg  /home/cheolgyu/workspace/gb-yolo/workspace/blackdesertm/project_1/backup/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.25

./darknet detector test /home/cheolgyu/workspace/gb-yolo/workspace/blackdesertm/project_1/obj.data  /home/cheolgyu/workspace/gb-yolo/cfg/yolov4-tiny-3l_baram_crop.cfg  /home/cheolgyu/workspace/gb-yolo/workspace/blackdesertm/project_1/backup/yolov4-tiny-3l_baram_crop_best.weights -thresh 0.25

##### 동영상
./darknet detector demo 오브젝트.데이터S cfg파일 무게  -ext_output 동영상

## weights to tensorflow  to tflite -container run
### update classes  /data/classes
### 480
python save_model.py --weights data/sk2_p3_yolov4-tiny-3l_last.weights  --output ./checkpoints/sk2_p3-480 --input_size 480 --model yolov4 --framework tflite --tiny

python convert_tflite.py --weights ./checkpoints/sk2_p3-480 --output ./checkpoints/sk2_p3-480/sk2_p3-480.tflite 

python detect.py --weights ./checkpoints/sk2_p3-480/sk2_p3-480.tflite --size 480 --model yolov4 --image ./sk2_test_img/sk2_0020_00000493.jpg --framework tflite

### 640
python save_model.py --weights data/sk2_p4_yolov4-tiny-3l_last.weights  --output ./checkpoints/sk2_p4-640 --input_size 640 --model yolov4 --framework tflite --tiny

python convert_tflite.py --weights ./checkpoints/sk2_p4-640 --output ./checkpoints/sk2_p4-640/sk2_p4-640.tflite 

python detect.py --weights ./checkpoints/sk2_p4-640/sk2_p4-640.tflite --size 640 --model yolov4 --image ./sk2_test_img/sk2_0020_00000493.jpg --framework tflite

### 416
python save_model.py --weights data/illusionc/illusionc_1_last.weights --output ./checkpoints/illusionc_1_last-416 --input_size 416 --model yolov4 --framework tflite --tiny

python convert_tflite.py --weights ./checkpoints/illusionc_1_last-416 --output ./checkpoints/illusionc_1_last-416/illusionc_1_last-416.tflite

python detect.py --weights ./checkpoints/illusionc_1_last-416 --size 416 --model yolov4 --image ./illusionc_video_8_00000078.jpg --tiny

python detect.py --weights ./checkpoints/illusionc_1_last-416/illusionc_1_last-416.tflite --size 416 --model yolov4 --image ./illusionc_v6_00000063.jpg --framework tflite

### 832
python save_model.py --weights data/gotgl/gotgl_14_last.weights --output ./checkpoints/gotgl_14_last-832 --input_size 832 --model yolov4 --framework tflite --tiny

python convert_tflite.py --weights ./checkpoints/gotgl_14_last-832 --output ./checkpoints/gotgl_14_last-832/gotgl_14_last-832.tflite

python detect.py --weights ./checkpoints/gotgl_14_last-832 --size 832 --model yolov4 --image ./gotgl_video_8_00000078.jpg --tiny

python detect.py --weights ./checkpoints/gotgl_14_last-832/gotgl_14_last-832.tflite --size 832 --model yolov4 --image ./gotgl_video_8_00000078.jpg --framework tflite


### 960
python save_model.py --weights data/gotgl/gotgl_15_last.weights --output ./checkpoints/gotgl_15_last-960 --input_size 960 --model yolov4 --framework tflite --tiny

python convert_tflite.py --weights ./checkpoints/gotgl_15_last-960 --output ./checkpoints/gotgl_15_last-960/gotgl_15_last-960.tflite

python detect.py --weights ./checkpoints/gotgl_15_last-960 --size 960 --model yolov4 --image ./gotgl_video_8_00000078.jpg --tiny

python detect.py --weights ./checkpoints/gotgl_15_last-960/gotgl_15_last-960.tflite --size 960 --model yolov4 --image ./gotgl_video_5_00000292.jpg --framework tflite
gotgl_video_8_00000078
gotgl_video_5_00000292
### 1280
python save_model.py --weights data/gotgl/gotgl_14_last.weights --output ./checkpoints/gotgl_14_last-1280 --input_size 1280 --model yolov4 --framework tflite --tiny

python convert_tflite.py --weights ./checkpoints/gotgl_14_last-1280 --output ./checkpoints/gotgl_14_last-1280/gotgl_14_last-1280.tflite

python detect.py --weights ./checkpoints/gotgl_14_last-1280 --size 1280 --model yolov4 --image ./gotgl_video_8_00000078.jpg --tiny

python detect.py --weights ./checkpoints/gotgl_14_last-1280/gotgl_14_last-1280.tflite --size 1280 --model yolov4 --image ./gotgl_video_8_00000078.jpg --framework tflite


## weights to tensorflow  to tflite  ==>2


### 960x480
python save_model.py --weights data/gotgl/gotgl_11_last.weights --output ./checkpoints/gotgl_11-960x480 --input_size 960x480 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/gotgl_11-960x480 --output ./checkpoints/gotgl_11-960x480/gotgl_11-960x480.tflite
python detect.py --weights ./checkpoints/gotgl_11-960x480/gotgl_11-960x480.tflite --size 960x480 --model yolov4 --image ./gotgl_video_8_00000078.jpg --framework tflite

### 832x832
python save_model.py --weights data/gotgl/gotgl_11_last.weights --output ./checkpoints/gotgl_11-832x832 --input_size 832x832 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/gotgl_11-832x832 --output ./checkpoints/gotgl_11-832x832/gotgl_11-832x832.tflite
python detect.py --weights ./checkpoints/gotgl_11-832x832/gotgl_11-832x832.tflite --size 832x832 --model yolov4 --image ./gotgl_video_8_00000078.jpg --framework tflite

### 608x608
python save_model.py --weights data/gotgl/gotgl_11_last.weights --output ./checkpoints/gotgl_11-608x608 --input_size 608x608 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/gotgl_11-608x608 --output ./checkpoints/gotgl_11-608x608/gotgl_11-608x608.tflite
python detect.py --weights ./checkpoints/gotgl_11-608x608/gotgl_11-608x608.tflite --size 608x608 --model yolov4 --image ./gotgl_video_8_00000078.jpg --framework tflite


### 416x416
python save_model.py --weights data/gotgl/gotgl_11_last.weights --output ./checkpoints/gotgl_11-416x416 --input_size 416x416 --model yolov4 --framework tflite --tiny
python convert_tflite.py --weights ./checkpoints/gotgl_11-416x416 --output ./checkpoints/gotgl_11-416x416/gotgl_11-416x416.tflite
python detect.py --weights ./checkpoints/gotgl_11-416x416/gotgl_11-416x416.tflite --size 416x416 --model yolov4 --image ./gotgl_video_8_00000078.jpg --framework tflite




# Run demo tflite model

python detect.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best.tflite --size 832 --model yolov4 --image ./data/1597947045328.jpg --framework tflite

python detect.py --weights ./checkpoints/yolov4-tiny-3l-baram_crop_best --size 832 --model yolov4 --image ./data/7_쾌버튼1-회색-수락하기.jpg --tiny
