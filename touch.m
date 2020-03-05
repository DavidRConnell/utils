function touch(filename)
%TOUCH create empty file
%   TOUCH(FILENAME) make empty file FILENAME if it does not exist otherwise
%   do nothing.

    fclose(fopen(filename, 'a'));
end
