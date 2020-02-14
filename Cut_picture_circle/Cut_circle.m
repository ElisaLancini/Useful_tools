%% Paths
path_stimuli='C:\Users\elisa\Dropbox\PhD\Stimuli\Place_object\B_JPEG_original\';
path_save='C:\Users\elisa\Dropbox\PhD\Stimuli\Place_object\BC_JPEG_NoFrame\';
path_info   = 'C:\Users\elisa\Dropbox\PhD\Scripts\Cut pictures\inputfile\';
%% Obtain list 

cd(path_info)

cd(path_info);
fid=fopen('All_no_noise.txt','r'); %number of fields
inputfile=textscan(fid,'%s%s%s%s%s%s%s%f', 'HeaderLines', 1);         % how to read those fields
        % (%s) Returns text array containing the data up to the next delimiter, or end-of-line character.
        % (%f) converts that to a number 
fclose(fid);
clear fid

%Expand, remove last column and concatenate vertically
%Remove last column
name1={};
for i=1:length(inputfile{1, 1})
name1{1, i}=inputfile{1, i};
end
sca
%Concatenate orizontally each column extracted
column1=string(name1{1, 1});
column2=string(name1{1, 2});
column3=string(name1{1, 3});
column4=string(name1{1, 4});
column5=string(name1{1, 5});
column6=string(name1{1, 6});
names=vertcat(column1,column2,column3,column4,column5,column6);
clear column* name name1

%% Cut
I = imread('51_01.jpg');

R=124; % radius in pixels
x=10;y=10; %Location of upper-right corner of your cropping mask

Mask1 = fspecial('disk',R)~=0;
[u,v,i]=size(Mask1);
Mask=double(Mask1);

Cropped= imcrop(I,[x y u v]).*Mask;
imwrite([path_save 'out.png'],Cropped);
%%
I = imread('51_01.jpg');
imageSize = size(I);
ci = [250, 300, 100];     % center and radius of circle ([c_row, c_col, r])
[xx,yy] = ndgrid((1:imageSize(1))-ci(1),(1:imageSize(2))-ci(2));
mask = uint8((xx.^2 + yy.^2)<ci(3)^2);
croppedImage = uint8(zeros(size(I)));
croppedImage(:,:,1) = I(:,:,1).*mask;
imshow(croppedImage);
%% Cut circularly
cd(Stimulipath)

I = imread('51_01.jpg');
h = imshow(I);

% define circular roi by square bounding box
x = 10;
y = 10; 
d1 = 100;
d2 = 100; 
e = imellipse(gca, [x y d1 d2]);

% roi can be interactively moved/adjusted
% do not close figure window before createMask is called

%%% these lines are only needed if you move or resize the roi
   pos = getPosition(e);
   x = pos(1);
   y = pos(2);
   d1 = pos(3);
   d2 = pos(4);

BW = createMask(e,h);
% here assuming your image is uint8
BW = uint8(BW);

I2 = I.*BW; % everything outside circle to black
I2 = I2(x:(x+d1-1),y:(y+d2-1)); % close crop to circle
imwrite([path_save 'out.png'],I2,'Transparency',0);
