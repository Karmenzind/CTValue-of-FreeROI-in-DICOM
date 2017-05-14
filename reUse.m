function [] = reUse(pos)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global maindir_after;
maindir_after = input('Please input the second dirpath\n(should be surrounded by single quotes):\n'); 
maindir_after = addBackSlash(maindir_after);
series_number = input(['Input series_number:\n'...
                        '(via 0020, 0011)\n']);
image_number = input(['Input image number:\n'...
                        '(via 0020, 0013)\n']);

   
                
global file_path_after;
global pix_spac_1st;
global pix_spac_after;

global read_res_after;
global h_proc_after;
global roi_pos_after;
global slope_after;
global intercept_after;
global roi_pos_after;
file_path_after = TraversalAndLocate(maindir_after, image_number, series_number);

[read_res_after, low, high,...
    slope_after, intercept_after] = applyWinParams(file_path_after);

dcm_info_after = dicominfo(file_path_after);
pix_spac_after = dcm_info_after.PixelSpacing;


roi_pos_after = pos * mean(pix_spac_1st) / mean(pix_spac_after);

% display
fig2 = figure;
fig2.Visible = 'off';
fig2.Name = 'Fig After';
fig2.NumberTitle  = 'off';
tmp_show = imshow(read_res_after, [low, high]);

set(fig2, 'unit', 'normalized', 'position', [0,0,1,1]);
% ROI freehand 

global h_poly;
h_poly = impoly(gca, roi_pos_after); 
h_poly.setVerticesDraggable(false)
pause on;
% reflect = uicontrol('style', 'pushbutton',...
%                         'parent', fig2,...
%                         'string', 'Reflect ROI',...
%                         'Position', [50, 600, 200, 90],...
%                         'callback', 'h_poly = impoly(gca, roi_pos_after); h_poly.setVerticesDraggable(false);');

start_draw = uicontrol('style', 'pushbutton',...
                        'parent', fig2,...
                        'string', 'Draw ROI',...
                        'Position', [50, 500, 200, 90],...
                        'callback', 'h_proc_after = imfreehand; roi_pos_after = getPosition(h_proc_after)');
show_SubPlot = uicontrol('style', 'pushbutton',...
                    'parent', fig2,...
                    'string', 'create SubPlot',...
                    'Position', [50, 400, 200, 90],...
                    'callback', '[x_data, y_data] = showSubPlot(h_proc_after);');                    
start_calc = uicontrol('style', 'pushbutton',...
                        'parent', fig2,...
                        'string', 'Calculate HU values',...
                        'Position', [50, 300, 200, 90],...
                        'callback', 'CalcHu(h_poly, read_res_after, slope_after, intercept_after, pix_spac_after);');
                    
% create_reuse = uicontrol('style', 'pushbutton',...
%                         'parent', fig2,...
%                         'string', 'reuse the position',...
%                         'Position', [50, 200, 200, 90],...
%                         'callback', 'reUse(1);');

% uicontrol(show_SubPlot);
% uicontrol(start_calc);


hText=impixelinfoval(gcf, tmp_show);
set(hText,'FontWeight', 'bold')
set(hText,'FontSize',10)
uicontrol(start_draw);


end