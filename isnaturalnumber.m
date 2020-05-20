function TF = isnaturalnumber(x)
%ISNATURALNUMBER true if non-negative integer
%   TF = ISNATURALNUMBER(X) return true if X is an integer greater than or
%   equal to 0 and false otherwise.

    TF = isnumeric(x) && (x >= 0) && (mod(x, 1) == 0);
end
