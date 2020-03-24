function str = strrm(str, pattern)
%STRRM remove all intstances of pattern from a string
%   STR = STRRM(STR, PATTERN) find all instances of PATTERN in STR and remove them.
%
%   See also: REGEXREP.

    str = join(regexp(str, pattern, 'split'), '');
	if length(str) == 1
		str = str{1};
	end
end
