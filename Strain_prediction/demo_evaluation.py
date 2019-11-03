
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

def main():
    
    
    ################# Loading testing profile and ground truth labels simulated by WHIM 
    dirpath = os.getcwd()
    x = loadmat(dirpath+'/Evaluation_example.mat')
    label_mps_95 = x['mps_95']
    label_mps_cc_95 = x['mps_cc_95']
    label_fs_cc_95 = x['fs_cc_95']
    profile_CNN = x['pad_profile']
    
    ################# Reshape the dataset as N*3*201*1, where N is the number of profiles
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
    
    ################ Comput the RMSE between the predicted 95th MPS and actual 95th MPS from WHIM    
    test_RMSE_mps = sqrt(mean_squared_error(predict_mps_95, label_mps_95))
    print("RMSE of predicted 95th MPS: %f" % test_RMSE_mps)
    
    ################ Predict 95th MPS of the corpus callosum
    predict_mps_cc_95 = mps_cc_model.predict(test_data)    
    test_RMSE_mps_cc = sqrt(mean_squared_error(predict_mps_cc_95, label_mps_cc_95))
    print("RMSE of predicted 95th MPS of corpus callosum: %f" % test_RMSE_mps_cc)
    
    ################ Predict 95th fiber strain of the corpus callosum
    predict_fs_cc_95 = fs_cc_model.predict(test_data)    
    test_RMSE_fs_cc = sqrt(mean_squared_error(predict_fs_cc_95, label_fs_cc_95))
    print("RMSE of predicted 95th peak fiber strain of corpus callosum: %f" % test_RMSE_fs_cc)
    
    ################ Save the predicted brain strain results in 'Output.mat'
    savemat('Output.mat', {'mps_95': predict_mps_95, 'mps_cc_95': predict_mps_cc_95,'fs_cc_95': predict_fs_cc_95})


# In[1]:
if __name__ == '__main__':
    
    main()
