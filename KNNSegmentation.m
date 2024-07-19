
function KNNSegmentation(ax,se)

switch ax
    case 1
        if ~exist('Results', 'dir')
            mkdir('Results');
        else
            delete('Results\*.jpg');
        end
        if ~exist('Labels', 'dir')
            mkdir('Labels');
        else
            delete('Labels\*.jpg');
        end
        imagefiles = dir('Clear\*.jpg');
        nfiles = length(imagefiles);
        
        for ii=1:nfiles
            currentfilename = imagefiles(ii).name;
            disp(['>>>> ' currentfilename]);
            currentimage = imread(['Clear\' currentfilename]);
            [a1 a2 a3] = size(currentimage);
            if a3~=1
                currentimage=rgb2gray(currentimage);
            end
            l1=size(currentimage,1);
            l2=size(currentimage,2);
            currentimage = imresize(currentimage,[256 256]);
            row = 1;
            for i=1:size(currentimage,1)
                for j=1:size(currentimage,2)
                    table(row,1) = i;
                    table(row,2) = j;
                    table(row,3) = currentimage(i,j);
                    row = row + 1;
                end
            end
            
            x = input('Enter X of your point: ');
            x = floor(x*256/l1);
            y = input('Enter Y of your point: ');
            y = floor(y*256/l2);
            K = input('How many similar points should be found?: ');
            [IDX,D] = knnsearch(table,[x y currentimage(x,y)],'k',K);
            
            result = currentimage;
            label = uint8(ones(size(currentimage,1),size(currentimage,2)).*255);
            for i=1:length(IDX)
                result(table(IDX(i),1),table(IDX(i),2)) = uint8(0);
                label(table(IDX(i),1),table(IDX(i),2)) = uint8(0);
            end
            imwrite(uint8(result),['Results\' currentfilename]);
            imwrite(uint8(label),['Labels\' currentfilename]);
        end
    case 2
        if ~exist('Results', 'dir')
            mkdir('Results');
        else
            delete('Results\*.png');
        end
        if ~exist('Labels', 'dir')
            mkdir('Labels');
        else
            delete('Labels\*.png');
        end
        imagefiles = dir('Clear\*.png');
        nfiles = length(imagefiles);
        
        for ii=1:nfiles
            currentfilename = imagefiles(ii).name;
            disp(['>>>> ' currentfilename]);
            currentimage = imread(['Clear\' currentfilename]);
            [a1 a2 a3] = size(currentimage);
            if a3~=1
                currentimage=rgb2gray(currentimage);
            end
            l1=size(currentimage,1);
            l2=size(currentimage,2);
            currentimage = imresize(currentimage,[256 256]);
            row = 1;
            for i=1:size(currentimage,1)
                for j=1:size(currentimage,2)
                    table(row,1) = i;
                    table(row,2) = j;
                    table(row,3) = currentimage(i,j);
                    row = row + 1;
                end
            end
            
            x = input('Enter X of your point: ');
            x = floor(x*256/l1);
            y = input('Enter Y of your point: ');
            y = floor(y*256/l2);
            K = input('How many similar points should be found?: ');
            [IDX,D] = knnsearch(table,[x y currentimage(x,y)],'k',K);
            
            result = currentimage;
            label = uint8(ones(size(currentimage,1),size(currentimage,2)).*255);
            for i=1:length(IDX)
                result(table(IDX(i),1),table(IDX(i),2)) = uint8(0);
                label(table(IDX(i),1),table(IDX(i),2)) = uint8(0);
            end
            imwrite(uint8(result),['Results\' currentfilename]);
            imwrite(uint8(label),['Labels\' currentfilename]);
        end
    otherwise
        disp('Your input is not valid!')
end

end