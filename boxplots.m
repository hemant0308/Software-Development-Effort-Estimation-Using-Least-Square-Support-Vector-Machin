alb = csvread('erroralbrecht.csv');
china = csvread('errorchina.csv');
cocomo = csvread('errorcocomo81.csv');
nasa = csvread('errornasa93.csv');
fin = csvread('errorfinnish.csv');
delete erroralbrecht.csv;
delete errorchina.csv;
delete errornasa93.csv;
delete errorfinnish.csv;
delete errorcocomo81.csv;
mkdir boxplots;
%By changing this order we can change the order of datasets in boxplot

%This is for MAR
boxplot([alb(:,1),china(:,1),cocomo(:,1),nasa(:,1),fin(:,1)],'labels',{'albrecht','china','cocomo81','nasa93','finnish'});
xlabel('datasets');
ylabel('boxplots/MAR');
title('Least Square Support Vector Machine');
savefig('boxplots/mar');
%This is for MMRE
boxplot([alb(:,2),china(:,2),cocomo(:,2),nasa(:,2),fin(:,2)],'labels',{'albrecht','china','cocomo81','nasa93','finnish'});
xlabel('datasets');
ylabel('MMRE');
title('Least Square Support Vector Machine');
savefig('boxplots/mmre');
%This is for PRED Value
boxplot([alb(:,3),china(:,3),cocomo(:,3),nasa(:,3),fin(:,3)],'labels',{'albrecht','china','cocomo81','nasa93','finnish'});
xlabel('datasets');
ylabel('PRED');
title('Least Square Support Vector Machine');
savefig('boxplots/pred');
boxplot([alb(:,4),china(:,4),cocomo(:,4),nasa(:,4),fin(:,4)],'labels',{'albrecht','china','cocomo81','nasa93','finnish'});
xlabel('datasets');
ylabel('Standard Accuracy');
title('Least Square Support Vector Machine');
savefig('boxplots/sa');
%This is for Delta Value
boxplot([alb(:,5),china(:,5),cocomo(:,5),nasa(:,5),fin(:,5)],'labels',{'albrecht','china','cocomo81','nasa93','finnish'});
xlabel('datasets');
ylabel('Delta');
title('Least Squal/re Support Vector Machine');
savefig('boxplots/delta');
%This is value for mbre value
boxplot([alb(:,7),china(:,7),cocomo(:,7),nasa(:,7),fin(:,7)],'labels',{'albrecht','china','cocomo81','nasa93','finnish'});
xlabel('datasets');
ylabel('MBRE');
title('Least Square Support Vector Machine');
savefig('boxplots/mbre');
%This is for MIBRE value
boxplot([alb(:,8),china(:,8),cocomo(:,8),nasa(:,8),fin(:,8)],'labels',{'albrecht','china','cocomo81','nasa93','finnish'});
xlabel('datasets');
ylabel('MIBRE');
title('Least Square Support Vector Machine');
savefig('boxplots/mibre');