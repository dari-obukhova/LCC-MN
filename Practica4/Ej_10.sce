clear

// Ejercicio 10 

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

printf("\n Ejemplos de la resolución de sistemas triangular superior \n \n")

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

printf("\n Ejemplos de la resolución de sistemas triangular inferior \n \n")

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



// La función que obtiene la factorización A = LU 
// de una matriz dada A
// aplicando método de Doolittle 

// Input:
// A - una matriz 

// Output: 
// L - matriz triangular inferior
// U - matriz triangula superior
// tales que A = LU

function [L,U] = doolittle(A)
    
    [nA, mA] = size(A)
    
    if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
    end;

    L = eye(A)
    U = eye(A)
    
    U(1,:) = A(1,:)
    
    for i = 2:mA
        L(i,1) = A(i,1)/U(1,1)
    end;
    
    for i = 2:mA
        for k = i:mA
            U(i,k) = A(i,k) - L(i,1:i-1)*U(1:i-1,k)
        end;
        for j=i+1:mA
            L(j,i) = (A(j,i) - (L(j,1:i-1)*U(1:i-1,i)))/U(i,i)
        end;
    end;
endfunction

//Ejemplos 

printf("_________________________________________________________ \n")
printf("\n Ejemplos de la aplicación de la función ''doolittle'' \n")

A1 = [1 5 7 8; 11 7 3 8; 5 12 1 1; 10 3 7 8]

[L1,U1] = doolittle(A1)
printf("\n L1:")
disp(L1)
printf("\n U1:")
disp(U1)
printf("\n L1*U1:")
disp(L1*U1)

A2 = [10 -7 0; -3 2 6; 5 -1 5]

[L2,U2] = doolittle(A2)
printf("\n L2:")
disp(L2)
printf("\n U2:")
disp(U2)
printf("\n L2*U2:")
disp(L2*U2)


// Resolución de A*x = b

A = [1 2 3 4; 1 4 9 16; 1 8 27 64; 1 16 81 256]

b = [2 10 44 190]'

[L,U] = doolittle(A)

y = lower_triangular(L, b)

x = upper_triangular(U,y)

printf("\n Resolución de A*x = b usando el algoritmo ''doolittle'': ")

disp(x)
