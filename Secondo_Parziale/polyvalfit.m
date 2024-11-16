function [P_int] = polyvalfit(x,y,n,x_v)
% [P_int] = polyvalfit(x,y,n,x_v): polyval+polyfit

P_int = polyval(polyfit(x,y,n),x_v);

end

   