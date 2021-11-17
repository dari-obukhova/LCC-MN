clear 

// Ejercicio 10 

// La función que retorne polinomio de Chebyshev de cierto grado n 
// y sus raices correspondientes

function p = poliChebyshev(n)
    
    if n == 0 then 
        p = poly([1], 'x','c')
    elseif n == 1 then 
        p = poly([0 1], 'x', 'c')
    elseif n == 2 then 
        p = poly([-1 0 2], 'x', 'c')
    else 
        p = poly([0 2], 'x', 'c') * poliChebyshev(n-1) - poliChebyshev(n-2)
    end
    
endfunction

function r = cheb(n)
    for k = 0:n-1
        r(k+1) = cos((%pi/2*(1+2*k))/n)
    end
endfunction

n = 4 
//nodos = [roots(poliChebyshev(n))]'
nodos = [cheb(4)]'

// El método de Lagrange 

// La función que calcula Lk
// para el polinomio interpolador de Lagrange

// Input: 
// x - el vector [x0, x1, x2, .... xn], donde xi (i = 0...n) - los puntos por cuales pasa el polinomio 
// k - indice de x, 0 < k < n 

// Output:
// Lk - un polinomio, que forma parte del polinomio interpolador de Lagrange

function y = Lk(x,k)
    Xm = length(x)
    r = [x(1:k-1) x(k+1:Xm)]
    p = real(poly(r,'x','roots'))
    pk = real(horner(p,x(k)))
    y = p / pk
endfunction



// La función que calcule el polinomio interpolador de Lagrange

// Input: 
// x = el vector [x0, x1, x2, .... xn], donde xi (i = 0...n) - los puntos por cuales pasa el polinomio 
// y - el vector tal que f(xi) = yi

// Output:
// z - polinomio de interpolación 


function z = interpolLagrange(x,y)
    Xm = length(x)
    pol = 0
    for k = 1:Xm
        pol = pol + (Lk(x,k) * y(k))
    end
    z = pol
endfunction

y = exp(nodos)
poli_de_interpol = real(interpolLagrange(nodos, y))

disp('Polinomio de interpolación:')
disp(poli_de_interpol)

// Item (b)

rango = -1:0.01:1
a = gca(); a.x_location = 'origin'; a.y_location = 'origin';

plot2d(rango, (exp(rango) - horner(poli_de_interpol,rango)), style = color('red'))

//plot2d(rango, exp(rango), style = color('blue'))
//plot2d(rango, horner(poli_de_interpol,rango), style = color('green'))



