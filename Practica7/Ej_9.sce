clear 

// Ejercicio 9

// El método de Lagrange 

// La función que calcula Lk
// para el polinomio interpolador de Lagrange

// Input: 
// x - el vector [x0, x1, x2, .... xn], donde xi (i = 0...n) - los puntos por cuales pasa el polinomio 
// k - indice de x, 0 < k < n 

// Output:
// Lk - un polinomio, que forma parte del polinomio interpolador de Lagrange


function y = Lk(x,k)
    [Xn, Xm] = size(x)
    r = [x(1:k-1) x(k+1:Xm)]
    p = poly(r,'x','roots')
    pk = horner(p,x(k))
    y = p / pk
endfunction

// La función que calcule el polinomio interpolador de Lagrange

// Input: 
// x = el vector [x0, x1, x2, .... xn], donde xi (i = 0...n) - los puntos por cuales pasa el polinomio 
// y - el vector tal que f(xi) = yi
 
function z = interpolLagrange(x,y)
    [Xn, Xm] = size(x)
    pol = 0
    for k = 1:Xm
        pol = pol + (Lk(x,k) * y(k))
    end
    z = pol
endfunction


// Definimos la función f(x) = 1 / (1 + x^2)

function y = f(x)
    y = 1 ./ (1. + x.^2)
endfunction


//deff('y = f(x)', 'y = 1 ./ (1 + x^2)') 

// La función que calcula el polinomio interpolador de Lagrange
// en el intervalo [-5,5]
// para la función f(x) definida anteriormente 
// y para n dado 

function p = interpolLagrange_2(n)
    x = linspace(-5,5,n)
    m = length(x)
    p = 0 
    for k = 1:m
        p = p + (Lk(x,k) * f(x(k)))
    end
    
endfunction

// La función que grafica el error f(x) - Pn(x)
// donde Pn(x) - el polinomio interpolador de Lagrange 

function errorInterpol(n, clr)
    p = interpolLagrange_2(n+1)
    x = -5:.01:5
    plot2d(x, (f(x) - horner(p,x)), style = color(clr))
endfunction

a = gca(); a.x_location = 'origin'; a.y_location = 'origin';

errorInterpol(2, 'red')
errorInterpol(4, 'green')
errorInterpol(6, 'blue')
errorInterpol(10, 'grey')
errorInterpol(14, 'purple')

// Cuando aumenta n, aumenta el error en los bordes del intervalo 
// (Fenómeno de Runge)
