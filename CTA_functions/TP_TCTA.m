function [Y]=TP_TCTA(X,R1,R2)
N_m=size(X);
FX=fft(X,[],3);

r1=randsample(N_m(2),R1);
FC=X(:,r1,:);

SZ_r1=size(r1);

r2=randsample(N_m(1),R2);
FR=X(r2,:,:);
SZ_r2=size(r2);

U=tprod(tprod(t_pinv(FC),X),t_pinv(FR));

Y=tprod(tprod(FC,U),FR);
end