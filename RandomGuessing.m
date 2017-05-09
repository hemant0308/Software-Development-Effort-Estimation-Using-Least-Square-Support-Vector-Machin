function y = RandomGuessing(Y)
    [m,n] = size(Y);
    s = 0;
    for i = 1:1000
        randp = randi(m);
        s = s + Y(randp,1);
    end
    y = s/1000;
end