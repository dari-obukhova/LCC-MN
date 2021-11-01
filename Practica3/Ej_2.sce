//clf()
clear

// La fución que devuelve la grafica

// Input: 
// f - una función
// x - vector 

// Output:
// Una grafica en la pestaña nueva

function y = showPlot(f, x)
  plot(x,f)
  a=gca();
  a.x_location = "origin";
  a.y_location = "origin";
//  [xmin,ymin; xmax,ymax]
//  a.data_bounds = [-10 -10; 2 10]
  xgrid(35);
  y = 0
endfunction


// Ejercicio 2

// Fucnion que aproxima raices de una ecuación no lineal
// usando el método de la bisección 

// Input: 
// f - la función 
// a , b - extremos de un intervalo 
// e - un error 

// Output:
// x - raiz de la función  


function raiz = bisection(f, a, b, e)
    if f(a)*f(b) > 0 then
        raiz = %nan;
    else
        c = (a+b)/2;
        if f(c) == 0 then raiz = c; return; end;
        while (b-c) > e
            if f(c) == 0 then raiz = c; return; end;
            if f(b)*f(c) <= 0 then 
                    a = c;
                else 
                    b = c;
                end
                c = (a+b)/2;
            end
            raiz = c;
        end
endfunction


// Item (a)

e = 10^(-2)

// deff('y=g(x)', 'y = sin(x) - ((x^2)/2)')
function y = f1(x) 
    y = sin(x) - (x^2)/2
 endfunction

//showPlot(f1, [-1:0.1:2])

x1 = bisection(f1, -1, 0.5, e)

printf("\n Las soluciones de la función ''y = sin(x) - ((x^2)/2)'': \n")
printf("\n x1:")
disp(x1)

x2 = bisection(f1, 1, 2, e)
printf("\n x2:")
disp(x2)

// Item (b) 

//deff('y=f2(x)', 'y = %e^(-x) - (x^4)')
function y = f2(x) 
    y = (%e^(-x)) - (x^4)
 endfunction
 
//showPlot(f2, [-10:0.1:2])

x1 = bisection(f2, -9, -8, e)

printf("\n Las soluciones de la función ''y = e^(-x) - (x^4)'' : \n")
printf("\n x1:")
disp(x1)

x2 = bisection(f2, -2, -1, e)

printf("\n x2:")
disp(x2)

x3 = bisection(f2, 0, 1, e)

printf("\n x3:")
disp(x3)

// Item (c)

//deff('y=g(x)', 'y = x - 1 - log(x)')
function y = f3(x) 
    y = x - 1 - log10(x)
 endfunction
 
//showPlot(f3, [-2:0.1:2])

x1 = bisection(f3, 0, 0.5, e)

printf("\n Las soluciones de la función ''y = log(x) - x +1'' : \n")
printf("\n x1:")
disp(x1)

x2 = bisection(f3, 0.5, 1.5, e)

printf("\n x2:")
disp(x2)
