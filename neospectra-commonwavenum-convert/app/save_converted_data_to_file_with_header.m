function save_converted_data_to_file_with_header(srcFileName, destFullFilePath, header)
fin = fopen(srcFileName, 'r');
fout = fopen(destFullFilePath, 'w');
i = 0;
while ~feof(fin)
    line = fgetl(fin);
    if i == 0
        line = header;
    end
    fprintf(fout, "%s\n", line);
    i = i + 1;
end

fclose(fin);
fclose(fout);

end