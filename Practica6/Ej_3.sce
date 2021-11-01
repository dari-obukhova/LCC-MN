clear 

// Ejercicio 3

//La función que dado un valor entero 'k'
// devuelve la siguietne matriz: 
//  1.  -1.   0.
//  -2.   4.  -2.
//   0.  -1.   1 + 0.1*k

// Input: 
// k - entero positivo 0 <= k <= 10

// Output: 
// A - una matriz 

function A = matrix3(k)
    A = [1 -1 0; -2 4 -2; 0 -1 1] + [0 0 0; 0 0 0; 0 0 0.1*k]
endfunction

// Item (i)

s = poly(0,"s")

B = [s 0 0; 0 s 0; 0 0 s]

k = 5

A = matrix3(k)

poli_car = det(A - B)
[raices] = roots(poli_car)

printf("El polinomio característico: ")
disp(poli_car)

printf("\n Raíces: ")
disp([raices])

// Item (ii)

[autovalores] = spec(A)

printf("\n Autovalores: ")
disp([autovalores])






