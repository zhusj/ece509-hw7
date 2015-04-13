function s = logsum(x, dim)
if nargin == 1, 
    dim = find(size(x)~=1,1);
    if isempty(dim), dim = 1; end
end

y = max(x,[],dim);
x = bsxfun(@minus,x,y);
s = y + log(sum(exp(x),dim));
i = find(~isfinite(y));
if ~isempty(i)
    s(i) = y(i);
end
