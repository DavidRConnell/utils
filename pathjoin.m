function combinedPath = pathjoin(patha, pathb)
%PATHJOIN combine parts of a path
%   FULLPATH = PATHJOIN(PATHA, PATHB) return the full path PATHA/PATHB
%   stripping extra path seperators at the boundary.

    if not(endsWith(patha, '/'))
        patha = [patha, '/'];
    end

    pathb = strip(pathb, 'left', '/');
    combinedPath = [patha pathb];
end
