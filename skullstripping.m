
function skullstripping(I,currentfilename,JP)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Binary

BW=im2bw(I,graythresh(I));
WB=1-BW;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% wavelet

WI=dwt2(WB,'db1',2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Daron yabi

[r c] = size(WI);
scale = [2 2];
outputI = zeros(scale(1)*r,scale(2)*c, class(WI));

for i=1:scale(1)*r
    for j=1:scale(2)*c
        ii = round( (i-1)*(r-1)/(scale(1)*r-1)+1 );
        jj = round( (j-1)*(c-1)/(scale(2)*c-1)+1 );
        outputI(i,j) = WI(ii,jj);
    end
end

BW=im2bw(outputI,graythresh(I));
IBW=1-BW;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Labeling

[L,n]=bwlabel(IBW);
slides=max(max(L));
mark=zeros(1,slides);

for i=1:size(L,1)
    for j=1:size(L,2)
        if (L(i,j)~=0)
            mark(L(i,j))=mark(L(i,j))+1;
        end
    end
end

i=find(mark==max(mark));
L(L~=i)=0;
L(L==i)=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% convex

L = bwconvhull(L);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Filter

I3=I;

for i=1:size(L,1)
    for j=1:size(L,2)
        if L(i,j)==0
            I3(i,j)=0;
        end
    end
end

imwrite(I3,['Clear\' currentfilename],JP);

end