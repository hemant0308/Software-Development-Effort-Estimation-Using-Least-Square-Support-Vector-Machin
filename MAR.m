function a = MAR(actual,predicted)
p=size(actual,1);
    a = sum(abs(actual-predicted))/p;
end