function list = listFiles(dirName)
%LISTFILES list all files in DIR
%
%   LIST = LISTFILES(DIR) return a cell array of all files in DIR. Accepts globs.

    files = dir(dirName);
    list = {files.name}';
    list = list(~strcmp(list, '.') & ~strcmp(list, '..'));
end
