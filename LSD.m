function l = LSD(actual,predicted)
    dif = (log(actual)-log(predicted));
    n = length(actual);
    v = var(dif,1);
    v = v/2;
    dif = dif+v;
    dif = dif.*dif;
    temp = sum(dif)/(n-1);
    l = sqrt(temp);
end