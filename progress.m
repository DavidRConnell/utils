function progress(i, n)
%PROGRESS print the progress of the current loop
%   PROGRESS(I, N) show the progress of a for loop with total iterations N
%   and current iteration I.

    numSymbols = 25;
    proportionComplete = (i / n);
    numFinished = floor(numSymbols * proportionComplete);

    fprintf('\r   [%s%s] %0.2f%%', ...
            repmat('#', [1 numFinished]), ...
            repmat(' ', [1 (numSymbols - numFinished)]), ...
            100 * proportionComplete)

    if i == n
        fprintf('\n')
    end
end
