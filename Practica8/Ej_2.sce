clear 

// Ejercicio 2

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
    w = 1/2 * f(a) + 1/2 * f(b)
    for i = 1:n-1
        w = w + f(a+i*h)
    end
    w = h*w
endfunction

// item (a)

a1 = 1
b1 = 3
deff('y=f1(x)', 'y=1/x')
n1 = 4
valor_aprox_1 = trapecio_compuesto(a1,b1,f1,n1)
valor_real_1 = intg(a1,b1,f1)
error_abs_1 = abs(valor_real_1 - valor_aprox_1)
error_rel_1 = error_abs_1/ abs(valor_real_1)

disp("a) f(x) = 1/x en [1,3], n = 4")
disp("El valor real (calculado en Scilab): ")
disp(valor_real_1)
disp("Aproximación usando el método de trapecio compuesto: ")
disp(valor_aprox_1)
disp("Error absoluto: " + string(error_abs_1) + "; Error relativo: " + string(error_rel_1))

//item (b)

a3 = 0
b3 = 2
deff('y=f3(x)', 'y=x^3')
n3 = 4
valor_aprox_3 = trapecio_compuesto(a3,b3,f3,n3)
valor_real_3 = intg(a3,b3,f3)
error_abs_3 = abs(valor_real_3 - valor_aprox_3)
error_rel_3 = error_abs_3/ abs(valor_real_3)

disp("b) f(x) = x^3 en [0,2], n = 4")
disp("El valor real (calculado en Scilab): ")
disp(valor_real_3)
disp("Aproximación usando el método de trapecio compuesto: ")
disp(valor_aprox_3)
disp("Error absoluto: " + string(error_abs_3) + "; Error relativo: " + string(error_rel_3))

// item (c)

a2 = 0
b2 = 3
deff('y=f2(x)', 'y=x*(1+x^2)^(1/2)')
n2 = 6
valor_aprox_2 = trapecio_compuesto(a2,b2,f2,n2)
valor_real_2 = intg(a2,b2,f2)
error_abs_2 = abs(valor_real_2 - valor_aprox_2)
error_rel_2 = error_abs_2/ abs(valor_real_2)

disp("c) f(x) = x*(1+x^2)^(1/2) en [0,3], n = 6")
disp("El valor real (calculado en Scilab): ")
disp(valor_real_2)
disp("Aproximación usando el método de trapecio compuesto: ")
disp(valor_aprox_2)
disp("Error absoluto: " + string(error_abs_2) + "; Error relativo: " + string(error_rel_2))

// item (d)

a4 = 0
b4 = 1
deff('y=f4(x)', 'y=sin(%pi*x)')
n4 = 8
valor_aprox_4 = trapecio_compuesto(a4,b4,f4,n4)
valor_real_4 = intg(a4,b4,f4)
error_abs_4 = abs(valor_real_4 - valor_aprox_4)
error_rel_4 = error_abs_4/ abs(valor_real_4)

disp("d) f(x) = sin(%pi*x) en [0,1], n = 8")
disp("El valor real (calculado en Scilab): ")
disp(valor_real_4)
disp("Aproximación usando el método de trapecio compuesto: ")
disp(valor_aprox_4)
disp("Error absoluto: " + string(error_abs_4) + "; Error relativo: " + string(error_rel_4))

// item (e)

a5 = 0
b5 = 2*%pi
deff('y=f5(x)', 'y=x*sin(x)')
n5 = 8
valor_aprox_5 = trapecio_compuesto(a5,b5,f5,n5)
valor_real_5 = intg(a5,b5,f5)
error_abs_5 = abs(valor_real_5 - valor_aprox_5)
error_rel_5 = error_abs_5/ abs(valor_real_5)

disp("e) f(x) = sin(%pi*x) en [0,2*pi], n = 8")
disp("El valor real (calculado en Scilab): ")
disp(valor_real_5)
disp("Aproximación usando el método de trapecio compuesto: ")
disp(valor_aprox_5)
disp("Error absoluto: " + string(error_abs_5) + "; Error relativo: " + string(error_rel_5))

// item (f)

a6 = 0
b6 = 1
deff('y=f6(x)', 'y=(x^2)*exp(x)')
n6 = 8
valor_aprox_6 = trapecio_compuesto(a6,b6,f6,n6)
valor_real_6 = intg(a6,b6,f6)
error_abs_6 = abs(valor_real_6 - valor_aprox_6)
error_rel_6 = error_abs_6/ abs(valor_real_6)

disp("f) f(x) = (x^2)*exp(x) en [0,1], n = 8")
disp("El valor real (calculado en Scilab): ")
disp(valor_real_6)
disp("Aproximación usando el método de trapecio compuesto: ")
disp(valor_aprox_6)
disp("Error absoluto: " + string(error_abs_6) + "; Error relativo: " + string(error_rel_6))

