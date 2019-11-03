# CNN-brain-strains (Work in progress)
Convolutional neural network for efficient estimation of  regional brain strains

This page will be continually updated as needed. 
## Authors:
Shaoju Wu, Wei Zhao, Kianoosh Ghaz, and Songbai Ji
## Prerequisites
- System: MacOS/ Linux (e.g: Ubuntu 16.04)
- Matlab 2017 or above
- [Python 2.7](https://www.anaconda.com/distribution/)
- [Scikit-Learn](https://scikit-learn.org/stable/install.html)
- [Scipy](https://www.scipy.org/)
- [Keras 2.08](http://faroit.com/keras-docs/2.0.8/#installation)
- [Tensorflow 1.4.0](https://pypi.org/project/tensorflow/1.4.0/#files)
## Data preprocessing:
- Resampling the impact profile to 1 ms (temporal resolution) 
- (Optional) conjugate axis transform
- Shifting based on resultant peak location
- Replicated padding 

## Preprocessing demo:
We provide a data preprocessing demo in /Preprocessing folder.
- Go to /Preprocessing
- Run `demo_preprocessing.m` in Matlab

![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/preprocessing.png)

## Pretrained CNN models:
Three pretrained CNN neural network models are provided based on all of the brain response samples available in the published study (N=3069). They correspond to the peak maximum principal strain (MPS) of the whole brain (WB), MPS of the corpus callosum (CC), and fiber strain (FS) of the CC, all assessed at the 95th percentile levels. 

To use our pretrained CNN models for prediction, please check our strain prediction evaluation demo in /Strain_prediction folder
- Go to /Strain_prediction
- Run `python demo_evaluation.py`. 
- Input: Notice that this demo use `Evaluation_example.mat` as example input for evaluation. 
- Output: The output file will be saved as `Output.mat` in the /Strain_prediction folder.

## Quick Run:
If you just want to use your input profile to obtain the predicted brain strains from the CNN pretrained models 
- Go to /Strain_prediction
- Input: Store your input as `pad_profile` (Check our `demo_preprocessing.m` for detail) and save it as `Input.mat`
- Run `python predict_all.py`
- Output: The predicted outputs will be `mps_95` (MPS of WB), `mps_cc_95` (MPS of CC) and `fs_cc_95` (FS of CC) saved in `Output.mat`. 


## Additional Evaluations:
The accuracy of the trained CNN using real-world impacts is extensively reported in the published paper. Here, we further report the CNN-estimation accuracy using a separate, [idealized rotational impact dataset](https://link.springer.com/article/10.1007%2Fs10439-017-1888-3) (N=1521). This additional testing dataset is completely unseen by the trained CNN. The accuracy for MPS of the WB and CC in terms of coefficient of determination (R^2) and root mean squared error (RMSE) are shown below (dashed lines: +/- 1 RMSE):
![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/Testing_results.png)

When instead training the CNN using the idealized impacts (N=1521) with the same architecture, the resulting 10-fold cross-validation accuracy is shown below (virtually perfect performance).


## License:
CNN-brain-strains is an open-source library and is licensed under the [GNU General Public License (v3)](https://www.gnu.org/licenses/gpl-3.0.en.html). 
