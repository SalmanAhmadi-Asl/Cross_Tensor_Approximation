function [Y]=CTA_FS(X,M,N)
%This is the implementation of the tensor CUR decomposition introduced in 
%
% @article{mahoney2008tensor,
%   title={Tensor-CUR decompositions for tensor-based data},
%   author={Mahoney, Michael W and Maggioni, Mauro and Drineas, Petros},
%   journal={SIAM Journal on Matrix Analysis and Applications},
%   volume={30},
%   number={3},
%   pages={957--987},
%   year={2008},
%   publisher={SIAM}
% }
%The algorithm selects a part of frontal slices and tubes of a 3rd order data tensor and based on them, an approximation 
%of the underlying data tensor is computed.

X=double(X);
N_m=size(X);

r=randsample(N_m(3),M);

C=X(:,:,r);

[Sz_1,Sz_2,Sz_3]=size(C);

for i=1:N
r1 = randi([1 N_m(1)],1,1);
r2 = randi([1 N_m(2)],1,1);
rr1(i)=r1;
rr2(i)=r2;
R(i,:)=(X(r1,r2,:));
end

for i=1:N
for j=1:M
W(i,j)=X(rr1(i),rr2(i),r(j));
end
end

D1=zeros(size(W,2),size(W,2));
D2=zeros(size(W,1),size(W,1));
for i=1:size(W,2)
D1(i,i)=1/sqrt(size(W,1));
end

for i=1:size(W,1)
D2(i,i)=1/sqrt(size(W,2));
end

RR=D1*pinv(D2*W*D1)*D2;
Y=tmprod(C,(RR*R)',3);

end
