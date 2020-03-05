function list = listFiles(dirName)
%LISTFILES list all files in DIR
%
%   LIST = LISTFILES(DIR) return a cell array of all files in DIR. Accepts globs.

    dirContents = dir(dirName);
    dirContents = {dirContents.name}';
    list = removeNonFiles(dirContents);

    function list = removeNonFiles(dirContents)
        list = dirContents(~strcmp(dirContents, '.') & ~strcmp(dirContents, '..'));
        list = regexp(list, '^\.?.+\..*', 'once', 'match');
        list = list(contains(list, '.'));
    end
end
