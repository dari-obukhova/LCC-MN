//clear 

// Ejercicio 8 

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

// item (a)

A3 = [1.012 -2.132 3.104; -2.132 4.096 -7.013; 3.104 -7.013 0.014]

[P3, L3, U3] = factorizationPLU(A3)
printf("\n Resultados de la función ''factorizationPLU'': ")
printf("\n L3:")
disp(L3)
printf("\n U3:")
disp(U3)

printf("\n Resultados de Scilab: ")
[L3s, U3s] = lu(A3)
printf("\n L3:")
disp(L3s)
printf("\n U3:")
disp(U3s)

A4 = [2.1756 4.0231 -2.1732 5.1967; -4.0231 6.0000 0 1.1973; -1.0000 5.2107 1.1111 0; 6.0235 7.0000 0 4.1561];

[P4, L4, U4] = factorizationPLU(A4)
printf("\n Resultados de la función ''factorizationPLU'': ")
printf("\n L4:")
disp(L4)
printf("\n U4:")
disp(U4)

printf("\n Resultados de Scilab: ")
[L4s, U4s] = lu(A4)
printf("\n L4:")
disp(L4s)
printf("\n U4:")
disp(U4s)
