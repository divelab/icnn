caffe_path=/tempspace/hgao/caffe3d/.build_release/tools
GLOG_logtostderr=1 
time $caffe_path/predict_seg_new.bin \
    --model=deploy.prototxt \
    --data=/tempspace/tzeng/cremi/data/val/cremi3D_A_seg_valid_v1.h5 \
    --weights=trained_weights/inception_fcn_train_iter_33000.caffemodel \
    --predict=results/cremi_test_A.h5 \
    --shift_axis=2 \
    --shift_stride=1
#$caffe_path/predict_seg_new.bin \
#    --model=deploy.prototxt \
#    --data=/tempspace/tzeng/cremi/data/val/cremi3D_B_seg_valid_v1.h5 \
#    --weights=trained_weights/inception_fcn_train_iter_30000.caffemodel \
#    --predict=results/cremi_test_B.h5 \
#    --shift_axis=2 \
#    --shift_stride=1
#$caffe_path/predict_seg_new.bin \
#    --model=deploy.prototxt \
#    --data=/tempspace/tzeng/cremi/data/val/cremi3D_C_seg_valid_v1.h5 \
#    --weights=trained_weights/inception_fcn_train_iter_30000.caffemodel \
#    --predict=results/cremi_test_C.h5 \
#    --shift_axis=2 \
#    --shift_stride=1
python predict.py > predict.log
