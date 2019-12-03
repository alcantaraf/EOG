clear all; close all; clc;

% Author: Davi Mendes (@mendes-davi)
% Goal: Process all RAW EOG records .csv files

% Get dir info
dir_info = dir();
fnames = {dir_info.name};
% Iterate for all files
for f = 1:length(fnames)
	if contains(fnames{f}, '.csv') % Select files with .csv extensions
		data = load(fnames{f});
		x = data(:,2);
		fs = 500; 
		t = linspace(0, length(x)/fs, length(x));
		save([fnames{f}(1:end-4) '.mat'], 'x', 't', 'fs');
	end	
end
