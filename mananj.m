
function mananj(ax,se)
switch ax
    case 1
        imagefiles = dir('Clear\*.jpg');
        nfiles = length(imagefiles);
        for ii=1:nfiles
            currentfilename = imagefiles(ii).name;
            %             disp(['>>>> ' currentfilename]);
            currentimage = imread(['Clear\' currentfilename]);
            currentimage = imresize(currentimage,[256 256]);
            [a1 a2 a3] = size(currentimage);
            if a3~=1
                currentimage=rgb2gray(currentimage);
            end
            BW=im2bw(currentimage,0.1);
            %             se = strel('disk',2);
            %             BW = imdilate(BW,se);
            BW_mananj = imerode(BW,se);
            BW_mananj = ~BW_mananj;
            %             imshow(BW_mananj)
            %%% merge 2 pics
            currentimage = imread(['Remove\' currentfilename]);
            currentimage = imresize(currentimage,[256 256]);
            BW_tomor = ~currentimage;
            find_mananj = BW_mananj + BW_tomor;
            [K1 K2] = find(find_mananj == 2);
            %%%
            if ~isempty(K1)
                disp(['>>>> ' currentfilename ' >>>> is Menangioma ' ])
            else
                %                 disp(['>>>> ' currentfilename ' >>>> Mananj Nist' ])
                Main_Metastas_Glioma_Classification(BW_tomor,currentfilename);
            end
        end
    case 2
        imagefiles = dir('Clear\*.png');
        nfiles = length(imagefiles);
        for ii=1:nfiles
            currentfilename = imagefiles(ii).name;
            %             disp(['>>>> ' currentfilename]);
            currentimage = imread(['Clear\' currentfilename]);
            currentimage = imresize(currentimage,[256 256]);
            [a1 a2 a3] = size(currentimage);
            if a3~=1
                currentimage=rgb2gray(currentimage);
            end
            BW=im2bw(currentimage,0.1);
            %             se = strel('disk',2);
            %             BW = imdilate(BW,se);
            BW_mananj = imerode(BW,se);
            BW_mananj = ~BW_mananj;
            %             imshow(BW_mananj)
            currentimage = imread(['Remove\' currentfilename]);
            currentimage = imresize(currentimage,[256 256]);
            BW_tomor = ~currentimage;
            find_mananj = BW_mananj + BW_tomor;
            [K1 K2] = find(find_mananj == 2);
            if ~isempty(K1)
                disp(['>>>> ' currentfilename ' >>>> is Menangioma' ]);
            else
                %                 disp(['>>>> ' currentfilename ' >>>> is not Menangioma' ]);
                Main_Metastas_Glioma_Classification(BW_tomor,currentfilename);
            end
        end
end

end