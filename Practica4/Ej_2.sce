//clear

//Ej2
//a)

function [x,a] = gausselim(A,b)
// Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
// dada la matriz de coeficientes A y el vector b.
// La función implementa el método de Eliminación Gaussiana sin pivoteo.  

[nA,mA] = size(A) 
[nb,mb] = size(b)

if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
elseif mA<>nb then
    error('gausselim - dimensiones incompatibles entre A y b');
    abort;
end;

a = [A b]; // Matriz aumentada

// Eliminación progresiva
n = nA;
for k=1:n-1
    for i=k+1:n
        for j=k+1:n+1
            a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k);
        end;
        for j=1:k        // no hace falta para calcular la solución x
            a(i,j) = 0;  // no hace falta para calcular la solución x
        end              // no hace falta para calcular la solución x
    end;
end;

// Sustitución regresiva
x(n) = a(n,n+1)/a(n,n);
for i = n-1:-1:1
    sumk = 0
    for k=i+1:n
        sumk = sumk + a(i,k)*x(k);
    end;
    x(i) = (a(i,n+1)-sumk)/a(i,i);
end;
endfunction

// b)

A1 = [1 1 0 3; 2 1 -1 1; 3 -1 -1 2; -1 2 3 -1]
b1 = [4 1 -3 4]'

[x,a] = gausselim(A1,b1)
printf("\n La solución de A1*x = b1: ")
disp(x)
disp(a)

A2 = [1 -1 2 -1; 2 -2 3 -3; 1 1 1 0; 1 -1 4 3]
b2 = [-8 -20 -2 4]'

[x2,a2] = gausselim(A2,b2)
printf("\n La solución de A2*x = b2: ")
disp(x2)
disp(a2)

A3 = [1 1 0 4; 2 1 -1 1; 4 -1 -2 2; 3 -1 -1 2]
b3 = [2 1 0 -3]'

[x3,a3] = gausselim(A3,b3)
printf("\n La solución de A3*x = b3: ")
disp(x3)
disp(a3)

// !--error 27 
//Division by zero...
//at line      24 of function gausselim called by :  
//[x2,a2] = gausselim(A2,b2)

// c
// La modificación de la función GaussElim, que cuenta rl número de operaciónes realizadas. 
// Input: 
// A - matriz de coeficientes
// b - vector 
// Output: 
// x - solución de ecuaciones 
// a - matriz ampliada
// SR - número de operaciones de sumas y restas
// MD - número de operaciones de multiplicaciones y divisiones


function [x,a, SR, MD] = gausselimCount(A,b)
// Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
// dada la matriz de coeficientes A y el vector b.
// La función implementa el método de Eliminación Gaussiana sin pivoteo y cuenta las operaciones realizadas  

[nA,mA] = size(A) 
[nb,mb] = size(b)

if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
elseif mA<>nb then
    error('gausselim - dimensiones incompatibles entre A y b');
    abort;
end;

a = [A b]; // Matriz aumentada
SR = 0;
MD = 0;

// Eliminación progresiva
n = nA;
for k=1:n-1
    for i=k+1:n
        for j=k+1:n+1
            a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k);
            SR = SR +1;
            MD = MD +2;
        end;
        for j=1:k        // no hace falta para calcular la solución x
            a(i,j) = 0;  // no hace falta para calcular la solución x
        end              // no hace falta para calcular la solución x
    end;
end;

// Sustitución regresiva
x(n) = a(n,n+1)/a(n,n);
MD = MD + 1;
for i = n-1:-1:1
    sumk = 0
    for k=i+1:n
        sumk = sumk + a(i,k)*x(k);
        SR = SR + 1;
        MD = MD + 1; 
    end;
    x(i) = (a(i,n+1)-sumk)/a(i,i);
    SR = SR + 1;
    MD = MD + 1;    
end;
endfunction

//A1 = [1 1 0 3; 2 1 -1 1; 3 -1 -1 2; -1 2 3 -1]
//b1 = [4 1 -3 4]'

[x1,a1,SR1,MD1] = gausselimCount(A1,b1)
printf("\n La solución de A1*x = b1:")
disp(x1)
disp(a1)
printf("\n En número de operaciones SR1: ")
disp(SR1)
printf("\n En número de operaciones MD1: ")
disp(MD1)

//A2 = [1 -1 2 -1; 2 -2 3 -3; 1 1 1 0; 1 -1 4 3]
//b2 = [-8 -20 -2 4]'

[x2,a2,SR2,MD2] = gausselimCount(A2,b2)
printf("\n La solución de A2*x = b2:")
disp(x2)
disp(a2)
printf("\n En número de operaciones SR2: ")
disp(SR2)
printf("\n En número de operaciones MD2: ")
disp(MD2)

//A3 = [1 1 0 4; 2 1 -1 1; 4 -1 -2 2; 3 -1 -1 2]
//b3 = [2 1 0 -3]'

[x2,a2,SR3,MD3] = gausselimCount(A3,b3)
printf("\n La solución de A3*x = b3:")
disp(x3)
disp(a3)
printf("\n En número de operaciones SR3: ")
disp(SR3)
printf("\n En número de operaciones MD3: ")
disp(MD3)

// d 
// Una versión de la función GaussElim más corta, usando operaciónes con submtrices 

function [x,a] = gausselim2(A,b)
// Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
// dada la matriz de coeficientes A y el vector b.
// La función implementa el método de Eliminación Gaussiana sin pivoteo.  

[nA,mA] = size(A) 
[nb,mb] = size(b)

if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
elseif mA<>nb then
    error('gausselim - dimensiones incompatibles entre A y b');
    abort;
end;

a = [A b]; // Matriz aumentada

// Eliminación progresiva
n = nA;
for k=1:n-1
    for i=k+1:n
        mjk = a(i,k)/a(k,k);
        a(i,k+1:n+1) = a(i, k+1:n+1) - mjk * a(k,k+1:n+1);
         //a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k);
        a(i,1:k) = 0;  // no hace falta para calcular la solución x
    end;
end;

// Sustitución regresiva
x(n) = a(n,n+1)/a(n,n);
for i = n-1:-1:1
    sumk = 0
    sumk = sumk + a(i,i+1:n)*x(i+1:n);
    x(i) = (a(i,n+1)-sumk)/a(i,i);
end;
endfunction


[x12,a12] = gausselim2(A1,b1)
printf("\n Solución de A1*x = b1 usando ''gausselim2'': ")
disp(x12)
disp(a12)   



// Método de Gauss
// (Otra forma)
// Input: 
// A - matriz de coeficientes
// b - vector 
// Output: 
// s1 - matriz triangular superior obtenida de A 
// s2 - el vector obtenido después de apicar el algorito de Gauss al vector b  

//function [s1, s2] = gauss(A, b)
//a = size(A)
//n = a(1)
//for i = 1:(n-1)
//for j = (i+1):a(1)
//mjk = A(j,i)/A(i,i)
//A(j,i)=0
//A(j,i+1:n) = A(j,i+1:n) - mjk*A(i,i+1:n)
//b(j) = b(j) - mjk*b(i)
//end
//end
//s1 = A
//s2 = b
//endfunction
