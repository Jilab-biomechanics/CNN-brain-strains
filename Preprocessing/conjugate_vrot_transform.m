  function [conjugate_profile] = conjugate_vrot_transform(profile )
  % Function transform the rotational profile to the profile with cojugate
  % rotational axis
  %
  % Input: profile = Rotational velocity with N*3, where N is the length 
  % of the profile, 3 is the three anatomical directions(X,Y,Z).
  %
  % Output: conjugate_profile =  Profile with conjugate axis and has the 
  % same size as the input profile.
  %  
  % Author: Shaoju Wu, 10/23/2019 

  % Initialization
  t_vrot_rotated = profile;
  t_vrot_rotated_all = profile;
  curRes_rotated = zeros(size(profile,1),1);
  rot_axis = zeros(1,3);
  
  % Compute the resultant profile
  curRes_rotated(:,1) = resultant_val(t_vrot_rotated);
  
  % Determine the peak location of the resultant profile
  [~, peak_loc] = max(abs(curRes_rotated(:,1)));
  
  % Compute the Elevation angle (alpha) and Azimuth angle (theta)
  rot_axis(1,:) = t_vrot_rotated(peak_loc,:)/norm(t_vrot_rotated(peak_loc,:));
  [theta, alpha] = vec2ang(rot_axis(1,:));

  
  rot_axis_conj = rot_axis;
  
  % flip curves (If needed)
  if theta<-90 || theta>90
     [ t_theta, t_alpha ] = conjugate_rotational_axis( theta, alpha );
     rot_axis_conj(1,:) = ang2vec(t_theta, t_alpha);
  end
  
  sv = rot_axis_conj./rot_axis;   
  t = t_vrot_rotated_all;
  tt = t.*sv(1,:);
  t_vrot_rotated_conj_all = tt;
 
  % Output the result
  conjugate_profile = t_vrot_rotated_conj_all;
  
  end