datasets = {'albrecht.csv','china.csv','nasa93.csv','cocomo81.csv','finnish.csv'};
no_of_datasets = length(datasets);
for i=1:5
    [mar,mmre,pred,sa,delta,lsd,mbre,mibre] = ErrorMetrics(['datasets/',datasets{i}]);
    csvwrite(['error',datasets{i}],[mar,mmre,pred,sa,delta,lsd,mbre,mibre]);
end