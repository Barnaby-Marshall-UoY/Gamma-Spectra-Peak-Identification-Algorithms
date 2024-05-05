%First iteration run importedSpectrum,deltaPeakPointIdentification(importedSpectrum),E,C where [E,C] =
%importData(importedSpectrum)
%After that run importedSpectrum,modD,modE,modC

function [modE,modC,modD] = modifyData(importedSpectrum,modD1,modE1,modC1)

[l,u,modD] = peakIdentificationCycle(importedSpectrum,modD1);
%[E,C] = importData(importedSpectrum);

modE = zeros(numel(modD),1);
modC = zeros(numel(modD),1);

width = u-l;
energyWidth = modE1(u)-modE1(l);

for i=1:l
    modE(i) = modE1(i);
    modC(i) = modC1(i);
end

for i=u:numel(modD)
    modE(i-width+1) = modE1(i)-energyWidth;
    modC(i-width+1) = modC1(i);
end

end

%ACCOUNT FOR THE ENERGY DIFFERENECE, calculuate 
% the energy between l and u, each energy channel value must have this value subtracted from it to get the right plot. 
% THIS DOESNT CHANGE THE PROCESS BECAUSE THE PROCESS ONLY USES THE DELTA ARRAY. THIS ONLY IS A PLOT FOR DEMONSTRATION%