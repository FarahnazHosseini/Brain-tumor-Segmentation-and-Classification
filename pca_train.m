Img=zeros(65536,9);

for i=2:9
   A=imread(['G:\Users\farahnaz\Desktop\data\',num2str(i),'.gif']); 
  A=reshape(A,1,65536);
   Img(1:65536,i)=A;
end

me=zeros(65536,1);
me=mean(A,2);
for i=2:9
a(:,i)=Img(:,i)-me;
end
[U,E,V] = svd(a,0);