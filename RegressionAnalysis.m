close all;
clear all;
clc;

fileName = 'Conformed_Data.xlsx';
sheetName = 'Transformed_Data';
xlRange = 'A2:AM2211';
[num, txt, dataset] = xlsread(fileName, sheetName, xlRange);

% dataset = csvread('diffData.csv');

x = transpose(dataset(:,34));
y = transpose(dataset(:,11));
p = polyfit(x, y, 4);

x1 = dataset(:,34);
y1 = polyval(p,x1);
figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

