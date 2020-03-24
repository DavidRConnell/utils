function fullpath = pathexpand(path)
%PATHEXPAND expand path aliases
%   FULLPATH = PATHEXPAND(PATH) expands any aliases (~/, ./, ../) in the path.

    fullpath = strip(regexprep(path, '^\./', pwd), 'right', '/');
    fullpath = regexprep(fullpath, '^\.\.', fileparts(pwd));
    fullpath = regexprep(fullpath, '^~', getenv('HOME'));
end
