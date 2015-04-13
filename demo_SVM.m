A = [1 2 1; 3 2 1; 2 3 1; 3 3 1; 1 1 1; 2 0 1; 2 1 1; 3 1 1];
b = ones(8, 1);
y = [-1; -1; -1; -1; 1; 1; 1; 1];
Y = repmat(y, 1, 3);
cvx_begin
variable w(3)
minimize norm(w)
subject to
(Y.*A)*w >= b
cvx_end
