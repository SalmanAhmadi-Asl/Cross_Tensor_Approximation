function [Y]=CTA_FS_Faster(X,R1,R2)

%This is the fast implementation of the CTA_FC algorithm. 

%The CTA_FC algorithm was developed in the following paper
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

X=double(X);
N_m=size(X);

[r,p_r]=myrandsample(N_m(3),R1);

C=X(:,:,r);

[r1r2,p_r1r2] = myrandsample(N_m(1)*N_m(2),R2);
[rr1,rr2] = ind2sub(N_m([1 2]),r1r2);
Xm = reshape(X,N_m(1)*N_m(2),[]);
R = Xm(r1r2,:);

W = Xm(r1r2,r);

D1 =  (1./sqrt(R1*p_r));
D2 =  (1./sqrt(R2*p_r1r2));

W2 = bsxfun(@times,bsxfun(@times,W,D2(:)),D1(:)');
RR=bsxfun(@times,bsxfun(@times,pinv(W2),D1(:)),D2(:)');

Y=tmprod(C,(RR*R)',3);

end

function [r,p] = myrandsample(n,k)
p = rand(n,1);
[p,ix] = sort(p);
r = ix(1:k);
p = p(1:k);
end
