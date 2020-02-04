function flag = pathcmp(patha, pathb)
%PATHCMP compare to paths for equality
%   PATHCMP(PATHA, PATHB) returns true if both paths are equivalant, after
%   path expansion.

    flag = strcmp(expandpath(patha), expandpath(pathb));

    function fullpath = expandpath(path)
        fullpath = strip(regexprep(path, '^\./', pwd), 'right', '/');
        fullpath = regexprep(fullpath, '^\.\.', fileparts(pwd));
        fullpath = regexprep(fullpath, '^~', getenv('HOME'));
    end
end
