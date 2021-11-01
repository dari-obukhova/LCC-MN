clear

// Ejercicio 6


// La versión sin pivoteo 
//________________________

// La función resuelve el sistema de ecuaciones lineales A*x=b
// donde A - una matriz tridiagonal 
// usando el método de Gauss

// Input: 
// A_t - una matriz de coefficientes tridiagonal 
// b - un vector 

// Output: 
// x - solución de la ecuaciones lineales 
// A - matriz triagonal superior
// SR - número de operaciones de sumas y restas
// MD - número de operaciones de multiplicaciones y divisiones

function [x, A, SR, MD] = gaussTridiagonal(A_t, b)
    
    [nA, mA] = size(A_t)
    [nb, mb] = size(b)
    
    A = A_t
    
    n = nA
    SR = 0
    MD = 0
    
    if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
    
    elseif mA<>nb then
    error('gausselim - dimensiones incompatibles entre A y b');
    abort;
end;

for i=1:n-1
    mjk = A(i+1,i)/A(i,i)
    
    MD = MD + 1
    
    A(i+1,i) = A(i+1,i) - mjk * A(i,i)
    
    SR= SR +1
    MD = MD + 1
    
    A(i+1,i+1) = A(i+1,i+1) - mjk * A(i,i+1)
    
    SR= SR +1
    MD = MD + 1
    
    b(i+1) = b(i+1) - mjk * b (i)
    
    SR= SR +1
    MD = MD + 1
end

x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    x(i) = (b(i)-A(i,i+1)*x(i+1))/A(i,i)
    SR= SR +1
    MD = MD + 2
end;

endfunction


A1_t = [-2 1 0 0; 1 -2 1 0; 0 1 -2 1; 0 0 1 -2]
b1 = [-1 0 0 -5]'

[x1, A1, SR1, MD1] = gaussTridiagonal(A1_t, b1)
printf("\n Solución de A1*x=b1: ")
disp(x1)
printf("\n A1*x1 =  ")
disp(A1_t*x1)
printf("\n b1 =")
disp(b1)

printf("\n Usando ''gaussTridiagonal'' SR1: %d , MD1: %d", SR1, MD1)

printf("\n Usando ''gausselim'' SR1 = 29, MD = 50")


A2_t = [1 3 0 0; 2 4 6 0; 0 3 7 4; 0 0 4 3]
b2 = [2 4 8 6]' 

[x2, A2, SR2, MD2] = gaussTridiagonal(A2_t, b2)
printf("\n Solución de A2*x=b2: ")
disp(x2)
printf("\n A2*x2 =  ")
disp(A2_t*x2)
printf("\n b2 =")
disp(b2)


// La versión con pivoteo 
//________________________


function [x, A, SR, MD] = gaussTridiagonalPP(A_t, b)
    
    [nA, mA] = size(A_t)
    [nb, mb] = size(b)
    
    A = A_t
    
    n = nA
    SR = 0
    MD = 0
    
    if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
    
    elseif mA<>nb then
    error('gausselim - dimensiones incompatibles entre A y b');
    abort;
end;

for i=1:n-1
    
    if abs(A(i,i)) < abs(A(i+1, i)) then 
        temp = A(i,:); A(i,:) = A(i+1, :); A(i+1, :) = temp;
        temp_b = b(i); b(i) = b(i+1); b(i+1) = temp_b 
    end;
    
    mjk = A(i+1,i)/A(i,i)
    
    MD = MD + 1
    
    A(i+1,i) = A(i+1,i) - mjk * A(i,i)
    
    SR= SR +1
    MD = MD + 1
    
    A(i+1,i+1) = A(i+1,i+1) - mjk * A(i,i+1)
    
    SR= SR +1
    MD = MD + 1
    
    if i < (n-1) then 
        A(i+1,i+2) = A(i+1,i+2) - mjk * A(i,i+2)
    end;
    
    SR= SR +1
    MD = MD + 1
    
    b(i+1) = b(i+1) - mjk * b (i)
    
    SR= SR +1
    MD = MD + 1
end

x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    x(i) = (b(i)-A(i,i+1)*x(i+1))/A(i,i)
    SR= SR +1
    MD = MD + 2
end;

endfunction

//A1_t = [-2 1 0 0; 1 -2 1 0; 0 1 -2 1; 0 0 1 -2]
//b1 = [-1 0 0 -5]'

[x1, A1, SR1, MD1] = gaussTridiagonalPP(A1_t, b1)
printf("\n Solución de A1*x = b1 usando ''gaussTridiagonalPP'' (con pivoteo):")
disp(x1)
printf("\n A1*x=")
disp(A1_t*x1)
printf("\n b1= ")
disp(b1)

