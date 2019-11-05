# CNN-brain-strains (Work in progress)
Convolutional neural network for efficient estimation of  regional brain strains [link to published Scientific Reports paper will be added]

This page will be continually updated as needed. 

## Authors:
Shaoju Wu, Wei Zhao, Kianoosh Ghaz, and Songbai Ji

### Disclaimer:
The data tool is provided AS IS and for non-commercial use only. Please use at your own risk as no responsibility is assumed or implied.

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
A data preprocessing demo is provided in /Preprocessing folder.
- Go to /Preprocessing
- Run `demo_preprocessing.m` in Matlab

![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/preprocessing.png)

## Pretrained CNN models:
Three pretrained CNN neural network models are provided based on all of the brain response samples available in the published study (N=3069). They correspond to the peak maximum principal strain (MPS) of the whole brain (WB), MPS of the corpus callosum (CC), and fiber strain (FS) of the CC, all assessed at the 95th percentile levels. 

## Strain Prediction demo:
To use the pretrained CNN models for strain estimation, please check the strain prediction evaluation demo in /Strain_prediction folder
- Go to /Strain_prediction
- Run `python demo_evaluation.py`. 
- **Input**: Notice that this demo uses `Evaluation_example.mat` as an example rotational velocity profile input for evaluation. 
- **Output**: The output file will be saved as `Output.mat` in the /Strain_prediction folder.

## Quick Run:
If you need to use your own rotational velocity input profile to estimate brain strains from the pretrained CNN models 
- Go to /Strain_prediction
- **Input**: Store your input as `pad_profile` (Check `demo_preprocessing.m` for detail) and save it as `Input.mat`
- Run `python predict_all.py`
- **Output**: The predicted outputs will be `mps_95` (MPS of WB), `mps_cc_95` (MPS of CC) and `fs_cc_95` (FS of CC) saved in `Output.mat`. 
- You can easily modify the programs to batch process.

## Citation:
Please cite the following studies for the model used (1 and 2) and the CNN data tool (3) if you apply in your study:

1. Zhao, W., Ji, S., 2019. White matter anisotropy for impact simulation and response sampling in traumatic brain injury. J. Neurotrauma 36, 250–263. doi:10.1089/neu.2018.5634
2. Ji, S., Zhao, W., Ford, J.C., Beckwith, J.G., Bolander, R.P., Greenwald, R.M., Flashman, L.A., Paulsen, K.D., McAllister, T.W., 2015. Group-wise evaluation and comparison of white matter fiber strain and maximum principal strain in sports-related concussion. J. Neurotrauma 32, 441–454. doi:10.1089/neu.2013.3268
3. Wu, S., Zhao, W., Ghazi, K., Ji, S. 2019. Convolutional neural network for efficient estimation of  regional brain strains. Scientific Reports (Accepeted). 

## Continual training:
We would appreciate it if you can send us sample head impact kinematics data so that: (1) to verify that the CNN-estimated strains are sufficiently accurate relative to the directly simulated counterparts for your data; and (2) to allow us expand the training dataset to further improve the CNN estimation accuracy.  

## Additional Evaluations:
The accuracy of the trained CNN using real-world impacts is extensively reported in the published paper. Here, we further report the CNN-estimation accuracy using a separate, [idealized rotational impact dataset](https://link.springer.com/article/10.1007%2Fs10439-017-1888-3) (N=1521). This additional testing dataset is completely unseen by the trained CNN. The accuracy for MPS of the WB and CC in terms of coefficient of determination (R^2) and root mean squared error (RMSE) are shown below (dashed lines: +/- 1 RMSE):
![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/Testing_results.png)

When instead training the CNN using the idealized impacts (N=1521) with the corresponding pretrained CNN models as initial weights for intialization, the resulting 10-fold cross-validation accuracy is shown below (virtually perfect performance).
![](https://github.com/Jilab-biomechanics/CNN-brain-strains/blob/master/figures/Testing_results_idealized_dataset.png)

### Acknowledgement
Funding is provided by the NIH Grant R01 NS092853 and the Ford University Research Program. The authors are grateful to the National Football League (NFL) Committee on Mild Traumatic Brain Injury (MTBI) and Biokinetics and Associates Ltd. for providing the reconstructed head impact data. They also thank Dr. David Camarillo at Stanford University and Dr. Adam Bartsch at Prevent Biometrics for sharing head impact data. The Titan X Pascal GPU used in this work was donated by the NVIDIA Corporation. 

### License:
CNN-brain-strains is an open-source library and is licensed under the [GNU General Public License (v3)](https://www.gnu.org/licenses/gpl-3.0.en.html). 
