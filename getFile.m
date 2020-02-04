function path = getFile(dir, index)
%GETFILE pick a file from dir
%   PATH = GETFILE(DIR) returns the full path of a random file in DIR.
%   Accepts globs to filter files.
%   PATH = GETFILE(DIR, N) ruturns the Nth file in DIR.
%
%   See also UTILS/LISTFILES.

    files = utils.listFiles(dir);
    if nargin == 1
        index = randi(length(files), 1);
    end
    assert(index <= length(files), 'File index out of range.')

    file = files{index};
    path = utils.pathjoin(dir, file);
end
