clear all; close all; clc;

% Author: Davi Mendes (@mendes-davi)
% Goal: Process all RAW EOG records .csv files

% Get dir info
dir_info = dir();
fnames = {dir_info.name};
% Iterate for all files
for f = 1:length(fnames)
	if contains(fnames{f}, '.csv') % Select files with .csv extensions
		% Load data
		data = load(fnames{f});
		% Get Signal
		x = data(:,2);
		% Estimate fs
		time = data(:,1);
		time = [time(1); time(:)];	
		time = diff(time);
		fs = ceil(1/mean(time));
		t = linspace(0, length(x)/fs, length(x));
		save([fnames{f}(1:end-4) '.mat'], 'x', 't', 'fs');
	end	
end