
pkg load io
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
    if(del(i)<=20)
      del(i)=1;
    elseif(del(i)>20&&del(i)<=40)
      del(i)=2;
    elseif(del(i)>40&&del(i)<=60)
      del(i)=3;
    elseif(del(i)>60&&del(i)<=80)
      del(i)=4;
    elseif(del(i)>80)
      del(i)=5;
    endif
endfor

X=[Type,Distance,Destination,DayofWeek,del]; 
X=sortrows(X,5)
y=X(:,5);
X(:,5)=[]
