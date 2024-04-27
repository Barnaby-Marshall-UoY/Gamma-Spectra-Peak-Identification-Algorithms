function [] = plotBoundaries(importedSpectrum)


[E,C] = importData(importedSpectrum);
[M] = compileBoundaries(importedSpectrum);
[B] = reallignBoundaries(M);

BtoPlot = zeros(numel(B),1);
bE = zeros(numel(B),1);
bC = zeros(numel(B),1);

for i=1:(numel(B)/2)
    BtoPlot(i) = B(i,1);
    BtoPlot(i+numel(B)/2) = B(i,2);
end


for j=1:numel(BtoPlot)
    bE(j) = E(BtoPlot(j));
    bC(j) = C(BtoPlot(j));
end

plot(E,C,bE,bC,'r*');

end