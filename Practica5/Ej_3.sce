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


////////////////


// Ejercicio 3 

// La función que construye una matriz tridiagonal 
// de la forma 
//     2 -1 0 ... 0
//    -1  2 -1 ...0
//     0 -1 2 ... 0
//     ............
//     0 ... 0 -1 2

// Input: 
// n - dimención de la matriz cuadrada 
// n x n 

// Output: 
// res - la matriz tridigonal n x n 
// con las '2' en la diagonal
// con A(i, j) = -1  para i,j / |i-j| = 1


function res = tridiagonal(n)
    infsupD = -1*ones(1,n-1)
    D = 2*ones(1,n)
    res = diag(infsupD,-1) + diag(D) + diag(infsupD,1)
endfunction

function res = matrizGauss(A)
    I = eye(A)
    N = tril(A)
    N_inv = inverse(N)
    res = I - N_inv*A
endfunction


// Ejemplos

A = tridiagonal(5)

printf("\n La matriz A:")
disp(A)

printf("\n La matriz de iteración de Gauss-Seidel:")
disp(matrizGauss(A))

