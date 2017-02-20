#0!/bin/bash
$caffe_path/caffe.bin train \
    --solver=solver.prototxt \
    --gpu 0 \
    2>&1 | tee train.log
    $@
