function R = estep(X, model)
mu = model.mu;
covariance = model.covariance;
w = model.weight;

n = size(X,2);
k = size(mu,2);
loggaussian = zeros(n,k);

for i = 1:k
    loggaussian(:,i) = loggausspdf(X,mu(:,i),covariance(:,:,i));
end
loggaussian = bsxfun(@plus,loggaussian,log(w));
T = logsum(loggaussian,2);
logR = bsxfun(@minus,loggaussian,T);
R = exp(logR);