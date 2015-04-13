function model = mstep(X, R)
[d,n] = size(X);
k = size(R,2);

nk = sum(R,1);
w = nk/n;
mu = bsxfun(@times, X*R, 1./nk);

covariance = zeros(d,d,k);
sqrtR = sqrt(R);
for i = 1:k
    Xo = bsxfun(@minus,X,mu(:,i));
    Xo = bsxfun(@times,Xo,sqrtR(:,i)');
    covariance(:,:,i) = Xo*Xo'/nk(i);
    covariance(:,:,i) = covariance(:,:,i)+eye(d)*(1e-5);
end

model.mu = mu;
model.covariance = covariance;
model.weight = w;