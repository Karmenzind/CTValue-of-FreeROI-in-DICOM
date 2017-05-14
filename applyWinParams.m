function [read_res, ...
    lowest_visible_value, ...
    highest_visible_value,...
    dcm_rescale_slope,...
    dcm_rescale_intercept] = applyWinParams(file_path)

% Find and display via win information
% Load a DICOM file and apply slope and intecept 

read_res = dicomread(file_path);
dcm_info = dicominfo(file_path);

modif = input('Resize WindowCenter and WindowWidth? 1/0\n');
if isequal(modif, 1)
    origin_center = input('Input WindowCenter:\n');
    origin_width = input('Input WindowWidth:\n');
else
    origin_center = dcm_info.WindowCenter;
    origin_width = dcm_info.WindowWidth;
end
dcm_rescale_slope = dcm_info.RescaleSlope;
dcm_rescale_intercept = dcm_info.RescaleIntercept;

% Refer:  When loading images using Matlab, it does not honor the RescaleSlope and RescaleIntercept tags. 
% Your data in Matlab will always be positive. 
% ITK honors these flags and the images will have negative values (indicating a density less than water). 

center = origin_center / dcm_rescale_slope - dcm_rescale_intercept; 
width = origin_width / dcm_rescale_slope - dcm_rescale_intercept;

% Header = dicominfo ( fn ); 
% Image = Header.RescaleSlope * double ( dicomread ( Header ) ) + Header.RescaleIntercept

lowest_visible_value  = center - (width / 2);
highest_visible_value  = center + (width / 2);
