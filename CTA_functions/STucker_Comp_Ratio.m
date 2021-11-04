function [comp]=STucker_Comp_Ratio(X,l,m,n) 
T=size(X);
comp=(T(1)*T(2)*T(3))/(l*m*n+T(1)*l+T(2)*m+T(3)*n);
end
