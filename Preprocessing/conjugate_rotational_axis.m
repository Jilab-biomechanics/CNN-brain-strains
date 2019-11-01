function [ theta_new, alpha_new ] = conjugate_rotational_axis( theta, alpha )
% function [ theta_new, alpha_new ] = conjugate_rotational_axis( theta, alpha );
%   
% Function to return the conjugate rotational axis so that it produces a
% mirroring brain response about the mid-sagittal plane. Given theta and
% alpha are azimuth and elevation angles in degrees.
% 
% Author: Songbai Ji, 4/13/2014.

I = find(theta>=0); 
theta_new(I) = 180 - theta(I);

I = find(theta<0); 
theta_new(I) = - 180 - theta(I);

alpha_new = - alpha;


end

