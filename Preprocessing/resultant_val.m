function res_val = resultant_val( val )
%function res_val = resultant_val( val )
%   This function calculates the resultant temporal values
% val should be N-by-3 or N-by-4. The first column is time and others are velocity or
% acceleration etc.
%
% Author: Wei Zhao, 01/20/2016
%%
if size(val,2) == 3
    res_val = sqrt(val(:,1).^2+val(:,2).^2+val(:,3).^2);
else
    res_val (:,1) = val(:,1);
    res_val(:,2) = sqrt(val(:,2).^2+val(:,3).^2+val(:,4).^2);
end

