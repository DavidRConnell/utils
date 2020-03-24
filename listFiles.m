function list = listFiles(dirName, showHidden)
%LISTFILES list all files in DIR
%
%   LIST = LISTFILES(DIR) return a cell array of all files in DIR. Accepts globs.
%   LIST = LISTFILES(DIR, SHOWHIDDEN) if SHOWHIDDEN is true include hidden files.

    if nargin < 2
        showHidden = false;
    end

    dirContents = dir(dirName);
    dirName = dirContents.folder;
    dirContents = {dirContents.name}';
    list = removeNonFiles(dirContents, showHidden);
    list = utils.pathjoin(dirName, list);

    function list = removeNonFiles(dirContents, showHidden)
        if showHidden
            pattern = '^\.?[^\.]+\..*';
        else
            pattern = '^[^\.]+\..*';
        end

        list = regexp(dirContents, pattern, 'once', 'match');
        list = list(contains(list, '.'));
    end
end
