%Using an estimated initial peak width, the nextPeak function scans over the delta first difference array of the inputed%

%modifiedDelta must be deltaPeakPointIdentification(importedSpectrum) %

function [initialLowerBound, initialUpperBound, modifiedDeltaOut] = nextPeak(importedSpectrum, modifiedDelta)


    initialPeakWidth = peakWidth(importedSpectrum);

    
    densityArray = zeros(numel(modifiedDelta)-initialPeakWidth,1);
        
    for i=1:numel(modifiedDelta)-initialPeakWidth   
        densityArray(i) = densityFunction(modifiedDelta,i,i+initialPeakWidth);
    end
    
    tempInitialLowerBound = find(densityArray == max(densityArray));
    initialLowerBound = tempInitialLowerBound(1);
    initialUpperBound = initialLowerBound + initialPeakWidth;
        
    %re outputting the input modifiedDelta to be used as the array input for the modifyDelta function. i.e. whats left of the spectrum%

    modifiedDeltaOut = zeros(numel(modifiedDelta),1);
    for j=1:numel(modifiedDelta)       
        modifiedDeltaOut(j) = modifiedDelta(j);
    end

end

