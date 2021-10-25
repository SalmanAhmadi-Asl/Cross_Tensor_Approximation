function [output]=CUR_matrixOp(X,R1,R2)
%This is the implementation of the matrix CUR approximation with optimal middle matrix U.
% The columns and rows are sampled uniformly without replacement. Other probability distributions 
% can also be defined.

X=double(X);
N=size(X);
I=randsample(N(2),R1);
J=randsample(N(1),R2);
C=X(:,I);
R=X(J,:);

U=pinv(C)*X*pinv(R);
output=C*U*R;

end
