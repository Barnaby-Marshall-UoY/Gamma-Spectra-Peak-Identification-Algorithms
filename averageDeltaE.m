function [avg] = averageDeltaE(energy)
    diff = zeros(numel(energy)-1,1);
    for i=1:numel(energy)-1
        diff(i) = energy(i+1)-energy(i);
    end
    avg = sum(diff)/numel(energy);
end