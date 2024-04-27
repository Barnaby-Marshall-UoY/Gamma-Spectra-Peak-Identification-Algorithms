%Peak Width is estimated as 20 peaks per spectrum.%

function [width] = peakWidth(importedSpectrum)


[~,C] = importData(importedSpectrum);
width = round(numel(C)/20);

end