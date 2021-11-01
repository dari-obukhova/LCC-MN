clear

// Para el calculo de la inversa 
// _______________________________

// El método de eliminación Gaussiana modificado 
// para resolver múltiples siestemas de acuaciones lineales 

// Input: 
// A - una matriz n x n
// B - una matriz n x m 

// Output: 
// X - matriz de soluciónes 
// A_aum - matriz [A B] n x m  

function [X,A_aum] = Gauss_amp(A,B)
    
   [nA, mA] = size(A);
   [nB, mB] = size(B);
   
   if nA<>mA then
        error('gausselim - La matriz A debe ser cuadrada');
        abort;
    elseif mA<>nB then
        error('gausselim - dimensiones incompatibles entre A y b');
        abort;
    end;
   
   // Matriz aumentada
   A_aum = [A,B];
   
   // Eliminación progresiva
   for i = 1:(nA-1) do
      for j = (i+1):nA do
         mji = A_aum(j,i)/A_aum(i,i) 
         A_aum(j,i)=0 
         A_aum(j,(i+1):(mA+mB)) = A_aum(j,(i+1):(mA+mB)) - mji*A_aum(i,(i+1):(mA+mB))
      end
   end
       
   // Sustitución regresiva
   X(nA,1:mB) = A_aum(nA,(nA+1):(nA+mB))/A_aum(nA,nA)
   
   for i = (nA-1):-1:1 do
      X(i,1:mB) = (A_aum(i,(mA+1):(mA+mB)) - (A_aum(i,(i+1):mA)*X((i+1):mA,1:mB)))/A_aum(i,i)
   end
endfunction

// Ejemplos 

A1 = [1 2 3; 2 3 5; 7 8 14]
B1 = [17 18; 11 14; 13 18]

[X1,A_aum1] = Gauss_amp(A1,B1)
printf("\nLa solución de A1 * X1 = B1: ")
disp(X1)
printf("\nA1*X1: ")
disp(A1*X1)
printf("\nB1:")
disp(B1)

A2 = [21 8 89; 31 3 87; 3 5 75]
B2 = [32 21; 35 20; 45 30]

[X2,A_aum2] = Gauss_amp(A2,B2)
printf("\nLa solución de A2 * X2 = B2: ")
disp(X2)
printf("\nA2*X2: ")
disp(A2*X2)
printf("\nB2:")
disp(B2)

// La función que calcula la inversa de una matriz 

// La matriz inversa de A verifica que A*A^{-1} = Id. 
// Entonces, proponemos resolver A*X = Id usando 
// eliminación Gaussiana modificado 
// para resolver múltiples siestemas de acuaciones lineales 

// Input: 
// A - una matriz

// Output: 
// A_inv - matriz inversa de A

function A_inv = inverse(A)
    n = size(A,1)
    Id = eye(n,n)
    [A_inv,A_aum] = Gauss_amp(A,Id)
endfunction

// Ejemplos 

A3 = [2 3 4; 7 8 12; 13 2 15]

A3_inv = inverse(A3)

printf("\n Inversa de A3:")
disp(A3_inv)
printf("\n A3 * A3_inv:")
disp(A3*A3_inv)
printf("__________________________________________\n")


// Ejercicio 1 

// item (a) 

// La función que resueve sistemas de ecuaciines lineales 
// usando el método iterativo de Jacobi 

// Input: 
// A - matriz de coefficientes
// b - vector 
// x0 - estimación inicial de x 
// eps - tolerancia de un error 

// Output:
// x - solución de ecuaciones lineales

function x = jacobi(A,b,x0,eps)
    n = size(A,1)
    x = x0 
    xk = x
    count = 0 
    
    for i=1:n
        x(i) = (1/A(i,i))*(b(i) - A(i,:)*xk + A(i,i) * x(i))
    end
    
    count = count+1
    
    while (norm(x-xk)>eps)
        xk = x
        
        for i=1:n 
            x(i) = (1/A(i,i))*(b(i) - A(i,:)*xk + A(i,i) * x(i))
        end
        count = count + 1
    end
    printf("Número de iteraciones: ")
    disp(count)
endfunction

// TODO: Ejemplos 

// item (a)

A_1 = [0 2 4; 1 -1 -1; 1 -1 2]
b_1 = [0 .375 0]'

// después de intercambio de filas 

A_2 = [1 -1 -1; 0 2 4; 1 -1 2]
b_2 = [.375 0 0]'

// Error:
// norm: Wrong value for argument #1: Must not contain NaN or Inf.

// spec(A2) tiene autovalores complejos



// La matriz A1 no es diagonalmente dominante,
// por lo tanto no podemos asegurar la convergencia por el teorema 3

// Aplicando Colorario 1

