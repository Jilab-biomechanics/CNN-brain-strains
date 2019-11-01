function v = ang2vec(theta, alpha)
% v = ang2vec(theta, alpha) used to calculate the vectors from azimuth and elevation angles. 
% note that 'theta' is nagative actual azimuth angle. Theta and alpha are
% in degrees.
%
% Author: Wei Zhao
%
%%
a = (cosd(alpha).*cosd(theta))';
b = (cosd(alpha).*sind(theta))';
c = sind(alpha)';
v = [a,b,c];

end