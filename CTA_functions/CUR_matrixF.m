function [output]=CURT(X,R1,R2)
X=double(X);
N=size(X);
I=randsample(N(2),R1);
J=randsample(N(1),R2);
C=X(:,I);
R=X(J,:);
% U=pinv(X(J,I));
U=pinv(C)*X*pinv(R);
output=C*U*R;
%  size(output)
end