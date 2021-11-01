clear 

// Ejercicio 6 

// Item (a)

x = [-1, 1, 2, 4]

D0 = 2 // f[-1]
D1 = 1 // f[-1,1]
D2 = -1 // f[-1, 1, 2]
D3 = 2 // f[-1,1,2,4]

//p_3 = D0 + (x-x0)*D1 + (x-x0)*(x-x1)*D2 + (x-x0)*(x-x1)*(x-x2)*D3

p1 = poly(x(1), 'x', 'roots') // (x-x0)
p2 = poly(x(1:2), 'x', 'roots') // (x-x0)*(x-x1)
p3 = poly(x(1:3), 'x', 'roots') // (x-x0)*(x-x1)*(x-x2)

poly_interpolante_3 = D0 + p1 * D1 + p2 * D2 + p3 * D3

printf("\n El polinomio interpolante: ")
disp(poly_interpolante_3)

// item (b)

f_0 = horner(poly_interpolante_3, 0) // f(0)

printf("\n La estimación de f(0) : ")
disp(f_0)


