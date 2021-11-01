clear 

function p = newton_multivariable(f, x0, n, eps)
    p_previous = x0 - (inv(numderivative(f,x0)))*f(x0)
    i = 0 
    while (i < n) && (norm(p_current - p_previous) <= eps)
        p_current = p_previous - (inv(numderivative(f,p_previous)))*f(p_previous);
        i = i + 1;
        p_previous = p_current
    end
    p = p_current
endfunction


function y = f(x)
  y = 2 * x(1) + 3 * x(2)^2 + exp((2 * x(1)^2) + x(2)^2)
endfunction

// derivadas respecto de x e y
function y = F11(x)
  y(1) = 2 + exp(2*x(1)^2 + x(2)^2) * 4*x(1)
  y(2) = 6 * x(2) + exp(2*x(1)^2 + x(2)^2) * 2*x(2)
endfunction

// Item )
