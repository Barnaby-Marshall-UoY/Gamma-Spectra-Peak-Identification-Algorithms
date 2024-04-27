function [boundaryMatrix] = compileBoundaries(importedSpectrum)       

minPeakWidth = 35; %Guess value, FOR SOME REASON IT BREAKS ONCE YOU PUT IT LOWER THAN 35
    
%Setting the counter for the number of peaks identified   
j=1;  
%Setting an initial peak width greater than minPeakWidth by defenition
currentPeakWidth = peakWidth(importedSpectrum);

%While the width of peaks being identified is greater than the minimum
%allowed peak width, identify the next peak and record the lower and upper
%boundary indices into the boundaryMatrix.
while currentPeakWidth>minPeakWidth

    %If finding the first peak, pass the original set Delta into the
    %function. 
    %Else pass the previous edited set calculated by modifyDelta into the
    %function.
    if j==1
        modDTemp = deltaPeakPointIdentification(importedSpectrum);
    else
        modDTemp = modD_j;
    end    

    [l_j,u_j,modD_j] = peakIdentificationCycle(importedSpectrum,modDTemp);
    currentPeakWidth = u_j-l_j;
    boundaryMatrix(j,1) = l_j;
    boundaryMatrix(j,2) = u_j;
 
    j=j+1;

end
end