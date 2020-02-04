function flag = pathcmp(patha, pathb)
%PATHCMP compare to paths for equality
%   PATHCMP(PATHA, PATHB) returns true if both paths are equivalant, after
%   path expansion.

    flag = strcmp(expandpath(patha), expandpath(pathb));

    function fullpath = expandpath(path)
        path = strip(regexprep(path, '^\./', pwd), 'right', '/');
        path = regexprep(path, '^\.\.', fileparts(pwd));
    end
end
