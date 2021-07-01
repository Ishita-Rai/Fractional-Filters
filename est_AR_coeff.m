function [A,logL,EstMdl] = est_AR_coeff(n,x)
% estimate coefficients of AR filter where n is order and x is input signal
Mdl = arima('ARLags',1:n,'Constant',0);
[EstMdl,~,logL] = estimate(Mdl,x);% estimate paramters of AR model
A = cell2mat(EstMdl.AR);
end