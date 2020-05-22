function list = listFiles(dirName, varargin)
%LISTFILES list all files in DIR
%
%   LIST = LISTFILES(DIR) return a cell array of all files in DIR. Accepts globs.
%   LIST = LISTFILES(DIRS) return all files under all directories in cell array
%   DIRS. IF any elements in the cell are files they are returned unaltered.
%   All returned files are unique.
%
%   LIST = LISTFILES(..., 'PATTERN', regex) exclude files that do not match the
%   regular expression PATTERN from the returned list.
%
%   LIST = LISTFILES(DIR, ..., 'SHOWHIDDEN', TRUE) include hidden files (files starting
%   with '.') in the returned list.
%
%   See also PATHJOIN, DIR, REGEXP.

    p = inputParser;
    p.addParameter('pattern', 'None', @ischar);
    p.addParameter('showHidden', false, @islogical);
    p.addParameter('recursive', false, @islogical);
    p.parse(varargin{:});

    if ~iscell(dirName)
        dirName = {dirName};
    elseif size(dirName, 1) == 1
        dirName = dirName';
    end

    dirContents = {};
    for d = dirName'
        tmp = privateListFiles(d{1});
        dirContents = {dirContents{:}, tmp{:}};
    end

    list = unique(dirContents)';

    function dirContents = privateListFiles(name)
        dirContents = dir(name);
        dirName = dirContents.folder;
        dirContents = {dirContents.name};
        dirContents = filterList(dirContents, p.Results.showHidden, p.Results.pattern);
        dirContents = utils.pathjoin(dirName, dirContents);
    end

    function list = filterList(dirContents, showHidden, regexpPattern)
    % Remove directories, hidden files if showHidden is false, and files that
    % don't match the given regular expression.

        if showHidden
            pattern = '^\.?[^\.]+\..*';
        else
            pattern = '^[^\.]+\..*';
        end

        matches = regexp(dirContents, pattern, 'once', 'match');

        iscellempty = @(x) cellfun(@isempty, x);
        if ~strcmp(regexpPattern, 'None')
            dirContents = dirContents(matches);
            matches = regexp(dirContents, regexpPattern, 'once');
        end
        list = dirContents(~iscellempty(matches));

    end
end
