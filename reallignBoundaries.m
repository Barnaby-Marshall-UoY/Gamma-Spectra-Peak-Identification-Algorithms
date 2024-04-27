%Corrects the indices of the boundaries by recounting any data with lower
%indices than the lower boundary that has been removed by finding a
%previous peak

function [correctedBoundaryMatrix] = reallignBoundaries(boundaryMatrix)

%creating the correctedBoundaryMatrix with equal dimensions to the inputted
%boundaryMatrix

correctedBoundaryMatrix = zeros(numel(boundaryMatrix)/2,2);

%Setting the first peak to be the same as it needs no correction

correctedBoundaryMatrix(1,1) = boundaryMatrix(1,1);
correctedBoundaryMatrix(1,2) = boundaryMatrix(1,2);

%starting at the second peak (as the first one doesnt need correction)
%calculate the correction. i.e. how many data points have been removed
%bellow the boundary so far in the search, then add them back on.

for j=2:(numel(boundaryMatrix)/2)

    correction = 0;

    for i=1:(j-1)
        if boundaryMatrix(i,1) <= boundaryMatrix(j,1)
            correction = correction + (boundaryMatrix(i,2) - boundaryMatrix(i,1));
        else
        end
    end

    %writing the corrected boundaries to the output matrix

    correctedBoundaryMatrix(j,1) = boundaryMatrix(j,1) + correction;
    correctedBoundaryMatrix(j,2) = boundaryMatrix(j,2) + correction;

end

end