clear

// Ejercicio 1
deff('y=f1(x)', 'y=1 + (cos(x) * ((exp(x) + exp(-x))/ 2))')
function y = dibujar(f, x)
  plot(x,f)
  a=gca();
  a.x_location = "origin";
  a.y_location = "origin";
  xgrid(35)
  y = 0
endfunction

dibujar(f1, [0:0.1:8])


// x1 = 1.9
// x2 = 4.7
// x3 = 7.85
