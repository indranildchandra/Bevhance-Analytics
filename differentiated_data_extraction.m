close all,
clear all,
clc;

filename = 'Conformed_Data.xlsx';
sheetname = 'Transformed_Data';
[num, txt, raw_data] = xlsread(filename, sheetname);

% Attributes ---
% 'Product','ABI/Competitor','Conformed Date',
% 'Display Count','Display Share','Distribution (%)',
% 'Feature Count','Feature Share',
% 'Price per Unit','Price per Volume','Unit Sales','Volume Sales','Volume Share of Category',
% ' Average of Max TemperatureC ',' Average of Min TemperatureC ',
% ' Average of Dew PointC ',' Average of MeanDew PointC ',
% ' Average of Max Humidity ',' Average of  Min Humidity ',
% ' Average of  Max Sea Level PressurehPa',' Average of  Min Sea Level PressurehPa',' 
% Average of  Max VisibilityKm ',' Average of  Min VisibilitykM ',
% ' Average of  Max Wind SpeedKm/h ',' Average of  Max Gust SpeedKm/h ',
% ' Average of Precipitationmm ',' Average of  CloudCover ',
% ' Average of WindDirDegrees ',' State GDP(Millions of dollars, seasonally adjusted at annual rates.) ',' Alcohol Retail Trade employees (in 1000s, State) ','State Personal income (thousands of dollars, seasonally adjusted,quarterly)','Occupancy (%) ','Labor Force in city','Employment in city','Unemployment in city','Unemp. Rate in city','Consumer Price Index, Malt Beverages','Consumer Price Index, Wine','Producer Price Index by Industry'

differentiated_data = zeros(size(raw_data, 1), size(raw_data, 2)-4);
% differentiated_data(1,1:size(raw_data, 2)-4) = 0;
prev_product = raw_data(2, 1);
prev_vector = cell2mat(raw_data(2, 4:size(raw_data, 2)));
for row=3:1:size(raw_data, 1)
        curr_product = raw_data(row, 2);
        curr_vector = cell2mat(raw_data(row, 4:size(raw_data, 2)));
        vector_row_size = row-2;
        vector_column_size = size(raw_data, 2)-4;
        if strcmp(prev_product, curr_product)
            differentiated_data(vector_row_size,1:vector_column_size) = curr_vector(1,1:vector_column_size) - prev_vector(1,1:vector_column_size);
        else
            differentiated_data(vector_row_size,1:vector_column_size) = 0;
        end
        prev_product = curr_product;
        prev_vector = curr_vector;
end

kpi_vector = zeros(size(raw_data, 1), 2);
for kpi_column = 12:1:13
    for kpi_row = 1:1:(size(raw_data, 1)-1)
        if differentiated_data(kpi_row+1, kpi_column) > 0
            kpi_vector(kpi_row, kpi_column-11) = 1;
        else
            kpi_vector(kpi_row, kpi_column-11) = 0;
        end
    end
end 

id3_input_data = zeros(size(raw_data, 1)-1, size(raw_data, 2)-3);
for id3_row = 2:1:size(raw_data, 1)
    for id3_col = 2:1:size(raw_data, 1)
        
    end
end