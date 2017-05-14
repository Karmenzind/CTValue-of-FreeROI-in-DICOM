function [] = CalcHu(h_proc, data_set, rescale_slope, rescale_intercept, pix_spac)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


% h = h_proc; % Draw your doodle here
% hc = get(h,'Children');
% x_data = []; y_data = [];
% for ii=1:length(hc)
%   x = get(hc(ii),'XData');
%   y = get(hc(ii),'YData');
%   x_data = [x_data; x(:)];
%   y_data = [y_data; y(:)];
% end
% pos = getPosition(h_proc);
mask = h_proc.createMask();
[y_data, x_data] = find(mask);

% reuse_pos = [x_data, y_data];

res = 0;
m = 0;
res = [];
global pix_spac_1st;
for idx = 1: length(x_data)
    tmp_x = round(x_data(idx));
    tmp_y = round(y_data(idx));
    fprintf('Current pix info: (%d, %d)\n', tmp_x, tmp_y);
    cur_pix_val = data_set(tmp_y, tmp_x);
    fprintf('current pix_val: %d\n', cur_pix_val);
    tmp_hu = cur_pix_val * rescale_slope + rescale_intercept;
    res = [res; tmp_hu];
    fprintf('Current pix hu: %d\n', tmp_hu);
end
fprintf('\nCT value:\n')
fprintf('Area \t%f\n', ((pix_spac(1)*pix_spac(2)) * length(x_data)));
fprintf('Average\t%f HU\n', mean(res));
fprintf('Median\t%f HU\n', median(res));
fprintf('Max\t%f HU\n', max(res));
fprintf('Min\t%f HU\n', min(res));

end

