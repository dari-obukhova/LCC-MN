clear 

// Ejercicio 1


// La Regla del Trapecio 

// la función que resuelve integral definida de una función
// usando la regla del trapecio 

// Input: 
// a, b - extremos de integración 
// f - la función 

// Output: 
// w - aproximación de la integral de f en [a,b] por la Regla del Trapecio 


function w = trapecio(a,b,f)
    w = ((b-a)/2) * (f(a) + f(b))
endfunction


// La Regla del Simpson 

// la función que resuelve integral definida de una función
// usando la regla del Simpson

// Input: 
// a, b - extremos de integración 
// f - la función 

// Output: 
// w - aproximación de la integral de f en [a,b] por la Regla del Simpson

function w = simpson(a,b,f)
    h = (b-a)/2
    w = h/3 * (f(a) + 4*f(a+h) + f(b))
endfunction


// item (a) 

a1 = 1 
b1 = 2
f1 = log

int_trap_1 = trapecio(a1,b1,f1)
int_simp_1 = simpson(a1,b1,f1)
valor_real_1 = intg(a1,b1,f1)
err_abs_trap_1 = abs(valor_real_1 - int_trap_1)
err_abs_simp_1 = abs(valor_real_1 - int_simp_1)
err_rel_trap_1 = err_abs_trap_1 / abs(valor_real_1)
err_rel_simp_1 = err_abs_simp_1 / abs(valor_real_1)

disp("a) La función: ln(x) en el intervalo [2,1]")
disp("El valor real (calculado en Scilab): " + string(valor_real_1))
disp("Aproximación usando la Regla del Trapecio: " + string(int_trap_1))
disp("El error absoluto: " + string(err_abs_trap_1) + " El error relativo: " + string(err_rel_trap_1))
disp("Aproximación usando la Regla del Simpson: " + string(int_simp_1))
disp("El error absoluto: " + string(err_abs_simp_1) + " El error relativo: " + string(err_rel_simp_1))

// item (b)

a2 = 0 
b2 = 0.1
deff('y = f2(x)', 'y = x^(1/3)') 

int_trap_2 = trapecio(a2,b2,f2)
int_simp_2 = simpson(a2,b2,f2)
valor_real_2 = intg(a2,b2,f2)
err_abs_trap_2 = abs(valor_real_2 - int_trap_2)
err_abs_simp_2 = abs(valor_real_2 - int_simp_2)
err_rel_trap_2 = err_abs_trap_2 / abs(valor_real_2)
err_rel_simp_2 = err_abs_simp_2 / abs(valor_real_2)

disp("b) La función: x^(1/3) en el intervalo [0,0.1]")
disp("El valor real (calculado en Scilab): " + string(valor_real_2))
disp("Aproximación usando la Regla del Trapecio: " + string(int_trap_2))
disp("El error absoluto: " + string(err_abs_trap_2) + " El error relativo: " + string(err_rel_trap_2))
disp("Aproximación usando la Regla del Simpson: " + string(int_simp_2))

// Item (c)

a3 = 0 
b3 = %pi/3
deff('y = f3(x)', 'y = (sin(x))^2') 

int_trap_3 = trapecio(a3,b3,f3)
int_simp_3 = simpson(a3,b3,f3)
valor_real_3 = intg(a3,b3,f3)
err_abs_trap_3 = abs(valor_real_3 - int_trap_3)
err_abs_simp_3 = abs(valor_real_3 - int_simp_3)
err_rel_trap_3 = err_abs_trap_3 / abs(valor_real_3)
err_rel_simp_3 = err_abs_simp_3 / abs(valor_real_3)

disp("c) La función: (sin(x))^2 en el intervalo [0,pi/3]")
disp("El valor real (calculado en Scilab): " + string(valor_real_3))
disp("Aproximación usando la Regla del Trapecio: " + string(int_trap_3))
disp("El error absoluto: " + string(err_abs_trap_3) + " El error relativo: " + string(err_rel_trap_3))
disp("Aproximación usando la Regla del Simpson: " + string(int_simp_3))
disp("El error absoluto: " + string(err_abs_simp_3) + " El error relativo: " + string(err_rel_simp_3))






 
