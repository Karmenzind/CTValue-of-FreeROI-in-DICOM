function [abs_path] =...
    TraversalAndLocate(maindir, given_image_number, given_series_number)

file_lst = dir(maindir);
fprintf('Searching');
point_num = 0;

for idx = 1: length(file_lst)
    fprintf('.')
    point_num = point_num + 1;

    if isequal(rem(point_num, 40), 0)
        fprintf('\n');
    end

    relative_name = file_lst(idx).name;

    if (isequal(relative_name, '.') ||...
            isequal(relative_name, '..'))
        continue;
    end

    abs_path = strcat(maindir, relative_name);
    tmp_dcm_info = dicominfo(abs_path);

    try
        series_number = tmp_dcm_info.(dicomlookup('0020', '0011'));
        image_number = tmp_dcm_info.(dicomlookup('0020','0013'));
        if isequal(image_number, given_image_number) ...
               && isequal(series_number, given_series_number)
            fprintf('current image_number idx: %d\n', image_number);
            fprintf('current file idx: %d\n', idx);
            fprintf('current file abs_path: %s\n', abs_path);
            return
        end
    catch
        continue
    end
    
end