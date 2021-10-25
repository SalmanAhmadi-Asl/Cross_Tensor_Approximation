function [output]=CUR_matrixF(X,R1,R2)
% This is the implementation of the matrix CUR approximation, 
% whose middle matrix U is defined as the intersection matrix of 
% selected columns and rows. The columns and rows are sampled 
% uniformly without replacement.

X=double(X);
N=size(X);
I=randsample(N(2),R1);
J=randsample(N(1),R2);
C=X(:,I);
R=X(J,:);
U=pinv(X(J,I));

output=C*U*R;

end
