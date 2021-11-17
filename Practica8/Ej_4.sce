clear

// Ejercicio 4

// El método compuesto de trapecio 

// la función que resuelve integral definida de una función
// usando el método compuesto del trapecio 

// Input: 
// a, b - extremos de integración 
// f - la función 
// n - cantidad de subintervalos

// Output: 
// w - - aproximación de la integral de f en [a,b] por el método compuesto de trapecio 

function w = trapecio_compuesto(a,b,f,n)
    h = (b-a)/n
    w = (f(a)/2) + (f(b)/2)
    for i = 1:n-1
        w = w + f(a+i*h)
    end
    w = h*w
endfunction

// El método compuesto de Simpson 

// la función que resuelve integral definida de una función
// usando el método compuesto del Simpson 

// Input: 
// a, b - extremos de integración 
// f - la función 
// n - cantidad de subintervalos, un número par  

// Output: 
// w - - aproximación de la integral de f en [a,b] por el método compuesto de Simpson

function w = simpson_compuesto(a,b,f,n)
    h = (b-a)/n
    w = f(a) + f(b)
    for i = 1:(n-1)
        x_i = a + i*h
        if modulo(i,2)==0
            then w = w + 2*f(x_i)
        else  w = w + 4*f(x_i)
        end
    end
    w = h/3 * w
endfunction



deff('y=f(x)', 'y=(x+1)^(-1)')

apr_trapecio = trapecio_compuesto(0, 1.5, f, 10)
apr_simpson = simpson_compuesto(0, 1.5, f, 10)
valor_exacto = 0.9162907

err_abs_trapecio = abs(valor_exacto - apr_trapecio)
err_rel_trapecio = err_abs_trapecio / abs(valor_exacto)

err_abs_simpson = abs(valor_exacto - apr_simpson)
err_rel_simpson = err_abs_simpson / abs(valor_exacto)


disp("Aproximación usando el método de trapecio compuesto:")
disp(apr_trapecio)
disp("Error absoluto: " + string(err_abs_trapecio) + "; Error relativo: " + string(err_rel_trapecio))
disp("Aproximación usando el método de simpson compuesto: ")
disp(apr_simpson)
disp("Error absoluto: " + string(err_abs_simpson) + "; Error relativo: " + string(err_rel_simpson))




