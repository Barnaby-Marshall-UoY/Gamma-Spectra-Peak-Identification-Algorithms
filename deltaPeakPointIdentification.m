%A function "differenceSearch", used to run a difference search to scan for possible peak points within an imported spectra%
%Inputs: a .txt, .dat, .csv, .xls, .xlsb, .xlsm, .xltm, .xltx or .ods file.%
%Outputs: Outputs an array of linear gradients between adjcent points in the inputted data sets with magnitude above 
%the backgroundReductionCoefficent and the indices of these data points positions in the original data set.%
function [firstDiff,firstDifferenceIndices,firstDifferenceUnclean] = deltaPeakPointIdentification(importedSpectrum)

%Calling the importData function to read the energy channel values and count values from the spectrum%

[energyTable,countTable] = importData(importedSpectrum);


%Creating 1 dimensionsal arrays of length one less than the imported data%

countDifference = zeros(numel(countTable)-1,1);
energyDifference = zeros(numel(countTable)-1,1);
firstDifference = zeros(numel(countTable)-1,1);
firstDifferenceUnclean = zeros(numel(countTable)-1,1);

%Calculating the difference between neighborirng values in each imported array%
%Ammending these values into the arrays created above%

for i=1:(numel(countTable)-1)
    countDifference(i,1) = (countTable(i+1,1) - countTable(i,1));
    energyDifference(i,1) = (energyTable(i+1,1) - energyTable(i,1));
end

%Ammending the firstDifference array with the gradient estimations%

firstDifference = countDifference./energyDifference;
firstDifferenceUnclean = countDifference./energyDifference;

%Cleaning firstDifference data, removing all data points with magnitude bellow the backgroundReductionCoefficent%

for k=1:numel(firstDifference)
    if abs(firstDifference(k,1))<backgroundReductionCoefficent(importedSpectrum)
        firstDifference(k,1) = 0;
    end
end

%The two outputs are the cleaned firstDifference array and the indices of non-zero firstDifference values, i.e. the indices 
%of peak points%

firstDiff = firstDifference;
firstDifferenceIndices = find(firstDifference);

end
