function combinedPath = pathjoin(patha, pathb, varargin)
%PATHJOIN combine parts of a path
%   FULLPATH = PATHJOIN(PATHA, PATHB) return the full path made from joining
%   PATHA to PATHB stripping extra path seperators at the boundary.
%   FULLPATH = PATHJOIN(PATHA, PATHB, PATH...) return the full path made from
%   joining all arguments.

    validateattributes(patha, {'char', 'string'}, {})
    validateattributes(pathb, {'char', 'string'}, {})

    if not(endsWith(patha, '/'))
        patha = [patha, '/'];
    end

    pathb = strip(pathb, 'left', '/');
    combinedPath = [patha pathb];

    if length(varargin) > 1
        combinedPath = utils.pathjoin(combinedPath, varargin{1}, varargin{2:end});
    elseif ~isempty(varargin)
        combinedPath = utils.pathjoin(combinedPath, varargin{1});
    end
end
