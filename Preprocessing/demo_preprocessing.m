% Demo of data preprocessing for rotational velocity (Rot. Vel.) profile
% using conjugate axis transformation, peak shifting and replicated padding   
%  
% Example input profile: 101*3, where 101 is the temporal length of the 
% profile(from 0 to 100 ms, 1 sample per ms),3 is the time-varying velocity 
% components along the three (X,Y,Z) anatomical directions.
% 
% pad_profile (Output): N*3*201, where N is the number of input profiles,3
% is the time-varying velocity components along the three (X,Y,Z)anatomical 
% directions, 201 is the temporal length for CNN training/testing. 
%
% Notice: The Input profile temporal resolution must be 1 ms and the 
% temporal length should not longer than 100 ms (101 points).
%
% see also: 
% https://github.com/Jilab-biomechanics/CNN-brain-strains
%
% Author: Shaoju Wu, 10/23/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Cleanup
clc;
close all;
clear all;

%% 1) Loading the input rotational velocity profile
load(['profile']);

%% Visualize input profile
figure,plot(profile(:,1),'r', 'linewidth', 3);
hold on;
plot(profile(:,2),'g', 'linewidth', 3);
plot(profile(:,3),'b', 'linewidth', 3); 
res_profile = resultant_val(profile);
plot(res_profile,'k', 'linewidth', 3); 
legend('X', 'Y', 'Z', 'Res');
xlim([0 100])
xlabel('Time (ms)');
ylabel('Rot. Vel. (rad/s)');
title('Input profile')
h = gca;
h.FontName = 'arial';
h.FontSize = 15;
h.LineWidth = 1;
hold off;

%% 2) Conjugate axis transformation 
conjugate_profile_example = conjugate_vrot_transform(profile);

%% Visualize the profile with conjugate axis
figure,plot(conjugate_profile_example(:,1),'r', 'linewidth', 3);
hold on;
plot(conjugate_profile_example(:,2),'g', 'linewidth', 3);
plot(conjugate_profile_example(:,3),'b', 'linewidth', 3); 
res_profile = resultant_val(conjugate_profile_example);
plot(res_profile,'k', 'linewidth', 3); 
legend('X', 'Y', 'Z', 'Res');
xlim([0 100])
xlabel('Time (ms)');
ylabel('Rot. Vel. (rad/s)');
title('Profile with conjugate axis')
h = gca;
h.FontName = 'arial';
h.FontSize = 15;
h.LineWidth = 1;
hold off;

%% 3) Profile Shifting and padding 
Padded_length = 201;
Pad_curves = Shifting_padding_profile(conjugate_profile_example, Padded_length);

%% Visualize the padded profile
figure,plot(Pad_curves(:,1),'r', 'linewidth', 3);
hold on;
plot(Pad_curves(:,2),'g', 'linewidth', 3);
plot(Pad_curves(:,3),'b', 'linewidth', 3); 
res_profile = resultant_val(Pad_curves);
plot(res_profile,'k', 'linewidth', 3); 
legend('X', 'Y', 'Z', 'Res');
xlim([0 200])
xlabel('Time (ms)');
ylabel('Rot. Vel. (rad/s)');
title('Padded profile')
h = gca;
h.FontName = 'arial';
h.FontSize = 15;
h.LineWidth = 1;
hold off;

%% 4) Reshape the profile (N*3*201) for CNN training
N = 1;
pad_profile = reshape(Pad_curves, [N, 201, 3]);
pad_profile = permute(pad_profile,[1 3 2]);

%% Note:
% The variable "pad_profile" is now ready to be used as a testing case 
% in the deep learning framework.

