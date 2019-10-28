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

## Preprocessing demo example:
![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/preprocessing.png)

## Pretrained models models:
Three pretrained models based on 95th maximum principal strain of the whole brain (MPS of WB), 95th maximum principal strain of the corpus callosum(MPS of CC), and 95th peak strain of the corpus callosum (FS of CC) were trained using all impact-strain response samples available in this study (N=3069), respectively. 

## Evaluation
The pretrained models further were evaluated based on the rotational velocity profiles derive from the [idealized impact dataset](https://www.ncbi.nlm.nih.gov/pubmed/28710533) (N=1521). The example testing results in terms of coefficient of determination (R^2) and root mean squared error (RMSE) are shown below:
![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/Testing_results.png)
