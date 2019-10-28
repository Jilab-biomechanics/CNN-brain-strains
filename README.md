# CNN-brain-strains (Work in progress)
Convolutional neural network for efficient estimation of  regional brain strains
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
- Conjugate axis transform
- Shifting based on resultant peak location
- Replicated padding 

## Preprocessing demo example:
![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/preprocessing.png)

## Pretrained models:
Three pretrained models based on 95th maximum principal strain of the whole brain (MPS of WB), 95th maximum principal strain of the corpus callosum(MPS of CC), and 95th peak strain of the corpus callosum (FS of CC) were trained using all impact-strain response samples available in this study (N=3069), respectively. 

## Evaluation:
The pretrained models were further evaluated based on the additional rotational velocity profiles derive from the [idealized impact dataset](https://link.springer.com/article/10.1007%2Fs10439-017-1888-3) (N=1521). The example testing results in terms of coefficient of determination (R^2) and root mean squared error (RMSE) are shown below:
![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/Testing_results.png)

## license:
CNN-brain-strains is an open-source library and is licensed under the [GNU General Public License (v3)](https://www.gnu.org/licenses/gpl-3.0.en.html). 
