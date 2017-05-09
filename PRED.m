function p = PRED(actual,predicted)
    m=size(actual,1);
    s=0;
    for i=1:m
        mmre = abs(actual(i)-predicted(i))/actual(i);
        if(mmre<0.25)
            s=s+1;
        end
    end
    p=s/m;
end