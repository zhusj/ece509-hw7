function [model] = mle(X, Y)

[d,n] = size(X);
label = Y;
k = max(label);
R = full(sparse(1:n,label,1,n,k,n));
[~,label(1,:)] = max(R,[],2);
R = R(:,unique(label));

max_iter = 300;
t = 1;
while t < max_iter
    t = t+1;
    model = mstep(X,R);
    R = estep(X,model);
end