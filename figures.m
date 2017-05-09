cd datasets;
datasets = ls;
no_of_datasets = length(datasets);
cd ..;
mkdir figures;
%All metrics values are saved in results.csv file
fp = fopen('results.csv','w');
fprintf(fp,'dataset,MAR,MMRE,Pred,StandardAccuracy,Delta,MBRE,MIBRE,LSD\n');
for i=3:no_of_datasets
    dataset = csvread(['datasets/',datasets(i,:)]);
    [actual,predicted,random] = crossvalidation(dataset);
    %we take randomly 30 points and plot
    p=min(30,length(actual));
    x=1:p;
    x=x';
    y1=zeros(p,1);
    y2=zeros(p,1);
    pp=randperm(length(actual),p);
    for ii=1:p
        y1(ii)=actual(pp(ii),1);
        y2(ii)=predicted(pp(ii),1);
    end
    plot(x,y1,'-.*',x,y2,'-o'),title(datasets(i,:)),legend('predicted outputs','actual outputs'),xlabel('project No'),ylabel('effort (person months)');
    savefig(['figures/',datasets(i,:),'.fig']);
    mar = MAR(actual,predicted);
    mmre = MMRE(actual,predicted);
    pred = PRED(actual,predicted);
    [sa,delta] = SA(actual,predicted,random);
    mbre = MBRE(actual,predicted);
    mibre = MIBRE(actual,predicted);
    lsd = LSD(actual,predicted);
    fprintf(fp,'%s,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f\n',datasets(i,:),mar,mmre,pred,sa,delta,mbre,mibre,lsd);
end
fclose(fp);