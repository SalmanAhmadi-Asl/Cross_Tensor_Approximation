function [Y]=F_TCT(X,R1,R2)

%This is implementation of the Fast Tubal CTA (F-TCTA) or single-pass tubal CTA algorithm.

N_m=size(X);
FX=fft(X,[],3);

r1=randsample(N_m(2),R1);
FC=X(:,r1,:);

SZ_r1=size(r1);

r2=randsample(N_m(1),R2);
FR=X(r2,:,:);
SZ_r2=size(r2);

U=t_pinv(X(r2,r1,:));

Y=tprod(tprod(FC,U),FR);
end
