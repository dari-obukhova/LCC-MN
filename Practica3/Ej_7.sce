clear 


// Ejercicio 7 

function output = longitudDeOnda(d)
    output = 4 * %pi^2 / (25 * 9.8 * tanh (4 * d)) 
endfunction

// Item (a)

function x = fixedPointIteration(f, x, eps)
    while abs (f (x) - x) > eps
        x = f (x)
    end
endfunction

x1 = fixedPointIteration(longitudDeOnda, 1, 10^(-1))

disp(x1)

// Item (b)

function raiz = newton(fun,x0,tol,iter)
    deff("y=f(x)","y="+fun);
    i = 0;
    x1 = x0 - f(x0)/numderivative(f,x0)
    while abs(x1-x0)>tol && i < iter
        i = i+1;
        x0 = x1;
        x1 = x0 - f(x0)/numderivative(f,x0)
    end
    if (abs(x1-x0)> tol) then disp('Se alcanzo el máximo de iteraciones'); end
    disp(i);
    raiz = x1;
endfunction

x2 = newton('longitudDeOnda(x) - x', x1, 10^(-4), 10000)

disp(x2)
