clc
clear
close all

maindir_1st = input('Pleace input the first dirpath\n(should be surrounded by single quotes):\n'); % 把地址写到这一行
maindir_1st = addBackSlash(maindir_1st);

global maindir_after;

global file_path_1st;
global file_path_after;

global pix_spac_1st;
global pix_spac_after;


global read_res_1st;
global read_res_after;
global h_proc_1st;
global h_proc_after;

global slope_1st;
global intercept_1st;
global slope_after;
global intercept_after;

global roi_pos_1st;
global roi_pos_after;

global h_proc_1st;
global h_proc_after;

global dcm_info_1st;

global h_poly; 

% input target info
% series number: 
% image number: '0020','0013'  
series_number = input(['Input series_number:\n'...
                        '(via 0020, 0011)\n']);
image_number = input(['Input image number:\n'...
                        '(via 0020, 0013)\n']);

% locate
if isnumeric(image_number) && isnumeric(series_number)
    file_path_1st = TraversalAndLocate(maindir_1st, image_number, series_number);
else
    file_path_1st = 'C:\\Users\\Karmenzind\\Desktop\\TEMPfordicom\\615\\CC63FD1B67034EA499E330550B264E';
end

read_res_1st = dicomread(file_path_1st);
dcm_info_1st = dicominfo(file_path_1st);
slope_1st = dcm_info_1st.RescaleSlope;
intercept_1st = dcm_info_1st.RescaleIntercept;
pix_spac_1st = dcm_info_1st.PixelSpacing;


figCorela(file_path_1st);


% fprintf('Hounsfield Unit value is: \n');
% fetch pos and convert pixel value to grayscale
% caculate Hounsfield Unit value

% Hounsfield units = m*SV+b

% record