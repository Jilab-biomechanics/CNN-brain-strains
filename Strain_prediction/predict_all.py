"""
Date: Oct 25 2019
Author: Shaoju Wu
Email: swu3@wpi.edu
see also: 
https://github.com/Jilab-biomechanics/CNN-brain-strains

"""
import numpy as np
import scipy.io
import tensorflow as tf
import keras
from keras.models import load_model
from scipy.io import loadmat
from scipy.io import savemat
from sklearn.metrics import mean_squared_error
from math import sqrt
import os

if __name__ == '__main__':
    
    ################# Loading testing profile with shape (N*3*201),where N is the number of profiles. 
    ################# Please check our preprocessing demo if you do not know how to obtain input profile format
    dirpath = os.getcwd()
    x = loadmat(dirpath+'/Input.mat')
    profile_CNN = x['pad_profile']
    
    ################# Reshape the dataset as N*3*201*1
    length_time = 201
    test_data = np.reshape(profile_CNN, (np.size(profile_CNN, 0), 3, length_time, 1))
    
    ################ Load the pre-trained models    
    mps_model = load_model(dirpath+'/Pretrained_model/CNN_MPS_95_V1.h5')
    mps_cc_model = load_model(dirpath+'/Pretrained_model/CNN_MPS_CC_95_V1.h5')
    fs_cc_model = load_model(dirpath+'/Pretrained_model/CNN_FS_CC_95_V1.h5')
    
    ################ Summary of the CNN architecture
    mps_model.summary()
    
    ################ Predict 95th MPS of the Whole brain
    predict_mps_95 = mps_model.predict(test_data)
    
    ################ Predict 95th MPS of the corpus callosum
    predict_mps_cc_95 = mps_cc_model.predict(test_data) 
    
    ################ Predict 95th fiber strain of the corpus callosum
    predict_fs_cc_95 = fs_cc_model.predict(test_data)
    
    ################ Save the predicted brain strain results in 'Output.mat'
    savemat('Output.mat', {'mps_95': predict_mps_95, 'mps_cc_95': predict_mps_cc_95,'fs_cc_95': predict_fs_cc_95})
    print("Predicted results successfully save in Output.mat")
