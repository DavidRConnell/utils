function summarizeTests(results)
    switch class(results)
      case 'matlab.unittest.TestResult'
        summarizeUnitTest(results);
      case 'matlab.perftest.TimeResult'
        summarizePerformanceTest(results);
    end
end

function summarizeUnitTest(results)
    fields = {'Passed', 'Incomplete', 'Duration'};
    r.Name = {results.Name}';
    for field = fields
        r.(field{1}) = [results.(field{1})]';
    end

    fprintf('\n')
    disp(struct2table(r));
    fprintf('\tTotal Passed:\t%i / %i\n', sum(r.Passed), length(r.Passed))
    fprintf('\tTotal Duration:\t%f\n\n', sum(r.Duration))
end

function summarizePerformanceTest(results)
    fprintf('\n')
    disp(sampleSummary(results));
end
