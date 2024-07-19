
function remove(ax,se)

switch ax
    case 1
        if ~exist('Remove', 'dir')
            mkdir('Remove');
        else
            delete('Remove\*.jpg');
        end
        imagefiles = dir('Labels\*.jpg');
        nfiles = length(imagefiles);
        for ii=1:nfiles
            array = [];
            currentfilename = imagefiles(ii).name;
%             disp(['>>>> ' currentfilename]);
            currentimage = imread(['Labels\' currentfilename]);
            BW=im2bw(currentimage);
%             se = strel('disk',5);
            BW = imdilate(BW,se);
            CC = bwconncomp(BW,8);
            numPixels = cellfun(@numel,CC.PixelIdxList);
            for idx=1:length(numPixels)
                if numPixels(idx) < 500
                    BW(CC.PixelIdxList{idx}) = 0;
                end
            end
            BW = imerode(BW,se);
            BW = ~BW;
            BW = imfill(BW,'holes');
            BW = ~BW;
            imwrite(BW,['Remove\' currentfilename]);
        end
    case 2
        if ~exist('Remove', 'dir')
            mkdir('Remove');
        else
            delete('Remove\*.png');
        end
        imagefiles = dir('Labels\*.png');
        nfiles = length(imagefiles);
        for ii=1:nfiles
            array = [];
            currentfilename = imagefiles(ii).name;
%             disp(['>>>> ' currentfilename]);
            currentimage = imread(['Labels\' currentfilename]);
            BW=im2bw(currentimage);
%             se = strel('disk',5);
            BW = imdilate(BW,se);
            CC = bwconncomp(BW,8);
            numPixels = cellfun(@numel,CC.PixelIdxList);
            for idx=1:length(numPixels)
                if numPixels(idx) < 500
                    BW(CC.PixelIdxList{idx}) = 0;
                end
            end
            BW = imerode(BW,se);
            BW = ~BW;
            BW = imfill(BW,'holes');
            BW = ~BW;
            imwrite(BW,['Remove\' currentfilename]);
        end
end
