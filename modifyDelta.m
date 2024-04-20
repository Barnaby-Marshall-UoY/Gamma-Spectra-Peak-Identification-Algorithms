%prevModDelta = the previous modified delta used, i.e. whats left of the spectrum%

function [modifiedDelta] = modifyDelta(peakLB,peakUB,prevModDelta)


    %Taking in whats left of the spectrum from previous iterations as the
    %input to modify
    modifiedDelta = zeros(numel(prevModDelta)-peakUB+peakLB-1,1);

    %Remapping the delta spectrum to the output modifiedDelta excluding the entries between the peak bounds%

    for j=1:peakLB-1
        modifiedDelta(j) = prevModDelta(j);
    end

    for j=peakUB:numel(prevModDelta)
        modifiedDelta(j-peakUB+peakLB+1) = prevModDelta(j);
    end



end