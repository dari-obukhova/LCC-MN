clear 

// Ejercicio 1

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

// Ejemplos 

//x1 = [0, 1, 2]
//y1 = [-1, -1, 7]


////

// Item (a)

//lineal 

x1 = [0 0.2]
y1 = [1 1.2214]

// cubica

x2 = [0 0.2 0.4 0.6]
y2 = [1 1.2214 1.4918 1.8221]

lineal = interpolLagrange(x1,y1)
cubica = interpolLagrange(x2,y2)

// ____________________________
// Para graficar aproximaciones

//rango = [-2:0.01:2]

//plot(rango, horner(lineal,rango), 'r')
//plot(rango, horner(cubica, rango), 'b')
//plot(rango, exp(rango), 'g')

//a = gca(); a.x_location = 'origin'; a.y_location = 'origin';

//h1 = legend('Lineal', 'Cubico', 'e^x')

// _____________________________

// Item (b)


// Funciones que calculan los errores de interpolación 
// para el caso de la función exp 

function e = error_lineal(vector, x, cx)
    e = (((x-vector(1))*(x-vector(2)))/2) * exp(cx) // exp(x)'' = exp(x)
endfunction

function e = error_caso_general(vector, x, cx, n)
    Fn = poly(vector,  'x', 'roots')
    poly_error = Fn / factorial(n+1)
    e = horner(poly_error, 1/3) * exp(cx) //  exp(x)' = exp(x)
endfunction

printf("\n El método de Lagrange\n")

er1_cota_superior = error_lineal(x1, 1/3, max(x1))
er1_cota_inferior = error_lineal(x1, 1/3, min(x1))
printf("\n %f < error lineal < %f \n", er1_cota_inferior, er1_cota_superior)

er2 = abs(exp(1/3) - horner(lineal, 1/3))
printf("\n Error exacto: ")
disp(er2)

printf("\n Error de la interpolación cubica: \n")
er3_cota_superior = error_caso_general(x2, 1/3, max(x2), 3)
er3_cota_inferior = error_caso_general(x2, 1/3, min(x2), 3)
printf("\n %f < error cubico < %f \n", er3_cota_inferior, er3_cota_superior)

er4 = abs(exp(1/3) - horner(cubica, 1/3))
printf("\n Error exacto: ")
disp(er4)


// El método de Newton 

// Diferencias divididas

// TODO: Reescribir esta función de manera eficiente

function dd = diferencias_divididas(f, x)
    
    [m,n] = size(x)
    
    if n == 2 then
        
        dd = (f(x(2)) - f(x(1))) / (x(2) - x(1))
        
    else
        
    f1 = diferencias_divididas(f, x(2:n))
    f2 = diferencias_divididas(f, x(1:n-1))
    
    dd = (f1 - f2) / (x(n) - x(1))
    
    end

endfunction


function p = dd_newton(f, x, n)
    
    f0 = f(x(1))
    
    i = 2
    
    p = f0
    
    while (i <= n )
        px = poly(x(1:i-1),'x','roots')
        p = f0 + px * diferencias_divididas(f, x(1:i))
        f0 = p
        i = i + 1
    end

endfunction

//printf("\n Polinomio de interpolación por diferencias divididas de Newton: ")
poli_dd_newton_lineal = dd_newton(exp, x2, 2)
poli_dd_newton_cubica = dd_newton(exp, x2, 3)

// ____________________________
// Para graficar aproximaciones

rango = [-2:0.01:2]

plot(rango, horner(poli_dd_newton_lineal,rango), 'r')
plot(rango, horner(poli_dd_newton_cubica, rango), 'b')
plot(rango, exp(rango), 'g')

a = gca(); a.x_location = 'origin'; a.y_location = 'origin';

h1 = legend('Lineal', 'Cubico', 'e^x')

// _____________________________


printf("\n Aproximación de exp(1/3) por la interpolación por diferencias de Newton")

aproximación_por_newton_lineal = horner(poli_dd_newton_lineal, 1/3)
aproximación_por_newton_cubica = horner(poli_dd_newton_cubica, 1/3)

disp(aproximación_por_newton_lineal)
disp(aproximación_por_newton_cubica)


