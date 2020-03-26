function TF = iscellall(c, test)
%ISCELLALL test if all elements satisfy a criterion
%   TF = ISCELLALL(CELL, TEST) return true if all elements of CELL satisfy
%   TEST. TEST should be a function that accepts one argument (the cell
%   element to test) and returns true or false.
%
%   An error is thrown if CELL is not a cell array.
%
%   Example:
%       c = {'foo', 'bar', 'baz'};
%       % Test all elements are of the class CHAR.
%       ISCELLALL(c, @ISCHAR); % returns true
%       % Test all elements are of the class CHAR or STRING.
%       ISCELLALL(c, @(x) ISCHAR(x) || ISSTRING(x));

    assert(iscell(c), ...
           'iscellall:NotACell', 'First argument must be a cell array');

    TF = true;
    for i = 1:numel(c)
        if ~test(c{i})
            TF = false;
            return
        end
    end
end
