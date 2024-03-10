function [densityOfArray] = densityFunction(inputArray,start,finish)

%Checking start and finish are valid incides for the array%
maxFinish = numel(inputArray);

if finish<= maxFinish && start> 0 && start<finish 
    densityCount = 0;

    %For each element of the array, if it is non zero, add one to the densityCount%

    for i=start:finish
        if inputArray(i) ~= 0
            densityCount = densityCount+1;
        end
    end

    %Total number of non-zero elements divided by the length of the array iterated through%

    densityOfArray = densityCount/(finish-start+1);

else
    densityOfArray = NaN;

end