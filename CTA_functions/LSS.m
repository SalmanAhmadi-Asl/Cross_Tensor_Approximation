function [Y]=LSS(X,R)

%This is the implementation of the Lateral slice selection (LSS) algorithm.%

N_m=size(X);

r_1=randsample(N_m(2),R);
FC=X(:,r_1,:);

Y=tprod(FC,tprod(t_pinv(FC),X));

end
