

function [] = plotWithNoPeak(importedSpectrum)

    [E,C] = importData(importedSpectrum);
    [l,u,~] = peakIdentificationCycle(importedSpectrum,deltaPeakPointIdentification(importedSpectrum));

    for i=l:u
        C(i) = 0;
    end

    plot(E,C)

end