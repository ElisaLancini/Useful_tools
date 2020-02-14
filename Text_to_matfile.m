% Read txt and save as matfile

%% Info required
clear
path='/Users/elisalancini/Dropbox/PhD/Experiments/B_Sfb_pilot/C_scripts/Version_2a/B_inputfiles/';
% path='C:\Users\elisa\Dropbox\PhD\Experiments\B_Sfb_pilot\C_scripts\Version_2\B_inputfiles\';
% path='C:\Users\elisa\Dropbox\PhD\Experiments\B_Sfb_pilot\C_scripts\Version_2a\B_inputfiles\';
% path='/Users/elisalancini/Dropbox/PhD/Scripts/8_Check_filenames_in_folder/';
prompt = 'Name of the text file to upload (without extension)? ';
name_text_file=input(prompt,'s');
clear prompt
% name_text_file= 'inputfile';
prompt = 'Name to give to the matlab file created from the textfile(without extension)? ';
name_mat_file=input(prompt,'s');
clear prompt
prompt = 'Number of columns of the textfile? ';
number_of_columns=input(prompt);
clear prompt

cd(path)

 %% Run

%https://de.mathworks.com/help/matlab/ref/fscanf.html
fid=fopen([name_text_file '.txt'],'r'); %number of fields

if number_of_columns==2
uploadedfile=textscan(fid,'%s%s');         % how to read those fields
elseif number_of_columns==8
uploadedfile=textscan(fid,'%s%s%s%s%s%s%s%f', 'HeaderLines', 1);
elseif number_of_columns==9
uploadedfile=textscan(fid,'%s%s%s%s%s%s%s%f%f', 'HeaderLines', 1);
elseif number_of_columns==3
uploadedfile=textscan(fid,'%s%s%f', 'HeaderLines', 1);    
end

% (%s) Returns text array containing the data up to the next delimiter, or end-of-line character.
% (%f) converts that to a number
fclose(fid);
clear fid ans
% save it as mat file in the same folder
save([name_mat_file , '.mat'],'uploadedfile')

