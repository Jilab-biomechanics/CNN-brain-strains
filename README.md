# CNN-brain-strains
Convolutional neural network for efficient estimation of  regional brain strains
## Authors:
Shaoju Wu, Wei Zhao, Kianoosh Ghaz, and Songbai Ji
## Prerequisites
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

## Preprocessing example
![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/preprocessing.png)
