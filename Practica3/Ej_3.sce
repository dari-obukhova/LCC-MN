clear 
//clf()

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


// Ejercicio 3

// La función que aproxima una raiz de una ecuación no lineal 
// usando Método de Secante

// Input:
// f - una función
// x0, x1 - n intervalo [anterior, actual]
// e - error 
// n - número max de iteraciones 

// Output: 
// raiz 

function raiz = secant(f, x0, x1, n, eps)
    x_actual = x1
    x_previous = x0
    i = 0
    
    while (abs(f(x_actual) - f(x_previous)) >= eps) & (i <= n)
        x = x_actual - f(x_actual)*((x_actual-x_previous)/(f(x_actual)-f(x_previous)))
        x_previous = x_actual
        x_actual = x
        i = i + 1
    end
    raiz = x_actual
endfunction

function y = f(x) 
    y = (x^2)/4 - sin(x)
 endfunction
 
//showPlot(f, [-1:.1:5])

x = secant(f, 1.5, 2, 15, 10^(-12))

printf("\n Una raiz  de la función ''(x^2)/4 - sin(x)'' : \n")

disp(x)

