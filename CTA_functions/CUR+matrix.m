function [output]=CUR_matrix(X,R1,R2)

%implementation of the matrix CUR approximation with optimal middle matrix (U)
%The columns and rows are sampled are uniformly without replacement.
%Other probability distributions can be also used.
X=double(X);
N=size(X);
I=randsample(N(2),R1);
J=randsample(N(1),R2);
C=X(:,I);
R=X(J,:);

U=pinv(C)*X*pinv(R);
output=C*U*R;
end
