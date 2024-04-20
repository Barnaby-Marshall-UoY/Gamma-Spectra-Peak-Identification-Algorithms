function [l,u,modDelta] = peakIdentificationCycle(importedSpectrum,modifiedDelta) 

[iLB,iUB,prevModDelta] = nextPeak(importedSpectrum,modifiedDelta);

[l,u] = revisedPeakWidth(importedSpectrum,iLB,iUB);

[modDelta] = modifyDelta(l,u,prevModDelta);

%Extract Peak betwen l and u%

%plot the spectrum without the peak, so plot importData for 1:l and u:numel(C)%

end