function [avgG] = averageGrad(importedSpectrum)

[~,~,firstDifferenceUnclean] = deltaPeakPointIdentification(importedSpectrum);

avgG = sum(firstDifferenceUnclean)/numel(firstDifferenceUnclean);

end