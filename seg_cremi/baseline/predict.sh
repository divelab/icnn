GLOG_logtostderr=1 
time $caffe_path/predict_seg_new.bin \
    --model=deploy.prototxt \
    --data={cremi}_valid.h5 \
    --weights=trained_weights/inception_fcn_train_iter_33000.caffemodel \
    --predict=results/cremi_test_A.h5 \
    --shift_axis=2 \
    --shift_stride=1
