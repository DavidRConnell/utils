function combinedPath = pathjoin(patha, pathb)
    if not(endsWith(patha, '/'))
        patha = [patha, '/'];
    end
    pathb = strip(pathb, 'left', '/');
    combinedPath = [patha pathb];
end
