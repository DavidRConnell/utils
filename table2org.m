function orgtbl = table2org(table, displayrownames)
%TABLE2ORG Convert a table object to a org-tbl
%   TABLE2ORG(TABLE) converts HEAD(TABLE) to org-tbl format.
%   TABLE2ORG(TABLE, DISPLAYROWNAMES) if DISPLAYROWNAMES is true, include the
%   row names in the resulting table.

    table = head(table);

    colnames = table.Properties.VariableNames;
    rownames = table.Properties.RowNames;
    fmt = ['|' repmat('%s|', [1 size(table, 2)])];
    header = sprintf(fmt, colnames{:});

    lines = cell(size(table, 1), 1);
    for rowi = 1:size(table, 1)
        if nargin > 1 && displayrownames
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
