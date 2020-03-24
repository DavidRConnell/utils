function flag = pathcmp(patha, pathb)
%PATHCMP compare to paths for equality
%   PATHCMP(PATHA, PATHB) returns true if both paths are equivalant, after
%   path expansion.
%
%   See also PATHEXPAND.

    flag = strcmp(utils.pathexpand(patha), utils.pathexpand(pathb));
end
