clear

// Ejercicio 5 

//x = [0, 1, 2, 3]
//y = [1, 3, 3, k]

// El método de Lagrange 

// La función que calcule Lk
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

//p_123(x) = L1(x)*y1 + L2(x)*y2 + L3(x)*k

//p_123(2.5) = L1(2.5)*3 + L2(2.5)*3 + L3(2.5)*k

a = 2.5
x1 = [1,2,3]
y1 = [3,3]

L1 = Lk(x1,1)
L2 = Lk(x1,2)
L3 = Lk(x1,3)

c1 = horner(L1, a) //L1(2,5)
c2 = horner(L2, a) //L2(2,5)
c3 = horner(L3, a) //L3(2,5)

k = (3 - c1*y1(1) - c2*y1(2)) / c3

printf("\n y3 = %f \n", k)

x = [0, 1, 2, 3]
y = [1, 3, 3, k]

p_0123 = interpolLagrange(x,y)

p_0123_a = horner(p_0123,a) 

printf("\n El polinomio de interpolación de Lagrange P_0,1,2,3 elevado en %f : %f \n", a, p_0123_a)

