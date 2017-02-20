#0!/bin/bash
$caffe_path/caffe.bin train \
    --solver=solver.prototxt \
    --gpu 1 \
    2>&1 | tee train.log
    $@
