%Generates an array with the arrays non-zero density from the arrays start to each possible finish point with a requirment that the 
% minimum distance between the start and finish points is minFinish. 
% This is to stop inflated densities for finish points close to the beginning of the array.

function [densityArray] = densityFunctionLoop_v2(importedSpectrum)

FirstDifference = differenceSearch_feb(importedSpectrum);

lengthOfArray = numel(FirstDifference);

%densityArray is an array of zeros with length equal to the number of possible peak sets in the array that have width d%

densityArray = zeros(lengthOfArray-peakWidth(importedSpectrum),1);

%NOTE ON DOWNSIDE, DOENST SCAN VARIATIONS ON THE VERY END OF THE DATA, SO IF A PEAK WAS AT THE VERY VERY END THIS WOULDNT BE THAT EFFECTIVE%

%For each start point the densityArray has its next value ammended to the density of the array between the the indices startPoint and startPoint+d%

for i=1:lengthOfArray-peakWidth(importedSpectrum)
    densityArray(i) = densityFunction(FirstDifference,i,i+peakWidth(importedSpectrum));
end

end