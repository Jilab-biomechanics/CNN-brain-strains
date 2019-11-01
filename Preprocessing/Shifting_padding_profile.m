function [Pad_curves] = Shifting_padding_profile(profile, length_times)
    %
    % Function shifting the profile to the padded profile center based on  
    % the resultant peak location and padding profile with replicated 
    % padding method (along the temporal borders).
    %
    % Input:  profile = profile with x,y,z three anatomical directions
    %         length_times = length of the profile
    %
    % Output: Pad_curves = padded profiles
    %
    % Note that "center_loc = 101" corresponds to 100 ms (on line 26)
    % length of 201 points. Please check the following website. 
    % https://github.com/Jilab-biomechanics/CNN-brain-strains
    %
    % Author: Shaoju Wu 10/24/2019
    %% Determine the shifting location
    curRes_rotated = zeros(size(profile,1),1);
    % Compute the resultant profile
    curRes_rotated(:,1) = resultant_val(profile);
    shift_curves = zeros(length_times, 3);
    [Input_length,Channel] = size(profile);
    
    % Determine the peak location of the resultant profile
    [~, peak_loc] = max(abs(curRes_rotated(:,1)));
    center_loc = 101; 
    shift_step = center_loc - peak_loc;
    % Determine whether the padded profile is out of the require time
    % length (200 ms). 
    
    if(shift_step<0)
        error('Error. \the input profile is too long')
    end
    Left_loc = Input_length+shift_step;
    
    %% shift the input profile and pad the profile with replicated padding
    for i = 1:Channel
        
        shift_curves((1+shift_step):(Left_loc),i) = profile(:,i);
        shift_curves(1:shift_step,i) = profile(1,i)*ones(shift_step,1);
        shift_curves(Left_loc:end,i) = profile(end,i)*ones(1+length_times-Left_loc,1);
        
    end
        
    Pad_curves = shift_curves;
          
end