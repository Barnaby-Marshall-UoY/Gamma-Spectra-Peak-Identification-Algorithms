%Generates an array with the input arrays non-zero density from start point
%index s to the index s+minPeakWidth for each starting index from s to f.


function [densityArray] = densityFunctionLoop_v3(importedSpectrum,s,f)

FirstDifference = differenceSearch_feb(importedSpectrum);
minPeakWidth =peakWidth(importedSpectrum);

%densityArray is an array of zeros with length equal to the distance between the inputted start and finish points s and f%

densityArray = zeros(f-s,1);

%For each start point, i, the densityArray has its next value ammended to the density of the array between the the indices i 
%and i+minPeakWidth%

for i=s:f
    densityArray(i-s+1) = densityFunction(FirstDifference,i,i+minPeakWidth);
end

end

