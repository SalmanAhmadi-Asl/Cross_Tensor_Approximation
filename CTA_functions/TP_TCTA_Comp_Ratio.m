function [comp]=TP_TCTA_Comp_Ratio(X,R1,R2) 
T=size(X);
comp=(T(1)*T(2)*T(3))/(T(1)*T(3)*R1+R1*R2*T(3)+R2*T(2)*T(3));
end
