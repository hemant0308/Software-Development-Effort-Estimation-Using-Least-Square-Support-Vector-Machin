function [sa,delta] = SA(actual,predicted,random)
    marpi = mar(actual,predicted);
    marp0 = mar(actual,random);
    sa = (1-(marpi/marp0))*100;
    delta = (marpi-marp0)/std(random);
end