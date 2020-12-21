clear;

% const variables
back_slash = "\";
str_src = "src";
str_dest = "dest";
Interpolation_points = 257;           % (65,129,257,513,1024,2048,4096)
header_text = "x_Axis:Wavelength (nm)	y_Axis:PSD (a.u.)";
convert_temp_file_name = "convert_temp.txt";

% setting variables
root_dir = "D:\workspace\matlab\Measurements";
%root_dir = "D:\workspace\matlab\test-sample";

src_dir = strcat(root_dir, back_slash, str_src);
srcFileList = get_all_file_list(src_dir);
create_dest_folders(srcFileList, str_src, str_dest);

for idx = 1:size(srcFileList)
    srcFileFullPath = strcat(srcFileList(idx).folder, back_slash, srcFileList(idx).name);

    Data = importdata(srcFileFullPath,'\t',1);
    Data = Data.data;

    lambda_in = Data(:,1);
    Bin = Data(:,2);

    [lambda_op,Bop] = Wavenumber_Linear_Interpolation(Interpolation_points,lambda_in,Bin);
    lambda_op = lambda_op';
    Bop = Bop';

    T = table(lambda_op, Bop);
    writetable(T, convert_temp_file_name, 'Delimiter', '\t');

    destFileFullPath = replace(srcFileFullPath, str_src, str_dest);
    %movefile(convert_temp_file_name, destFileFullPath);
    save_converted_data_to_file_with_header(convert_temp_file_name, destFileFullPath, header_text);

end

clf;
figure; plot(lambda_in,Bin+0.1,lambda_op,Bop);