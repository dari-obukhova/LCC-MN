clear 

// Ejercicio 7 

// La función que obtiene la factorización PA = LU 
// de una matriz dada A
// a partir de la eliminación de Gauss
// con pivoteo parcial 

// Input:
// A - una matriz 

// Output: 
// P - matriz de permatación 
// L - matriz triangular inferior, 
// basada en multiplicadores m_ik de la eliminación gaussiana 
// U - matriz triangula superior, 
// obtenida por la eliminación gaussiana

function [P, L, U] = factorizationPLU(A)
    
    [nA, mA] = size(A)
    
    if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
    end;
    
    U = A
    
    L = eye(A)
    P = eye(A)
    
    for k=1:mA-1
        i_pivot = k 
        u_max = abs(U(k,k))
        
        for i = k+1:mA
            if abs(U(i,k)) > u_max then
                i_pivot = i
                u_max = abs(U(i,k))
            end;
        end;
        
                
        temp_U = U(k,k:mA); U(k,k:mA) = U(i_pivot,k:mA); U(i_pivot,k:mA) = temp_U;
        temp_L = L(k,1:k-1); L(k,1:k-1) = L(i_pivot,1:k-1); L(i_pivot,1:k-1) = temp_L;
        temp_P = P(k,:); P(k,:) = P(i_pivot, :); P(i_pivot, :) = temp_P;
        
        for j=k+1:mA 
            L(j,k) = U(j,k)/U(k,k)
            U(j,k:mA) = U(j,k:mA) - L(j,k)*U(k,k:mA)
            
        end; 
    end;
    
endfunction

// Ejemplos 

A1 = [10 -7 0; -3 2 6; 5 -1 5]
[P1, L1, U1] = factorizationPLU(A1)
printf("\n P1:")
disp(P1)
printf("\n L1:")
disp(L1)
printf("\n U1:")
disp(U1)

printf("\n L1*U1:")
disp(L1*U1)

printf("\n P*A")
disp(P1*A1)


A2 = [1 2 3 5 7; -3 4 7 2 6; 5 -1 5 8 9; 2 5 13 -4 7; 12 8 -4 5 6]
[P2, L2, U2] = factorizationPLU(A2)
printf("\n P2:")
disp(P2)
printf("\n L2:")
disp(L2)
printf("\n U2:")
disp(U2)

printf("\n L2*U2:")
disp(L2*U2)

printf("\n P2*A2")
disp(P2*A2)


printf("\n ___________________________________ \n")


// Factorización de la matriz del ej 7

printf("\n Ejercicio 7 \n")

A = [2 1 1 0; 4 3 3 1; 8 7 9 5; 6 7 9 8]

printf("\n La matriz A:\n")
disp(A)

[P, L, U] = factorizationPLU(A) 

[Ls,Us,Ps] = lu(A)
printf("\n L calculado en Scilab:")
disp(Ls)
printf("\n U calculado en Scilab:")
disp(Us)

printf("\n P calculado con el algoritmo programado:")
disp(P)
printf("\n L calculado con el algoritmo programado:")
disp(L)
printf("\n U calculado con el algoritmo programado:")
disp(U)

printf("\n L*U:")
disp(L*U)

printf("\n P*A")
disp(P*A)


