function list = listFiles(dir)
%LISTFILES list all files in DIR
%
%   LIST = LISTFILES(DIR) return a cell array of all files in DIR. Accepts globs.

    files = split(ls(dir));
    files = files(~strcmp(files, ''));
    list{length(files), 1} = '';
    for i = 1:length(files)
        [~, name, ext] = fileparts(files{i});
        list{i} = [name ext];
    end
end
