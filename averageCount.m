function [avgC] = averageCount(importedSpectrum)

[~,C] = importData(importedSpectrum);

avgC = sum(C)/numel(C);

end