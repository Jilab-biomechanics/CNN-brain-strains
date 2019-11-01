function [ theta, alpha ] = vec2ang( v )
%   [ theta, alpha ] = vec2ang( v )
%   Function to convert a vector to its azimuth and elevation angles
%
%   Author: Wei Zhao, 04/20/2017
%%
theta = atan2d(v(:,2), v(:,1));
alpha = atan2d(v(:,3), sqrt(v(:,1).^2+v(:,2).^2));

end

