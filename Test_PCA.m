function index=Test_PCA(img)

p=U(:,1:40);

x=reshape(img,1,65536);

a1=x'-me;
testim_wt=P'*a1;

euDis=[];
for i=1:size(train_wt,2);
  euDis(i,1) = norm(testim_wt(1:40,1:1)-train_wt(:,i));
end
[Y index]=min(euDis);