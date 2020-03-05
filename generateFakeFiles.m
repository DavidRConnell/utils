function list = generateFakeFiles(numFiles, directory, extension)
%GENEARTEFAKEFILES create empty files in a directory
%   GENERATEFAKEFILES creates 'fakefile1.txt' in current directory.
%   GENERATEFAKEFILES(N) creates N fake files named 'fakefilei.txt' for all
%   values of i.
%   GENERATEFAKEFILES(N, DIRECTORY) create files in DIRECTORY
%   GENERATEFAKEFILES(N, DIRECTORY, EXTENSION) Uses the given EXTENSION
%   instead of default 'txt'.
%   LIST = GENERATEFAKEFILES(...) return a list of the created file names.
%
%   See also LISTFILES, GETFILES.

    if nargin < 1
        numFiles = 1;
    end
    if nargin < 2
        directory = '.';
    end
    if nargin < 3
        extension = '.txt';
    end
    if ~startsWith(extension, '.')
        extension = ['.' extension];
    end

    if nargout == 1
        list = cell(numFiles, 1);
    end

    for i = 1:numFiles
        filename = ['fakefile' num2str(i) extension];
        utils.touch(utils.pathjoin(directory, filename));

        if nargout == 1
            list{i} = filename;
        end
    end
end