I1 = eye(A_2)
N = diag(diag(A_2))
N_inv = inverse(N)

rho_1 = max(abs(spec(I1 - N_inv*A_2)))

printf("\n rho_1:")
disp(rho_1)

// Como rho_1 = 1.3440402 > 1 , 
//no podemos asegurar la convergencia por el Colorario 1


A_3 = [1 -1 0; -1 2 -1; 0 -1 1.1]
b_3 = [0 1 0]'

// La matriz A_3 no es diaginalmente dominante, 
// por lo tanto no podemo asegurar su convergencia por el Teorema 3 

// Aplicado Colorario 1

I2 = eye(A_3)
N2 = diag(diag(A_3))
N2_inv = inverse(N2)

rho_2 = max(abs(spec(I2 - N2_inv*A_3)))

printf("\n rho_2:")
disp(rho_2)

// Como rho_2 = 0.9770084 < 1, 
// por lo tanto podemos asegurar que la sucesión {xk}
// definida por el método iterativo de Jacobi 
// converge a la solución del sistema A_3 * x = b_3 
// para cualquier estimación inicial x0


// Item (b)

// La matriz A_2 no es diagonalmente dominante
// por eso o podemos asegurar la convergencia por el Teorema 4


// Aplicado Colorario 1

I1 = eye(A_2)
N_gauss = tril(A_2)
N_gauss_inv = inverse(N_gauss)

rho_gauss_1 = max(abs(spec(I1 - N_gauss_inv*A_2)))

printf("\n rho_gauss_1:")
disp(rho_gauss_1)

// rho_gaus_1 = 2 > 1 
// por lo tnto n podemos asegurar la convergencia 


// La matriz A_3 no es diagonalmente dominante
// por eso o podemos asegurar la convergencia por el Teorema 4

// Aplicando Colorario 1

I2 = eye(A_3)
N2_gauss = tril(A_3)
N2_gauss_inv = inverse(N2_gauss)

rho_gauss_2 = max(abs(spec(I2 - N2_gauss_inv*A_3)))

printf("\n rho_gauss_2:")
disp(rho_gauss_2)

// rho_gauss_2 = 0.9545455 < 1
// por lo tanto podemos asegurar la convergencia 



// La función que resuelve sistemas de ecuaciones lineales 
// aplicando el método de Gauss-Seidel

// Input: 
// A - matriz de coefficientes
// b - vector 
// x0 - estimación inicial de x 
// eps - tolerancia de un error 

// Output:
// x - solución de ecuaciones lineales

function x = gauss_seidel(A,b,x0,eps)
    n = size(A,1)
    x = x0 
    xk = x
    count = 0 
    
    x(1) = (1/A(1,1))*(b(1) - A(1,2:n)*xk(2:n))   
        
        for i=2:n-1
            x(i) = (1/A(i,i)) * (b(i)  - A(i,1:i-1)*x(1:i-1) - A(i, i+1:n)*xk(i+1:n))
        end
        
        x(n) = (1/A(n,n)) * (b(n) - A(n,1:n-1)*x(1:n-1)) 
        
        count = count+1
    
    while (norm(x-xk)>eps)
        
        xk = x

        x(1) = (1/A(1,1))*(b(1) - A(1,2:n)*xk(2:n))   
        
        for i=2:n-1
            x(i) = (1/A(i,i)) * (b(i)  - A(i,1:i-1)*x(1:i-1) - A(i, i+1:n)*xk(i+1:n))
        end
        
        x(n) = (1/A(n,n)) * (b(n) - A(n,1:n-1)*x(1:n-1)) 
        
        count = count+1
        
    end
    
    printf("Número de iteraciones: ")
    disp(count)
endfunction

// Item (c) 

eps = 10^(-2)
x0 = [0 0 0]'

A_1 = [0 2 4; 1 -1 -1; 1 -1 2]
b_1 = [0 .375 0]'

// después de intercambio de filas 

A_2 = [1 -1 -1; 0 2 4; 1 -1 2]
b_2 = [.375 0 0]'


//printf("\n La solución de A_2 * x = b_2 aplicando el método de Jacobi: ")
//disp(jacobi(A_2, b_2, x0, eps))

//printf("\n La solución de A_2 * x = b_2 aplicando el método de Gauss-Seidel: ")
//disp(gauss_seidel(A_2, b_2, x0, eps))

A_3 = [1 -1 0; -1 2 -1; 0 -1 1.1]
b_3 = [0 1 0]'

printf("\n La solución de A_3 * x = b_3 aplicando el método de Jacobi: ")
disp(jacobi(A_3, b_3, x0, eps))

printf("\n La solución de A_3 * x = b_3 aplicando el método de Gauss-Seidel: ")
disp(gauss_seidel(A_3, b_3, x0, eps))
