function y = DeNorm(Y,Min,Max)
    y = ((Max-Min)*Y)+Min;
end