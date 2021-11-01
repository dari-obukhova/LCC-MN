//clear

// Ejercicio 3 de la Práctica 3

// ítem (a)

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

// ítem (b)
A = [1,2,3;3,-2,1;4,2,-1]
B = [14,9,-2;2,-5,2;5,19,12]
[X,A_aum] = Gauss_amp(A,B)
disp("La solución es: X=")
disp(X)
// disp(A*X)
// disp(B)

// ítem (c)
// La matriz inversa de A verifica que A*A^{-1} = Id. Entonces, proponemos resolver A*X = Id
[nA, mA] = size(A)
Id = eye(nA,mA)
[A_inv,A_aum] = Gauss_amp(A,Id)
disp("La inversa de A es: A^{-1}=")
disp(A_inv)
disp("Verificando, A*A^{-1}=")
disp(A*A_inv)
