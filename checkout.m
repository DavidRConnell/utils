function oldP = checkout(branch)
    rootDir = utils.pathjoin(getenv('HOME'), '/programs/MatlabPackages/');
    assert(exist([rootDir branch], 'dir') == 7, 'Branch does not exist');

    p = path;
    path(regexprep(p, [rootDir '.*?' pathsep], [rootDir branch pathsep]));
end
