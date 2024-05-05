%Extracts the first n peaks identified

function [peakData] = extractPeak(importedSpectrum,n)

    %Import the data to extract, import the peak boundaries, create the
    %cells that will hold the peak energy data arrays and peak count data
    %arrays as elements
    
    [peakEnergy,peakCount] = importData(importedSpectrum);
    [M] = reallignBoundaries(compileBoundaries(importedSpectrum));
    peakData = cell(1,2);
    %peak_nEnergy = cell(numel(M)/2,1);
    %peak_nCount = cell(numel(M)/2,1);
    
    %Check that the nth peak exists. i.e. there is an nth element of the upperBounds array%

    if n<=numel(M)/2
        for i=1:n
            tempEnergy = zeros((M(i,2)-M(i,1)+1),1);
            tempCount = zeros((M(i,2)-M(i,1)+1),1);
        
        %Extracting the peak energy and count data between the upper and lower bound into peak_nEnergy and peak_nCount%
        for j=M(i,1):M(i,2)
            tempEnergy(j-M(i,1)+1) = peakEnergy(j);
            tempCount(j-M(i,1)+1) = peakCount(j);
        end

        newPeak = {tempEnergy,tempCount};
        peakData = [peakData;newPeak];
        
        end
    
    %Removing the first row of empty cells
    peakData(1,:) = [];

    %Else if you try and pull out too many peaks, returns NaN
    else
        peakData = NaN;

    end
end