close all,
clear all,
clc;

fileName = 'Conformed_Data.xlsx';
sheetName = 'Transformed_Data';
xlRange = 'A2:AM2211';
[num, txt, raw_data] = xlsread(fileName, sheetName, xlRange);

[uniqueProducts, x_uniqueProducts] = unique(raw_data(:,1), 'first');
x_uniqueProducts = sort(x_uniqueProducts);

rawAttributes = cell2mat(raw_data(:,4:39));
diffVector = zeros(size(rawAttributes));
for uniqueProductsCount = 1:1:(size(x_uniqueProducts, 1)-1)
    diffVector = diff(rawAttributes(x_uniqueProducts(uniqueProductsCount):1:x_uniqueProducts(uniqueProductsCount+1)-1, :));
    dlmwrite('temp.csv',diffVector,'delimiter',',','-append');
end

[num, txt, diffVector] = xlsread('temp.csv');
diffVector = cell2mat(diffVector(:,:));
labelledDiffVector = horzcat(diffVector(1:end,1:12-1),diffVector(1:end,13+1:end));

for i = 1:1:size(labelledDiffVector,1)
    if diffVector(i,9) > 0
        labelledUnitsVector(i,1) = 1;
    else
        labelledUnitsVector(i,1) = 0;
    end
end

for i = 1:1:size(labelledDiffVector,1)
    if diffVector(i,10) > 0
        labelledVolumesVector(i,1) = 1;
    else
        labelledVolumesVector(i,1) = 0;
    end
end

for i = 1:1:size(labelledDiffVector,1)
    if diffVector(i,9) > 0
        labelledUnitsVector_char(i,1) = 'y';
    else
        labelledUnitsVector_char(i,1) = 'n';
    end
end

for i = 1:1:size(labelledDiffVector,1)
    if diffVector(i,10) > 0
        labelledVolumesVector_char(i,1) = 'y';
    else
        labelledVolumesVector_char(i,1) = 'n';
    end
end

% units = labelledDiffVector(1:end,1:36-1);
% volume = horzcat(labelledDiffVector(1:end,1:35-1),labelledDiffVector(1:end,35+1:end));
% 
% dlmwrite('units.csv',units,'delimiter',';');
% dlmwrite('volume.csv',volume,'delimiter',';');

dlmwrite('diffData.csv', labelledDiffVector, 'delimiter',';');
dlmwrite('unitsLabel.csv', labelledUnitsVector, 'delimiter',';');
dlmwrite('volumesLabel.csv', labelledVolumesVector, 'delimiter',';');


