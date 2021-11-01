clear 

function p = newton_multivariable(f, x0, n)
    p_previous = x0 - (inv(numderivative(f,x0)))*f(x0)
    i = 0 
    while i < n
        p_current = p_previous - (inv(numderivative(f,p_previous)))*f(p_previous);
        i = i + 1;
        p_previous = p_current
    end
    p = p_current
endfunction


function y = F9(x)
  y(1) = 1 + x(1)^2 - x(2)^2 + exp(x(1)) * cos(x(2))
  y(2) = (2 * x(1) * x(2)) + (exp(x(1)) * sin(x(2)))
endfunction


x0 = [-1,4]'

n = 5

x = newton_multivariable(F9, x0, n)

disp(x)

