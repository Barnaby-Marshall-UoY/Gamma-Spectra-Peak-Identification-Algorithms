function [lowerBound,upperBound] = revisedPeakWidth(importedSpectrum,initialLowerBound,initialUpperBound)

    delta = deltaPeakPointIdentification(importedSpectrum);
    initialDensity = densityFunction(delta,initialLowerBound,initialUpperBound);
    n=1; %Step size on increasing the peak width
    

    %Catch for nextPeak returning (0,0) which indicates the data left is
    %too short to search through
    if initialLowerBound == 0 && initialUpperBound == 0

        lowerBound = 0;
        upperBound = 0;
    else
        
        %Initial Test. Too big or too small?
         
        changeNeeded = false; %Is the initialPeakWidth already correct
        direction = 0; %0 means do nothing, 1 means increase peak width, 2 means decrease peak width

        %If the initialPeakWidth is too small%
        if initialDensity<=densityFunction(delta,initialLowerBound-n,initialUpperBound+n) && initialDensity>=densityFunction(delta,initialLowerBound+n,initialUpperBound-n)
            changeNeeded = true;
            direction = 1;
    
            %If the initialPeakWidth is too large%    
        elseif initialDensity<=densityFunction(delta,initialLowerBound+n,initialUpperBound-n) && initialDensity>=densityFunction(delta,initialLowerBound-n,initialUpperBound+n)
            changeNeeded = true;
            direction = 2;
        else
        
        end

    
        %Altering the bounds according to the above test.%
        if changeNeeded == false
            lowerBound = initialLowerBound;
            upperBound = initialUpperBound;
        else
            tempLB = initialLowerBound;
            tempUB = initialUpperBound;
            %Is the peak too small? If so increase the peak width until a maximum density value is obtained when scanning accross the peak%
            if direction == 1
                while densityFunction(delta,tempLB,tempUB)>=densityFunction(delta,tempLB+n,tempUB-n)
                    tempLB = tempLB-n;
                    tempUB = tempUB+n;
                end

                lowerBound = tempLB;
                upperBound = tempUB;    
        
            %Is the peak too large? If so decrease the peak width until a maximum density value is obtained when scanning accross the peak%
            elseif direction == 2

                while densityFunction(delta,tempLB,tempUB)>=densityFunction(delta,tempLB-n,tempUB+n)
                    tempLB = tempLB+n;
                    tempUB = tempUB-n;
                end

                lowerBound = tempLB;
                upperBound = tempUB;    

            else
            end
        
        end
    end
end
