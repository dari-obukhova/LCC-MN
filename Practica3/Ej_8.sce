// Ejercicio 8

// --> deff("y=g1(x)", "y=%e^x / 3")
// --> dibujar(g1, [-1:0.1:2]);
// Podemos ver que 0 <= x <= 1 => 0 <= g1(x) <= 1
// Y como |g1'(x)| < 1 en [0, 1]
// Podemos obtener la solucion con:
// --> metodo_punto_fijo(g1, 0, 1e-4)
//  ans  =
//    0.6188108

// --> deff("y=g2(x)", "y=(exp(x) - x) / 2")
// --> dibujar(g2, [-1:0.1:2])
// Podemos ver que 0 <= x <= 1 => 0 <= g1(x) <= 1
// Y como |g2'(x)| < 1 en [0, 1]
// Podemos obtener la solucion con:
// --> metodo_punto_fijo(g2, .5, 1e-4)
//  ans  =
//    0.618952

// --> deff("y=g3(x)", "y=log(3*x)")
// --> dibujar(g3, [0:0.1:5]);
// Podemos ver que 1.5 <= x <= 2 => 1.5 <= g3(x) <= 2
// Entonces podemos obtener la solucion con:
// Y como |g3'(x)| < 1 en [1.5, 2]
// --> metodo_punto_fijo(g3, 1.5, 10^-4)
//  ans  =
//    1.5119381

// --> deff("y=g4(x)", "y= %e^x - 2 * x")
// --> dibujar(g4, [0:0.1:2]);
// Vemos que 0 <= x <= 1 => 0 <= g4(x) <= 1
// Y como |g4'(x)| < 1 en [0, 1]
// Obtenemos el resultado con:
// --> metodo_punto_fijo(g4, .5, 10^-4)
//  ans  =
//    0.6189904

// Todas las funciones nos fueron útiles
// En particular, g3 nos permitió encontrar el punto fijo cercano a 1.5
// mientras que el resto nos permitieron entcontrar el cercano a 0.6
