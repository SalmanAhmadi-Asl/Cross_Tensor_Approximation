function [comp] =LSS_Comp_Ratio(X,R)
T=size(X);
comp=(numel(X))/(T(1)*R*T(3)+R*T(2)*T(3));
end