function [Y]=LSS(X,R)

N_m=size(X);

r_1=randsample(N_m(2),R);
FC=X(:,r_1,:);

Y=tprod(FC,tprod(t_pinv(FC),X));

end
