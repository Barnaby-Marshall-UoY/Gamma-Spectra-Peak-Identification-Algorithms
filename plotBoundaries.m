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

%Catch (l,u) = (0,0)%
%Will just plot loads of boundaries at the start of the array at (1,1)
for k=1:(numel(B)/2)
    if BtoPlot(k,1) ==0 && BtoPlot(k+numel(B)/2,1) ==0
        BtoPlot(k,1) =1;
        BtoPlot(k+numel(B)/2,1) =1;
    else
    end
end

for j=1:numel(BtoPlot)
    bE(j) = E(BtoPlot(j));
    bC(j) = C(BtoPlot(j));
end



plot(E,C,bE,bC,'r*');

end