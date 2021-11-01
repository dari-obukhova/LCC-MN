//clear 

// Ejercicio 4

// La función que convierte una a matriz a la forma triangular superior 
// usando el procedimiento de eliminación Gaussiana. 

// Input: 
// A - una matriz
// Output: 
// A - una matriz triangular superior 

function A_triangular = elimGauss(A)
     
    a = size(A)
    n = a(1)
    
    for i = 1:(n-1)
        for j = (i+1):a(1)
            mjk = A(j,i)/A(i,i)
            A(j,i)=0
            A(j,i+1:n) = A(j,i+1:n) - mjk*A(i,i+1:n)
        end
    end
    
A_triangular = A 
  
endfunction

// Ejemplos 

//
A1 = [3 2 3 4; 4 4 3 2; 1 4 4 3; 2 3 1 1]

printf("elimGauss(A1):")
disp(elimGauss(A1))

//Respuesta correcta: 
//3	 2	    3	    4
//0	 1.333	-1	-3.3333
//0	 0     5.5	10.0000
//0	 0 	    0 	 2.0455



// La función qe calcula determinante de una matriz,
// llevandola a la forma triangular superior 
// y multiplicando los elementos en la diagonal principal

// Input:
// A - matriz

// Output:
// d - determinante

function d = determinant(A)
    
    A_triangular = elimGauss(A)
    
    [nA, mA] = size(A)
    
    d = 1
    
    for i=1:nA
        d = d * A_triangular(i,i)
    end
endfunction

// Ejemplos 

A2 = [2 -5 3; 0 7 -2; -1 4 1]

printf("\n Determinante de A2 calculado don la función ''determinant'':")
disp(determinant(A2))

printf("\n Determinante de A2 calculado en Scilab:")
disp(det(A2))

A3 = [-3 9 5; -4 0 1; 6 3 0]

printf("\n Determinante de A3 calculado don la función ''determinant'':")
disp(determinant(A3))

printf("\n Determinante de A3 calculado en Scilab:")
disp(det(A3))
