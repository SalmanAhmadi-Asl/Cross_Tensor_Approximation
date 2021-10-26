function [Y]=HOID(X,R_1,R_2,R_3)

% This is the implementation of the HOID algorithm developed in 
% @article{saibaba2016hoid,
%   title={HOID: higher order interpolatory decomposition for tensors based on Tucker representation},
%   author={Saibaba, Arvind K},
%   journal={SIAM Journal on Matrix Analysis and Applications},
%   volume={37},
%   number={3},
%   pages={1223--1249},
%   year={2016},
%   publisher={SIAM}
% }
%(R_1,R_2,R_3) is the Tucker rank 

C{1}=double(tenmat(X,[1]));
SZ_C_1=size(C{1});
 
C{2}=double(tenmat(X,[2]));
SZ_C_2=size(C{2});
 
C{3}=double(tenmat(X,[3]));
SZ_C_3=size(C{3});


[~,~,r]=qr(C{1},'vector');
r=r(1:R_1);
D{1}=C{1}(:,r);
Q{1}=pinv(D{1});


[~,~,r]=qr(C{2},'vector');
r=r(1:R_2);
D{2}=C{2}(:,r);
Q{2}=pinv(D{2});


[~,~,r]=qr(C{3},'vector');
r=r(1:R_3);
D{3}=C{3}(:,r);
Q{3}=pinv(D{3});

Core=tmprod(X,Q,[1,2,3]);
Y=tmprod(Core,D,[1,2,3]);
end
