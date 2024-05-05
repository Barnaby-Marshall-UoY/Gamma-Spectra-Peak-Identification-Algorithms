
%For 1st peak input delta as deltaPeakPointIdentification(importedSpectrum)%
function [] = plotWithNoPeak(importedSpectrum,delta)

    [E,C] = importData(importedSpectrum);
    E_1 = E;
    C_1 = C;
    [l,u,~] = peakIdentificationCycle(importedSpectrum,delta);
    [notInUse,peakPoints] = deltaPeakPointIdentification(importedSpectrum);
    for i=1:numel(peakPoints)
        E_2(i,1) = E(peakPoints(i,1));
        C_2(i,1) = C(peakPoints(i,1)); 
    end
    for i=l:u
        C(i) = 0;
    end

    plot(E_1,C_1,E,C,'r',E_2,C_2,'c*')

end