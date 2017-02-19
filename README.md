# Rotation and Flip Invariant CNN

Caffe implementation of Rotation and Flip Invariant Convolutional Layer is implemented in caffe_3d @ 9686972.

## How to run

In seg_cremi, there are two folders: baseline and newmodel. You can run train.sh to train the model in case you have installed caffe_3d and prepared the data.

## Kernel Rotation operation:
The kernels in convolutional layers are rotated at eight angles:
![drawing](./assets/KernelRotation.png | width=250)

## Kernel Rotation operation:
The kernels in convolutional layers are flipped both horizontally and vertically:
![model](./assets/KernelFlip.png)

## Rotation Invariance with Maxout

![model](./assets/maxoutrotate.png)

## Flip Invariance with Maxout

![model](./assets/maxoutflip.png)

## Model used

![model](./assets/c_model.png)

## Author

Hongyang Gao
