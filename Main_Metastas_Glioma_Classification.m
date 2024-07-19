
function Main_Metastas_Glioma_Classification(BW_tomor,currentfilename)

image = imread(['Clear\' currentfilename]);
[a1 a2 a3] = size(image);
if a3~=1
    image = rgb2gray(image);
end
image = imresize(image,[256 256]);

[x y] = find(BW_tomor == 0);

summation = 0;
for i=1:length(x)
    summation = summation + double(image(x(i),y(i)));
end

probability = summation / length(x);
%probability
if probability > 35
    disp(['>>>> ' currentfilename ' >> ' num2str(probability/255) '% is Metastasis and ' num2str(1-(probability/255))  '% is Glioma']);
else
    disp(['>>>> ' currentfilename ' >> ' num2str(probability/255) '% is Glioma and ' num2str(1-(probability/255))  '% is Metastas ']);
end
end
