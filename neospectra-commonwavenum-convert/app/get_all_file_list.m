% find all files under root dir recursively

function fileList = get_all_file_list(rootdir)

filelist = dir(fullfile(rootdir, '**\*.*'));  %get list of files and folders in any subfolder
fileList = filelist(~[filelist.isdir]);  %remove folders from list

end
%for idx = 1:size(filelist)
%    fileFullPath = strcat(filelist(idx).folder, '\', filelist(idx).name)
%    fileId = fopen(fileFullPath)
%    fgetl(fileId)
%    fgetl(fileId)
%    fclose(fileId)
%end