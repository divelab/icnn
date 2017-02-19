#0!/bin/bash
caffe_path=../../caffe3d/.build_release/tools
$caffe_path/caffe.bin train \
    --solver=solver.prototxt \
    --gpu 1 \
    2>&1 | tee train.log
    $@
#--snapshot=trained_weights/inception_fcn_train_iter_30000.solverstate \
