function [l,u,modDelta] = peakIdentificationCycle(importedSpectrum,modifiedDelta) 

[iLB,iUB,prevModDelta] = nextPeak(importedSpectrum,modifiedDelta);

[l,u] = revisedPeakWidth(importedSpectrum,iLB,iUB);

[modDelta] = modifyDelta(l,u,prevModDelta);

end