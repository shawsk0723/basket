function create_dest_folders(srcFileList, str_src, str_dest)

for idx = 1:size(srcFileList)
    destFilePath = replace(srcFileList(idx).folder, str_src, str_dest);
    if ~exist(destFilePath, 'dir'); mkdir(destFilePath); end
end

end