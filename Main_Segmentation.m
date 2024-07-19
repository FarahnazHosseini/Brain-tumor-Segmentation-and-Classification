clc
clear
close all

se = strel('disk',5);
ax = input('What is your image types[1) JPG 2)PNG]: ');

if ~exist('Clear', 'dir')
    mkdir('Clear');
else
    delete('Clear\*.jpg');
end
switch ax
    case 1
        imagefiles = dir('Data\*.jpg');
        nfiles = length(imagefiles);
        
        for ii=1:nfiles
            currentfilename = imagefiles(ii).name;
            %             disp(['>>>> ' currentfilename]);
            currentimage = imread(['Data\' currentfilename]);
            [a1 a2 a3] = size(currentimage);
            if a3~=1
                currentimage=rgb2gray(currentimage);
            end
            skullstripping(currentimage,currentfilename,'jpg');
        end
    case 2
        
        imagefiles = dir('Data\*.png');
        nfiles = length(imagefiles);
        
        for ii=1:nfiles
            currentfilename = imagefiles(ii).name;
            %             disp(['>>>> ' currentfilename]);
            currentimage = imread(['Data\' currentfilename]);
            [a1 a2 a3] = size(currentimage);
            if a3~=1
                currentimage=rgb2gray(currentimage);
            end
            skullstripping(currentimage,currentfilename,'png');
            
        end
end
KNNSegmentation(ax,se);
