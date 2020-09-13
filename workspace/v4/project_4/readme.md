# train

./darknet detector train workspace/v4/project_4/obj.data cfg/yolov4-tiny-v4-project_4.cfg yolov4-tiny.conv.29  -map
./darknet detector train workspace/v4/project_4/obj.data cfg/yolov4-tiny-v4-project_4.cfg workspace/v4/project_4/backup/yolov4-tiny-v4-project_4_last.weights  -map 


yolov4-tiny-3l-v4-project4_2
./darknet detector train workspace/v4/project_4/obj.data cfg/yolov4-tiny-3l-v4-project_4_2.cfg workspace/v4/project_4/backup/yolov4-tiny-v4-project_4_last.weights  -map 

# test

./darknet detector test workspace/v4/project_4/obj.data cfg/yolov4-tiny-v4-project_4.cfg  workspace/v4/project_4/backup/yolov4-tiny-v4-project_4_last.weights -thresh 0.01

./darknet detector demo workspace/v4/project_4/obj.data cfg/yolov4-tiny-v4-project_4.cfg workspace/v4/project_4/backup/yolov4-tiny-v4-project_4_last.weights -ext_output /home/cheolgyu/다운로드/video_1.mp4


yolov4-tiny-3l-v4-project_4_2_last
./darknet detector demo workspace/v4/project_4/obj.data cfg/yolov4-tiny-3l-v4-project_4_2.cfg workspace/v4/project_4/backup-3l/yolov4-tiny-3l-v4-project_4_2_best.weights -ext_output /home/cheolgyu/다운로드/video_1.mp4


./darknet detector map workspace/v4/project_4/obj.data cfg/yolov4-tiny-3l-v4-project_4_2.cfg workspace/v4/project_4/backup-3l/yolov4-tiny-3l-v4-project_4_2_best.weights 
./darknet detector map workspace/v4/project_4/obj.data cfg/yolov4-tiny-v4-project_4.cfg workspace/v4/project_4/backup/yolov4-tiny-v4-project_4_best.weights 
