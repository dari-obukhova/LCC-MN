clear 

// La función que aproxima 
// la solución del sistema
// usando el método de Newton

// Input: 
// f - la función 
// x0 - valor inicial 
// n - número maximo de iteraciones 

function p = newton_multivariable(f, x0, n)
    p_previous = x0 - (inv(numderivative(f,x0)))*f(x0)
    i = 0 
    while i < n
        p_current = p_previous - (inv(numderivative(f,p_previous)))*f(p_previous);
        i = i + 1;
        p_previous = p_current
    end
    p = p_current
endfunction

// Ejemplo

function y = F_ejemplo(x)
    y(1) = 5*x(1)^3 + x(2)^2 - 7
    y(2) = x(1)^2*x(2) - 8*x(2)
endfunction

x = newton_multivariable(F_ejemplo, [0,0]', 500)
disp(x)

disp(F_ejemplo(x))

printf("\n________________________________ \n")



// Ejercicio 10 

function y = F10(x)
    y(1) = x(1)^2 + x(1)*x(2)^3 - 9
    y(2) = 3*x(1)^2*x(2) - 4 - x(2)^3
endfunction

//a
x0_a = [1.2, 2.5]'

//b 
x0_b = [-2, 2.5]'

//c
x0_c = [-1.2, -2.5]'

//d
x0_d = [2, -2.5]'

n = 100

xa = newton_multivariable(F10, x0_a, 100)
printf("\n La solución a:")
disp(xa)

xb = newton_multivariable(F10, x0_b, 100)
printf("\n La solución b:")
disp(xb)

xc = newton_multivariable(F10, x0_c, 100)
printf("\n La solución c:")
disp(xc)

xd = newton_multivariable(F10, x0_d, 100)
printf("\n La solución d:")
disp(xd)

