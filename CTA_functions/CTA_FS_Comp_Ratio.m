function [comp]=CTA_FS_Comp_Ratio(X,l,n) 
T=size(X);
comp=(T(1)*T(2)*T(3))/((T(1)*T(2)*l)+(n*T(3)));
end
