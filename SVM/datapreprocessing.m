[Train]=xlsread('ml_data.xlsx', 'Sheet1');
TrainNo=Train(:,1);
id1=find(isnan(TrainNo));
TrainNo([id1])=[];
Type=Train(:,3);
Type([id1])=[];
Distance=Train(:,4);
Destination=Train(:,5);
DayofWeek=Train(:,6);
Delay=Train(:,7);
Distance([id1])=[];
Destination([id1])=[];
DayofWeek([id1])=[];
Delay([id1])=[];

del=Delay;

for i=1:length(del)
    if(del(i)<=40)
      del(i)=0;
    elseif(del(i)>40)
      del(i)=1;
    endif
endfor

X=[Type,Distance,Destination,DayofWeek,del];
nRows=size(X,1);
randRows=randperm(nRows);
%# generate random ordering of row indices
trainlen=int32(length(X)*0.7);
XTrain=X(randRows(1:trainlen),:);
XTest=X(randRows(trainlen+1:end),:);
yTrain=XTrain(:,5);
yTest=XTest(:,5);

XTrain(:,5)=[]
XTest(:,5)=[]
