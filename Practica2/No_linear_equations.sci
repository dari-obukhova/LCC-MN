clear 

//agregar condición f(c) == 0

// Aproximación de la raiz de una función usando methodo de biseccion
// Input: 
// f - la función 
// a . b - extremos de un intervalo 
// e - un error 

// Ej 2. Funciones
//a
function y = f1(x) 
    y = sin(x) - (x^2)/2
 endfunction

//b 
function y = f2(x) 
    y = %e^(-x) - x^(-4)
 endfunction
 
//c
function y = f3(x) 
    y = log(x) - x +1
 endfunction


function raiz = biseccion (f, a, b, e)
    if f(a)*f(b) > 0 then
        raiz = %nan;
    else
        c = (a+b)/2;
///        if f(c) == 0 then raiz = c;
        while (b-c) > e
            if f(b)*f(c) < 0 then 
                    a = c;
                else 
                    b = c;
                end
                c = (a+b)/2;
            end
            raiz = c;
        end
endfunction

//Método de la Secante
// Input: 
// f - función
// x0, x1 - los puntos iniciales para obtener una secante
// n - número de iteraciónes
// Output: 
// raiz 

function raiz = secant(f, x0, x1, n)
    x_actual = x1
    x_previous = x0
    for i = 1:1:n
        x = x_actual - f(x_actual)*((x_actual-x_previous)/(f(x_actual)-f(x_previous)))
        x_previous = x_actual
        x_actual = x
    end
    raiz = x_actual
endfunction


