function [mar,mmre,pred,sa,delta,lsd,mbre,mibre] = ErrorMetrics(filename)
    dataset = csvread(filename);
    [m,n] = size(dataset);
    p = floor(m*30/100);
    mar = zeros(30,1);
    mmre = zeros(30,1);
    pred = zeros(30,1);
    sa = zeros(30,1);
    delta = zeros(30,1);
    lsd = zeros(30,1);
    mbre = zeros(30,1);
    mibre = zeros(30,1);
    for i= 1:30
        dt = zeros(p,n);
        for j = 1:p
            k = randi([1 m]);
            dt(j,:) = dataset(k,:);
        end
        [actual,predicted,random] = crossvalidation(dt);
        [sa(i,1),delta(i,1)] = SA(actual,predicted,random);
        lsd(i,1) = LSD(actual,predicted);
        mar(i,1) = MAR(actual,predicted);
        mmre(i,1) = MMRE(actual,predicted);
        pred(i,1) = PRED(actual,predicted);
        mbre(i,1) = MBRE(actual,predicted);
        mibre(i,1) = MIBRE(actual,predicted);
    end
end