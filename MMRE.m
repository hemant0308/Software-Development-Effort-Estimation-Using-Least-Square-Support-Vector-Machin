function a = MMRE(actual,predicted)
    p = size(actual,1);
    a = (sum(abs(actual-predicted)./actual))/p;
end