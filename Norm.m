function [ norm_data ] = Norm( data )
%NORM Summary of this function goes here
%   Detailed explanation goes here
minimum=0;
maximum=1;
Min = min(data);
Max = max(data);
[m,n]=size(data);
empty = [];
for i=1:n
    if(Min(i)==Max(i))
        empty = [empty;i];
        continue;
    end
    data(:,i) = (((data(:,i)-Min(i))./(Max(i)-Min(i)))*(maximum-minimum))+minimum;
end
c=0;
for i=1:length(empty)
    data(:,empty(i-c,1))=[];
    c=c+1;
end
norm_data = data;
end
