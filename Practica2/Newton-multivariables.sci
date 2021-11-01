clear

//Ej 9 

function y = F9(x)
  y(1) = 1 + x(1)^2 - x(2)^2 + exp(x(1)) * cos(x(2))
  y(2) = (2 * x(1) * x(2)) + (exp(x(1)) * sin(x(2)))
endfunction


//function y = F92(x)
//  y(1) = 1 + x(1)^2 - x(2)^2 + %e^(x(1)) * cos(x(2))
//  y(2) = (2 * x(1) * x(2)) +  %e^(x(1)) * sin(x(2))
//endfunction

x0 = [-1,4]'

//Ej 10 

function y = F10(x)
    y(1) = x(1)^2 + x(1)*x(2)^3 - 9
    y(2) = 3*x(1)^2*x(2) - 4 - x(2)^3
endfunction

//a
x0_a = [1.2, 2.5]'

//b 
x0_b = [-2, 2.5]'

//c
x0_c = [-1.2, -2.5]'

//d
x0_d = [2, -2.5]'

//Input:
// m - matriz
// x0 - vector inicial 
// n - número de ineraciónes

//TODO: chequear si J es singular 
//crear una función aparte que calcula una matriz Jacobiana



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














