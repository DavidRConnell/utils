function list = listFiles(dirName, varargin)
%LISTFILES list all files in DIR
%
%   LIST = LISTFILES(DIR) return a cell array of all files in DIR. Accepts globs.
%   LIST = LISTFILES(DIR, 'SHOWHIDDEN') include hidden files (files starting
%   with '.') in the returned list. (case-insensitive)
%
%   LIST = LISTFILES(DIR, PATTERN) exclude files that do not match the
%   regular expression PATTERN from the returned list.


    [showHidden, regexpPattern] = parseInputs;
    dirContents = dir(dirName);
    dirName = dirContents.folder;
    dirContents = {dirContents.name}';
    list = filterList(dirContents, showHidden, regexpPattern);
    list = utils.pathjoin(dirName, list);

    function [showHidden, regexpPattern] = parseInputs
        showHidden = false;
        regexpPattern = false;
        for arg = varargin
            if (ischar(arg{1}) || isstring(arg{1})) && strcmpi(arg{1}, 'showhidden')
                showHidden = true;
            elseif (ischar(arg{1}) || isstring(arg{1}))
                assert(~regexpPattern, 'Too many arguments');
                regexpPattern = arg{1};
            end
        end
    end

    function list = filterList(dirContents, showHidden, regexpPattern)
    % Remove directories, hidden files if showHidden is false, and files that
    % don't match the given regular expression.

        if showHidden
            pattern = '^\.?[^\.]+\..*';
        else
            pattern = '^[^\.]+\..*';
        end

        list = regexp(dirContents, pattern, 'once', 'match');

        if regexpPattern
            matches = regexp(list, regexpPattern, 'once');
        end

        iscellempty = @(x) cellfun(@isempty, x);
        list = list(~iscellempty(matches));
    end
end
