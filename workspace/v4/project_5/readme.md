0	진행중
1	완료
2	받기
3	쾌스트완료
4	알림창-확인
5   착용
 튜토-거절-스킨가능한지?





# train

./darknet detector train workspace/v4/project_5/obj.data cfg/yolov4-tiny-v4-project_5.cfg yolov4-tiny.conv.29  -map
./darknet detector train workspace/v4/project_5/obj.data cfg/yolov4-tiny-v4-project_5.cfg workspace/v4/project_5/backup/yolov4-tiny-v4-project_5_last.weights  -map 


yolov4-tiny-3l-v4-project4_2
./darknet detector train workspace/v4/project_5/obj.data cfg/yolov4-tiny-v4-project_5.cfg workspace/v4/project_5/backup/yolov4-tiny-v4-project_5_last.weights  -map 
# test

./darknet detector test workspace/v4/project_5/obj.data cfg/yolov4-tiny-v4-project_5.cfg  workspace/v4/project_5/backup/yolov4-tiny-v4-project_5_last.weights -thresh 0.01

./darknet detector demo workspace/v4/project_5/obj.data cfg/yolov4-tiny-v4-project_5.cfg workspace/v4/project_5/backup/yolov4-tiny-v4-project_5_last.weights -ext_output /home/cheolgyu/다운로드/video_1.mp4


yolov4-tiny-3l-v4-project_5_2_last
./darknet detector demo workspace/v4/project_5/obj.data cfg/yolov4-tiny-3l-v4-project_5_2.cfg workspace/v4/project_5/backup-3l/yolov4-tiny-3l-v4-project_5_2_best.weights -ext_output /home/cheolgyu/다운로드/video_1.mp4


./darknet detector map workspace/v4/project_5/obj.data cfg/yolov4-tiny-3l-v4-project_5_2.cfg workspace/v4/project_5/backup-3l/yolov4-tiny-3l-v4-project_5_2_best.weights 
./darknet detector map workspace/v4/project_5/obj.data cfg/yolov4-tiny-v4-project_5.cfg workspace/v4/project_5/backup/yolov4-tiny-v4-project_5_best.weights 
