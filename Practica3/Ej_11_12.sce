// Ejercicio 11
function y = f(x)
  y = 2 * x(1) + 3 * x(2)^2 + exp((2 * x(1)^2) + x(2)^2)
endfunction

// derivadas respecto de x e y
function y = F11(x)
  y(1) = 2 + exp(2*x(1)^2 + x(2)^2) * 4*x(1)
  y(2) = 6 * x(2) + exp(2*x(1)^2 + x(2)^2) * 2*x(2)
endfunction


// Dado un sitema de ecuaciones F y un punto inicial x,
// obtiene una solución aproximada al sistema F(v) = 0 con el método de newton multivariable
// con un criterio de finalización norm(x(k) - x(k-1)) <= eps y un máximo iter de iteraciones
function v = Ejercicio11(F, x, eps, iter)
    for i = 1: iter
        Jinv = inv(numderivative(F, x))
        xNuevo = x - (Jinv * F(x))
        if norm(xNuevo - x) <= eps then
            v = x; return
        end
        x = xNuevo
    end
    v = %nan
endfunction

// a)

// --> r = Ejercicio11(F11, [1 1]', 1e-12, 1000)
//  r  = 
//   -0.3765446
//    2.640D-16

// --> F11(r)
//  ans  =
//   -1.399D-13
//    2.285D-15


// b)
// --> numderivative(F11, r)
//  ans  =
//    8.3238127   0.      
//   -1.056D-15   8.655728

// Vemos sus autovalores
// --> spec(ans)
//  ans  =
//    8.655728  + 0.i
//    8.3238127 + 0.i

// Como son positivos, verifican (ii)



// Ejercicio 12

// a)

function y = g12(k, r)
    y = k(1) * %e ^ (k(2) * r) + k(3) * r
endfunction

function y = F12(k)
    y(1) = g12(k, 1) - 10
    y(2) = g12(k, 2) - 12
    y(3) = g12(k, 3) - 15
endfunction


// -> k = metodo_newton_multivariable(F12, [1 2 3]', 1e-12, 100)
//  k  =
//    8.7712864
//    0.2596954
//   -1.3722813

// --> norm(F12(k))
//  ans  =
//    5.024D-15


// b)

// Dada la carga de 
function y = g(x)
    y = 500 / (%pi * x^2) - g12(k, x) 
endfunction

// --> metodo_biseccion(g, 1, 20, 1e-12)
//  ans  =
//    3.1851626

// --> g(ans)
//  ans  =
//   -6.743D-12
