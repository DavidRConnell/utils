function flag = pathcmp(patha, pathb)
    flag = strcmp(expandpath(patha), expandpath(pathb));

    function fullpath = expandpath(path)
        path = strip(regexprep(path, '^\./', pwd), 'right', '/');
        path = regexprep(path, '^\.\.', fileparts(pwd));
    end
end
