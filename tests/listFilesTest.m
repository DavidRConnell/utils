classdef listFilesTest < matlab.unittest.TestCase

	properties
		testDir = './tmp/';
	end

	methods (TestMethodSetup)
		function setup(testCase)
			mkdir(testCase.testDir);
			testCase.addTeardown(@system, ['rm -r ' testCase.testDir]);
		end
	end

	methods (Test, TestTags = {'Unit'})
		function testListNormalFiles(testCase)
			numTestFiles = 10;
			testFilesBaseName = 'fake';
			testFiles = cell(numTestFiles, 1);
			for fileNum = 1:numTestFiles
				testFileName = [testFilesBaseName num2str(fileNum)];
				utils.touch([testCase.testDir testFileName]);
				testFiles{fileNum} = testFileName;
			end

			testCase.verifyEqual(sort(utils.listFiles(testCase.testDir)), ...
								 sort(testFiles))
		end

		function testListFilesWithSpacesInName(testCase)
			numTestFiles = 10;
			testFilesBaseName = 'fake ';
			testFiles = cell(numTestFiles, 1);
			for fileNum = 1:numTestFiles
				testFileName = [testFilesBaseName num2str(fileNum)];
				utils.touch([testCase.testDir testFileName]);
				testFiles{fileNum} = testFileName;
			end

			testCase.verifyEqual(sort(utils.listFiles(testCase.testDir)), ...
								 sort(testFiles))
		end
	end
end
