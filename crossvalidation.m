function [actual_outputs,algorithm_outputs,random_outputs] = crossvalidation(dataset)
%This function takes mxn matrix as input and do leave one out cross validation
%First n-1 columns contains input and last nth column contains output
%It returns 3 mx1 vectors
    type = 'function estimation';    
    [r,c] = size(dataset);
    X=dataset(:,1:c-1);
    X=Norm(X);
    Y=dataset(:,c);
    Min = min(Y);
    Max = max(Y);
    Y=Norm(Y);
    [gam,sig2] = tunelssvm({X,Y,type,[],[],'RBF_kernel'},'simplex','leaveoneoutlssvm',{'mse'});
    actual_outputs = zeros(r,1);
    algorithm_outputs = zeros(r,1);
    random_outputs = zeros(r,1);
    for i=1:r
        input = zeros(r-1,size(X,2));
        output = zeros(r-1,1);
        k=1;
        for j=1:r
            if j~=i
                input(k,:) = X(j,:);
                output(k,:) =Y(j,1);
                k = k+1;
            end
        end
        model = {input,output,type,gam,sig2,'RBF_kernel'};
        [alpha,b] = trainlssvm(model);
        actual_output = Y(i,1);
        algorithm_output = simlssvm(model,{alpha,b},X(i,:));
        random_output = RandomGuessing(output);
        actual_outputs(i,1) = DeNorm(actual_output,Min,Max);
        algorithm_outputs(i,1) = DeNorm(algorithm_output,Min,Max);
        random_outputs(i,1) = DeNorm(random_output,Min,Max);
    end
end