function checkout(branch)
%CHECKOUT switch package directory
%   CHECKOUT(BRANCH) replace the current branch (i.e. subdir of
%   ~/programs/MatlabPackages) from MATLAB's path with BRANCH, a different
%   subdir.

    rootDir = utils.pathjoin(getenv('HOME'), '/programs/MatlabPackages/');
    assert(exist([rootDir branch], 'dir') == 7, 'Branch does not exist');

    p = path;
    path(regexprep(p, [rootDir '.*?' pathsep], [rootDir branch pathsep]));
end
