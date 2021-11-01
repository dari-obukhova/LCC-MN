//clear 

// Ejercicio 9

//La función que resuelve un sistema triangular superior

//Input: 
//A - matriz de coeficientes
//b - un vector

function x = upper_triangular(A, b)
    n = size(A,1)
    x(n) = b(n)/A(n,n)
    for i = n-1:-1:1
        x(i) = ( b(i) - A(i, i+1:n)*x(i+1:n) ) / A(i,i)
    end
endfunction

//Ejemplos
A1 = [1,2,1; 0,-2,1; 0,0,0.5]
b1 = [0,3,0.5]'
ans1 = [1,-1,1]'
printf("raices de A1*x=b1: ")
disp(ans1)
printf("raices de A1*x=b1, calculados con la función ''upper_triangular'':")
disp(upper_triangular(A1,b1))

A2 = [2,4,-2; 0,-10,10; 0,0,-8]
b2 = [-10,40,-16]'
ans2 = [1,-2,2]'
printf("raices de A2*x=b2: ")
disp(ans2)
printf("raices de A2*x=b2, calculados con la función ''upper_triangular'':")
disp(upper_triangular(A2,b2))

//La función que resuelve un sistema triangular inferior 

//Input: 
//A - matriz de coeficientes
//b - un vector

function x = lower_triangular(A, b)
    n = size(A,1)
    x(1) = b(1)/A(1,1)
    for i = 2:n
        x(i) = ( b(i) - A(i, 1:i-1)*x(1:i-1) ) / A(i,i)
    end
endfunction

//Ejemplos
A3 = [1,0,0; 4,5,0; 7,8,9]
b3 = [7,21,8]'
ans3 = [7,-1.4,-3.311]'
printf("raices de A3*x=b3: ")
disp(ans3)
printf("raices de A3*x=b3, calculados con la función ''lower_triangular'':")
disp(lower_triangular(A3,b3))

A4 = [1,0,0; 2,3,0; 4,2,5]
b4 = [2,-2,10]'
ans4 = [2,-2,1.2]'
printf("raices de A4*x=b4: ")
disp(ans4)
printf("raices de A4*x=b4, calculados con la función ''lower_triangular'':")
disp(lower_triangular(A4,b4))


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

A = [1 2 -2 1; 4 5 -7 6; 5 25 -15 -3; 6 -12 -6 22];
b = [1 2 0 1]'

[P, L, U] = factorizationPLU(A)

b_permutado = P*b 

y = lower_triangular(L, b_permutado)

x = upper_triangular(U, y)

printf("\n La solución de Ax = b: ")
disp(x) 

// item (b)

b1 = [2 2 1 0]'

b1_permutado = P*b1

y1 = lower_triangular(L, b1_permutado)

x1 = upper_triangular(U, y1)

printf("\n La solución de Ax = b1: ")
disp(x1) 

