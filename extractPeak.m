function [peak_nEnergy,peak_nCount] = extractPeak(importedSpectrum,n)

    [lowerBounds,upperBounds] = localMaximaDFL_v3(importedSpectrum);
    [peakEnergy,peakCount] = importData(importedSpectrum);
    %Check that the nth peak exists. i.e. there is an nth element of the upperBounds array%

    if n<=numel(upperBounds)
        if n==1
            upperPeakBound = upperBounds(1);
            lowerPeakBound = 1; 
        else
            upperPeakBound = upperBounds(n);
            lowerPeakBound = upperBounds(n-1); 
        end
        peak_nEnergy = zeros((upperPeakBound-lowerPeakBound+1),1);
        peak_nCount = zeros((upperPeakBound-lowerPeakBound+1),1);
        
        %Extracting the peak energy and count data between the upper and lower bound into peak_nEnergy and peak_nCount%
        for i=lowerPeakBound:upperPeakBound
            peak_nEnergy(i-lowerPeakBound+1) = peakEnergy(i);
            peak_nCount(i-lowerPeakBound+1) = peakCount(i);
        end
    else
        peak_nEnergy = NaN;
        peak_nCount = NaN;

    end
end