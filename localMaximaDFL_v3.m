function [lowerBoundaries, upperBoundaries] = localMaximaDFL_v3(importedSpectrum)


[~,C] = importData(importedSpectrum);
densityArray = densityFunctionLoop_v2(importedSpectrum);

currentCentroid = zeros(3,1);
currentUpperBoundaryIndices = zeros(3,1);
currentLowerBoundaryIndices = zeros(3,1);

%Needs extending out to over the whole data set not just the first 3*peakWidth points%

for j=1:3
    currentPeakWidth = j*peakWidth(importedSpectrum);
    currentPeakZone = zeros(currentPeakWidth,1);
    
    %ONLY OVER THE CURRENT PEAK REGION%

    for i=currentPeakWidth-peakWidth(importedSpectrum)+1:currentPeakWidth
        currentPeakZone(i-currentPeakWidth+peakWidth(importedSpectrum)) = densityArray(i);
    end

   
    tempCurrentLowerBoundaryIndices = find(currentPeakZone == max(currentPeakZone));
    currentLowerBoundaryIndex = tempCurrentLowerBoundaryIndices(1);
    currentLowerBoundaryIndices(j) = currentLowerBoundaryIndex;
    currentUpperBoundaryIndices(j) = currentLowerBoundaryIndex+currentPeakWidth;
    currentUpperBoundaryIndex = currentUpperBoundaryIndices(j);
    
    currentPeakCountData = zeros(currentPeakWidth,1);
    for k=currentLowerBoundaryIndex:currentUpperBoundaryIndex
        currentPeakCountData(k-currentLowerBoundaryIndex+1) = C(k);
    end
    
    currentCentroid(j) = max(currentPeakCountData);

end


lowerBoundaries = currentLowerBoundaryIndices;
upperBoundaries = currentUpperBoundaryIndices;

%Identifying upper boundaries that do not realte to an actual peak and are a result of scanning further into the background data past the peak%
%Removes the upper boundaries for any region that has less peak points (identified by the differenceSearch function) than the last%

for l=1:numel(currentUpperBoundaryIndices)-1
    if l==1
        if densityFunction(differenceSearch_feb(importedSpectrum),1,upperBoundaries(1))> densityFunction(differenceSearch_feb(importedSpectrum),upperBoundaries(1),upperBoundaries(2))
            upperBoundaries(2) = 1; %THIS IS SETTING TO NULL. 1 IS USED AS ITS THE FIRST ELEMENT OF THE ARRAY%
            lowerBoundaries(2) = 1;
        else
            
        end
    else
        if densityFunction(differenceSearch_feb(importedSpectrum),upperBoundaries(l-1),upperBoundaries(l))>densityFunction(differenceSearch_feb(importedSpectrum),upperBoundaries(l),upperBoundaries(l+1))
            upperBoundaries(l+1) = 1;
            lowerBoundaries(l+1) = 1;
        else
           
        end
    end
end

%Recreating the upperBoundaries array to NOT include the unesscassary boundaries identified above.%

upperBoundariesIndex = find(upperBoundaries ~= 1);
tempUpperBoundaries = zeros(numel(upperBoundariesIndex),1);
for m=1:numel(upperBoundariesIndex)
    tempUpperBoundaries(m) = upperBoundaries(upperBoundariesIndex(m));
end
upperBoundaries = zeros(numel(upperBoundariesIndex),1);
for n=1:numel(upperBoundariesIndex)
    upperBoundaries(n) = tempUpperBoundaries(n);
end

end
