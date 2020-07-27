function orgtbl = table2org(table, varargin)
%TABLE2ORG Convert a table object to a org-tbl
%   TABLE2ORG(TABLE) converts HEAD(TABLE) to org-tbl format.
%   TABLE2ORG(TABLE, 'ROWNAMES', true) if ROWNAMES is true, include the
%   row names in the resulting table.
%   TABLE2ORG(TABLE, 'NUMROWS', N) display N rows of TABLE. By default pass
%   table to HEAD returning only the first 8 rows. NUMROWS can be set to a
%   number to get the first N rows, a negative number to get the last N rows,
%   'HEAD' to pass to HEAD (equivalent to setting N to 8), 'TAIL' to pass to TAIL
%   (equivalent to setting N to -8), or 'ALL' to display all rows.
%
%   TABLE2ORG(TABLE, 'COLUMNS', INDICES) Display columns in columns numbers
%   in INDICES. Defaults to all columns.
%
%   See also HEAD, TAIL.

    isnumrows = @(x) (isnumeric(x) && utils.isnaturalnumber(abs(x)) && x ~= 0) || ...
        ismember(lower(x), {'head', 'tail', 'all'});

    p = inputParser;
    p.addParameter('rowNames', false, @islogical);
    p.addParameter('numRows', 'head', isnumrows);
    p.addParameter('columns', 1:size(table, 2), @isvector)
    p.parse(varargin{:});

    switch lower(p.Results.numRows)
      case 'all'
        % Leave table alone.
      case 'head'
        table = head(table);
      case 'tail'
        table = tail(table);
      otherwise
        if p.Results.numRows > 0
            table = head(table, p.Results.numRows);
        else
            table = tail(table, -p.Results.numRows);
        end
    end

    table = table(:, p.Results.columns);

    colnames = table.Properties.VariableNames;
    rownames = table.Properties.RowNames;
    fmt = ['|' repmat('%s|', [1 size(table, 2)])];
    header = sprintf(fmt, colnames{:});

    lines = cell(size(table, 1), 1);
    for rowi = 1:size(table, 1)
        if p.Results.rowNames
            line = [rownames{rowi} '|'];
        else
            line = '|';
        end
        for coli = 1:size(table, 2)
            value = table.(colnames{coli})(rowi);
            if isnumeric(value)
                valueStr = sprintf('%0.4g', value);
            else
                valueStr = sprintf('%s', value);
            end
            line = [line valueStr '|'];
        end
        lines{rowi} = line;
    end

    orgtbl = sprintf('%s\n', header, lines{:});
    orgtbl = orgtbl(1:end-1);
end
