function [peaks] = main(importedSpectrum,n)

peaks = cell(1,5);


peakData = extractPeak(importedSpectrum,n);
[B] = reallignBoundaries(compileBoundaries(importedSpectrum));


for i=1:n  
    centroidIndex = find(peakData{i,2} == max(peakData{i,2}));
    centroidE = peakData{i,1}(centroidIndex);
    newSet = {peakData{i,1},peakData{i,2},B(i,1),B(i,2),centroidE};
    peaks = [peaks;newSet];
end

peaks(1,:) = [];
end