"""Output cross-entropy cost for prediction."""
import h5py
import math
import os
import numpy as np
from sklearn.metrics import log_loss, auc, roc_curve

DIM = 1024
ONE_L = 1

LABEL_FILES = {
    'A': '/tempspace/tzeng/cremi/data/val/cremi3D_A_seg_valid_v1.h5',
    'B': '/tempspace/tzeng/cremi/data/val/cremi3D_B_seg_valid_v1.h5',
    'C': '/tempspace/tzeng/cremi/data/val/cremi3D_C_seg_valid_v1.h5',
}


def get_cost(y, p):
    """Get cost."""
    if p >= 1.0 or p <= 0.0:
        return 0
    return - (y * math.log(p) + (1 - y) * math.log(1 - p))


def output_costs(rdir='./results/'):
    """Output cost for a prediction."""
    labels_dict = {}
    for key, value in LABEL_FILES.items():
        labels_dict[key] = h5py.File(value)['label']
    cost = 0
    wrong = 0
    total = 0
    auc_v = 0
    for file_name in os.listdir(rdir):
        key = file_name.split('.')[0].split('_')[-1]
        labels = labels_dict[key]
        DIM = labels.shape[0]
        print 'DIM for file ', file_name, DIM
        index = int(file_name.rsplit('_', 1)[1].split('.')[0])
        with h5py.File(rdir + file_name) as f:
            label = np.array(labels[:,:,index])
            data = np.array(f['data'][0][1])
            loss = log_loss(label, data)
            fpr, tpr, thresholds = roc_curve(label.reshape(DIM*DIM), data.reshape(DIM*DIM))
            cur_auc = auc(fpr, tpr)
            data[data > 0.5] = 1.0
            data[data < 0.5] = 0.0
            diff = data - label
            diff[diff < 0.0] = 1.0
            wrong += diff.sum()
            total += DIM*DIM
            cost += loss
            auc_v += cur_auc
            print file_name, 'loss is =-=--=->', loss, diff.sum(), cur_auc
    print 'The accuracy is ----->', 1 - wrong / total
    print 'The cost is ----->', cost / total
    print 'The auc is ----->', auc_v / len(os.listdir(rdir))

if __name__ == '__main__':
    output_costs()

