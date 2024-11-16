function [xvect,it] = gaussnewton_vett(x0,nmax,toll,fun,jac,type)
%GAUSSNEWTON_VETT GaussNewton's method for vectorial function
%   [xvect,it] = gaussnewton_vett(x0,nmax,toll,fun,jac,type)
%   INPUT:
%     x0: starting point
%     nmax:max number of iteration
%     toll: tollerance(between consecutive iterations)
%     fun:the function(as function handle)
%     jac: the function jacobian(as function handle)
%     type:type of function:
%           -'var': if it has a finite number of vars
%           -'vet': if it takes a vector x
%   OUTPUT:
%   xvect: vector solutions
%   it:number of iterations
it=0;
xvect=x0;
err=toll+1;
if(strcmp(type,'var')~=1 && strcmp(type,'vet')~=1)
    error("Error: invalid type. Use var or vett");
end
x=x0;
while(it<nmax && err>toll)
    if(strcmp(type,'var')==1)
        xeval=num2cell(x);
        B=jac(xeval{:});
         if(det(jac(B'*B))==0)
             error("Error: error, jac(B'B) is singular in x");
         end
         deltax=(B'*B)\(-B'*fun(xeval{:}));
    else
        B=jac(x);
         if(det(jac(B'*B))==0)
             error("Error: error, jac(B'B) is singular in x");
         end
        deltax=(B'*B)\(-B'*fun(x));
    end
    x=x+deltax;
    xvect=[xvect,x];
    it=it+1;
    err=norm(deltax);
end
end

