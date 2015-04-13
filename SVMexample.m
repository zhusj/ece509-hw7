n = 50; %we split this into training, teacher and testing
d=3;
s = RandStream('mcg16807', 'Seed',0)
RandStream.setDefaultStream(s)
X = randn(n,d);
randnoise = randn(n,1);
Y1 = ((X(:,1)+X(:,2)+randnoise)>0)*2-1;

%Y2 is different from Y1 but uses the same variables
randnoise2 = randn(n,1);
Y2 = ((5*X(:,1)-3*X(:,2)+randnoise2)>0)*2-1;
Y=[Y1 Y2];

% This is the cost of slack for SVM.
C = 2;  %approx same magnitude as norm(w,2) when w is [1 1 0]

%cvx converts to dual automatically, automatically installs sedumi solver
%download http://cvxr.com/cvx/ then run 'cvx_setup' from matlab

%I split data into two datasets, first 30 points and then points 31-150, I
n=30;
Yt=Y(1:n,1); %pick the X and Y for the particular SVM inside the loop
Xt=X(1:n,:); %X is the same and Y is different
Ct= norm(mean(abs(Xt))); %better estimate for C
cvx_begin %classical svm
    variables wtrain(d) e(n) btrain
    dual variable alphatrain
    minimize( 0.5*wtrain'*wtrain + Ct*sum(e)) %norm(w) almost works except it takes an extra sqrt
    subject to
        Yt.*(Xt*wtrain+btrain)-1 +e >0   :alphatrain;
        e>0; %slack
cvx_end