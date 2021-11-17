clear 

// Ejercicio 11 

// La función que dado un grado
// calcula raices del polinomio de Chebyshev


function r = cheb(n)
    for k = 0:n-1
        r(k+1) = cos((%pi/2*(1+2*k))/n)
    end
endfunction

// La función que realiza un cambio lineal
// para obtener los nodos de interpolación a partir de pol Chebyshev 
// fuera de intervalo [-1,1]

function nodes = cheb_ab(n,a,b)
    r = cheb(n)
    for k=1:n
        nodes(k) = (r(k)*(b-a) + (a+b))/2
    end
endfunction


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
    p = poly(r,'x','roots')
    pk = horner(p,x(k))
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

nodes = cheb_ab(4,0,%pi/2)
y = cos(nodes)
poli_interpol = interpolLagrange(nodes',y)
disp(poli_interpol)

disp('Los nodos de interpolación:')
disp(nodes)

rango = 0:0.01:2
a = gca(); a.x_location = 'origin'; a.y_location = 'origin';

plot2d(rango, cos(rango), style = color('red'))
plot2d(rango, horner(poli_interpol,rango), style = color('blue'))
