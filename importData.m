
%Imports all data in the first two columns of a .txt, .dat, .csv, .xls, .xlsb, .xlsm, .xltm, .xltx or .ods file
%Outputs two 1 x n arrays containng the first and second columns of the the imported data respectively.  

function [ECV,C] = importData(importedSpectrum) 

[ECV,C] = readvars(importedSpectrum);

end