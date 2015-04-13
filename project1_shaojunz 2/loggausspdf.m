function y = loggausspdf(X, mu, covariance)
d = size(X,1);
X = bsxfun(@minus,X,mu);
[U,p]= chol(covariance);
if p ~= 0
    error('ERROR: covariance is not positive definite.');
end
Q = U'\X;
q = dot(Q,Q,1);  
c = d*log(2*pi)+2*sum(log(diag(U)));   
y = -(c+q)/2;