function [boundaryMatrix] = compileBoundaries(importedSpectrum)       

minPeakWidth = 35; %Guess value, BREAKS WHEN YOU PUT IT OVER peakWidth(importedSpectrum)
    
%Setting the counter for the number of peaks identified   
j=1;  
%Setting an initial peak width greater than minPeakWidth by defenition
currentPeakWidth = peakWidth(importedSpectrum);
breakCatch = false;

%While the width of peaks being identified is greater than the minimum
%allowed peak width, identify the next peak and record the lower and upper
%boundary indices into the boundaryMatrix.
while currentPeakWidth>minPeakWidth && breakCatch == false

    %If finding the first peak, pass the original set Delta into the
    %function. 
    %Else pass the previous edited set calculated by modifyDelta into the
    %function.
    if j==1
        modDTemp = deltaPeakPointIdentification(importedSpectrum);
        [l_j,u_j,modD_j] = peakIdentificationCycle(importedSpectrum,modDTemp);
        boundaryMatrix(1,1) = l_j;
        boundaryMatrix(1,2) = u_j;
    else
        modDTemp = modD_j;
        [l_j,u_j,modD_j] = peakIdentificationCycle(importedSpectrum,modDTemp);
    
        if l_j == boundaryMatrix(j-1,1) && u_j == boundaryMatrix(j-1,2)
            breakCatch =true;
        else
            currentPeakWidth = u_j-l_j;
            boundaryMatrix(j,1) = l_j;
            boundaryMatrix(j,2) = u_j;
        end
    end    
    j=j+1;
    
end
end