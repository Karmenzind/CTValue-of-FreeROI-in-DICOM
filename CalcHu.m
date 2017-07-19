function [] = CalcHu(h_proc, data_set, rescale_slope, rescale_intercept, pix_spac)

% Calculate Hounsfield Unit Value
% Hounsfield units = m*SV+b

mask = h_proc.createMask();
[y_data, x_data] = find(mask);

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

