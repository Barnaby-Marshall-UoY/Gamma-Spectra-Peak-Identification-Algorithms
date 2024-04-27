
function [dataToPlot, dataPlot] = plotData(importedSpectrum)

%Imports all data in the first two columns of a .csv file using the
%importData function.
%Outputs a plot of the data

[energyToPlot,countToPlot] = importData(importedSpectrum);

dataPlot = plot(energyToPlot,countToPlot);
title(importedSpectrum)
ylabel("Count")
xlabel("Energy Channel Values [KeV]")

end

